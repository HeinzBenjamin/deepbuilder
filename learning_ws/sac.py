import gym, torch, os
import numpy as np
from termcolor import colored
import rlkit_db.torch.pytorch_util as ptu
from rlkit_db.data_management.obs_dict_replay_buffer import ObsDictRelabelingBuffer
from rlkit_db.launchers.launcher_util import setup_logger
from rlkit_db.samplers.data_collector import GoalConditionedPathCollector
from rlkit_db.torch.networks import FlattenMlp
from rlkit_db.torch.sac.policies import MakeDeterministic, TanhGaussianPolicy
from rlkit_db.torch.sac.sac import SACTrainer
from rlkit_db.torch.torch_rl_algorithm import TorchBatchRLAlgorithm
from modules import environment_goal as env

def reshape_rewards(environment, prev_data, buf_name):
    print("Reshaping rewards...")
    n = prev_data[buf_name+"/top"]
    add_inf = prev_data[buf_name+'/observation']['additional_info']
    rewards = np.zeros(shape=[n,1], dtype=np.float32)
    for i in range(n):
        inf = add_inf[i].tolist()
        path_planning_results = {}
        col = round(inf[0],1)
        path_planning_results['collisions'] = [col <= 0.0, col == 0.2, col == 0.4, col == 0.6, col <= 0.8]
        print_results = {}
        print_results['dist_to_state_mesh'] = inf[1]
        print_results['printability_ratio'] = inf[2]
        print_results['tilt_angle'] = inf[3]
        print_results['current_height'] = inf[4]
        print_results['current_area'] = inf[5]
        rewards[i] = environment.shape_reward(path_planning_results, print_results)
    print('...done')
    return rewards

def experiment(variant, args):
    environment = env.NormalizedActions(env.DeepBuilderShapedEnv(**variant['env_kwargs']))

    observation_key = 'observation'
    desired_goal_key = 'desired_goal'
    achieved_goal_key = desired_goal_key.replace("desired", "achieved")
    additional_info_key = 'additional_info'

    replay_buffer_expl = ObsDictRelabelingBuffer(
        env=environment,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
        achieved_goal_key=achieved_goal_key,
        additional_info_key=additional_info_key,
        **variant['replay_buffer_kwargs']
    )

    replay_buffer_eval = ObsDictRelabelingBuffer(
        env=environment,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
        achieved_goal_key=achieved_goal_key,
        additional_info_key=additional_info_key,
        **variant['replay_buffer_kwargs']
    )

    
    prev_datas = []
    load_buffer = False
    load_networks = False

    if  variant['continue_training'] != '':
        print("Loading previous training parameters and replay buffer")
        prev_datas.append(torch.load(variant['continue_training']))
        load_buffer = True
        load_networks = True

    elif len(variant['reuse_replay_buffers']) > 0:
        for b in variant['reuse_replay_buffers']:
            print("Loading previous replay buffer")
            prev_datas.append(torch.load(b))
        load_buffer = True

    
    if len(prev_datas) > 0 and load_buffer:
        expl_offset = 0
        eval_offset = 0
        for prev_data in prev_datas:
            #exploration data
            n = prev_data['replay_buffer_expl/top']

            if n > 0:
                replay_buffer_expl._top = n + expl_offset
                replay_buffer_expl._size = n + expl_offset
                replay_buffer_expl._actions[expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/actions']
                replay_buffer_expl._terminals[expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/terminals']
                replay_buffer_expl._rewards[expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/rewards'] if not args.reshape_rewards else reshape_rewards(environment.env, prev_data, 'replay_buffer_expl')
                replay_buffer_expl._idx_to_future_obs_idx[expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/idx_to_future_obs_idx']

                replay_buffer_expl._obs['achieved_goal'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/observation']['achieved_goal']
                replay_buffer_expl._obs['desired_goal'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/observation']['desired_goal']
                replay_buffer_expl._obs['observation'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/observation']['observation']
                replay_buffer_expl._obs['additional_info'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/observation']['additional_info']

                replay_buffer_expl._next_obs['achieved_goal'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/next_obs']['achieved_goal']
                replay_buffer_expl._next_obs['desired_goal'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/next_obs']['desired_goal']
                replay_buffer_expl._next_obs['observation'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/next_obs']['observation']
                replay_buffer_expl._next_obs['additional_info'][expl_offset:n + expl_offset] = prev_data['replay_buffer_expl/next_obs']['additional_info']
                expl_offset += n

                print("Loaded shared exploration replay buffer of size: {}".format(replay_buffer_expl._size))
                print("Last expl buffer item:\n   action: {}\n   desired goal: {}\n   achieved goal: {}\n   observation: {}".format(replay_buffer_expl._actions[replay_buffer_expl._size-1], replay_buffer_expl._obs['achieved_goal'][replay_buffer_expl._size-1], replay_buffer_expl._obs['desired_goal'][replay_buffer_expl._size-1], replay_buffer_expl._obs['observation'][replay_buffer_expl._size-1]))
            
            else:
                print(colored("Loaded exploration replay buffer was empty! No data attached!", color='red'))
            

            #evaluation data
            n = prev_data['replay_buffer_eval/top']
            if n > 0:
                replay_buffer_eval._top = n + eval_offset
                replay_buffer_eval._size = n + eval_offset
                replay_buffer_eval._actions[eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/actions']
                replay_buffer_eval._terminals[eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/terminals']
                replay_buffer_expl._rewards[eval_offset:n + eval_offset] = prev_data['replay_buffer_expl/rewards'] if not args.reshape_rewards else reshape_rewards(env, prev_data)
                replay_buffer_eval._idx_to_future_obs_idx[eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/idx_to_future_obs_idx']

                replay_buffer_eval._obs['achieved_goal'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/observation']['achieved_goal']
                replay_buffer_eval._obs['desired_goal'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/observation']['desired_goal']
                replay_buffer_eval._obs['observation'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/observation']['observation']
                replay_buffer_eval._obs['additional_info'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/observation']['additional_info']

                replay_buffer_eval._next_obs['achieved_goal'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/next_obs']['achieved_goal']
                replay_buffer_eval._next_obs['desired_goal'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/next_obs']['desired_goal']
                replay_buffer_eval._next_obs['observation'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/next_obs']['observation']
                replay_buffer_eval._next_obs['additional_info'][eval_offset:n + eval_offset] = prev_data['replay_buffer_eval/next_obs']['additional_info']
                eval_offset += n

                print("Loaded shared evaluation replay buffer of size: {}".format(replay_buffer_eval._size))
                print("Last eval buffer item:\n   action: {}\n   desired goal: {}\n   achieved goal: {}\n   observation: {}".format(replay_buffer_eval._actions[replay_buffer_eval._size-1], replay_buffer_eval._obs['achieved_goal'][replay_buffer_eval._size-1], replay_buffer_eval._obs['desired_goal'][replay_buffer_eval._size-1], replay_buffer_eval._obs['observation'][replay_buffer_eval._size-1]))

            else:
                print(colored("Loaded evaluation replay buffer was empty! No data attached!", color='red'))
    

    obs_dim = environment.observation_space.spaces['observation'].low.size
    action_dim = environment.action_space.low.size

    qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/qf1']

    qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/qf2']

    target_qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/target_qf1']

    target_qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/target_qf2']

    policy = TanhGaussianPolicy(
        obs_dim=obs_dim,
        action_dim=action_dim,
        **variant['policy_kwargs']
    ) if not load_networks else prev_data['trainer/policy']

    eval_policy = MakeDeterministic(policy)
    trainer = SACTrainer(
        env=environment,
        policy=policy,
        qf1=qf1,
        qf2=qf2,
        target_qf1=target_qf1,
        target_qf2=target_qf2,
        **variant['sac_trainer_kwargs']
    )

    eval_path_collector = GoalConditionedPathCollector(
        environment,
        eval_policy,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
    )
    expl_path_collector = GoalConditionedPathCollector(
        environment,
        policy,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
    )
    algorithm = TorchBatchRLAlgorithm(
        trainer=trainer,
        environment=environment,
        exploration_data_collector=expl_path_collector,
        evaluation_data_collector=eval_path_collector,
        replay_buffer_expl=replay_buffer_expl,
        replay_buffer_eval=replay_buffer_eval,
        **variant['algo_kwargs']
    )

    #ptu.set_gpu_mode(True)
    algorithm.to(ptu.device)
    print("Everything set up. Starting to train")
    algorithm.train()



if __name__ == "__main__":

    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--session_name',type=str, default = '200221-train-sac')
    parser.add_argument('--continue_session',type=bool, default = False)
    parser.add_argument('--reuse_replay_buffers',type=str, default = '/home/ros/deepbuilder/learning_ws/data/200221-collect-sac/200221-collect-sac_2020_02_21_14_01_12_0000--s-0/params.pkl,/home/ros/deepbuilder/learning_ws/data/200221-collect-sac-her/200221-collect-sac-her_2020_02_21_14_01_25_0000--s-0/params.pkl')
    parser.add_argument('--rhino_pid',type=int, default = 7232)
    parser.add_argument('--reshape_rewards',type=bool, default = True)
    parser.add_argument('--epoch_length', type=int, default=20)
    parser.add_argument('--trains_per_epoch', type=int, default=400)

    args=parser.parse_args()

    continue_training = ''
    if args.continue_session:
        sess_folder = '/home/ros/deepbuilder/learning_ws/data/' + args.session_name
        dirs = os.listdir(sess_folder)
        for d in reversed(dirs):
            file_path = sess_folder + "/" + d + "/params.pkl"
            if os.path.isfile(file_path):
                continue_training = file_path
                break

    reuse_replay_buffers = []
    if args.reuse_replay_buffers != '':
        reuse_replay_buffers = args.reuse_replay_buffers.split(',')


    variant = dict(
        algorithm='SAC',
        version='normal',
        reuse_replay_buffers=reuse_replay_buffers,
        continue_training=continue_training,
        env_kwargs=dict(
            session_name=args.session_name,            
            rhino_pid=args.rhino_pid,
            is_simulation=True,
            action_dim=7, 
            observation_dim=144,
            goal_dim=3,
            observation_noise_mean=0.0,
            observation_noise_std=0.0002,
            max_steps_per_play=30,
            terminate_at_collision=False,
            populate_simulation=0.5 #IMPORTANT!!! CHANGE WHEN NOT SIMULATION
        ),
        algo_kwargs=dict(
            batch_size=128,
            num_epochs=99999,
            num_eval_plays_per_epoch=0,
            num_expl_plays_per_epoch=args.epoch_length,            
            num_train_loops_per_epoch=args.trains_per_epoch,
            num_plays_before_training=0,            
        ),
        sac_trainer_kwargs=dict(
            discount=0.99,
            soft_target_tau=5e-3,
            target_update_period=1,
            policy_lr=3E-4,
            qf_lr=3E-4,
            reward_scale=1,
            use_automatic_entropy_tuning=True,
        ),
        replay_buffer_kwargs=dict(
            max_size=int(1E6)
        ),
        qf_kwargs=dict(
            hidden_sizes=[432, 360, 360],
        ),
        policy_kwargs=dict(
            hidden_sizes=[432, 360, 360],
        ),
    )
    setup_logger(args.session_name, variant=variant, snapshot_mode="gap_and_last", snapshot_gap=10)
    experiment(variant, args)