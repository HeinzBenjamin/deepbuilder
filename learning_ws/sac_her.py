import gym, torch
from termcolor import colored
import rlkit_db.torch.pytorch_util as ptu
from rlkit_db.data_management.obs_dict_replay_buffer import ObsDictRelabelingBuffer
from rlkit_db.launchers.launcher_util import setup_logger
from rlkit_db.samplers.data_collector import GoalConditionedPathCollector
from rlkit_db.torch.her.her import HERTrainer
from rlkit_db.torch.networks import FlattenMlp
from rlkit_db.torch.sac.policies import MakeDeterministic, TanhGaussianPolicy
from rlkit_db.torch.sac.sac import SACTrainer
from rlkit_db.torch.torch_rl_algorithm import TorchBatchRLAlgorithm
from modules import environment_goal as env

def experiment(variant):
    environment = env.NormalizedActions(env.DeepBuilderGoalEnv(**variant['env_kwargs']))

    observation_key = 'observation'
    desired_goal_key = 'desired_goal'

    achieved_goal_key = desired_goal_key.replace("desired", "achieved")
    replay_buffer_expl = ObsDictRelabelingBuffer(
        env=environment,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
        achieved_goal_key=achieved_goal_key,
        **variant['replay_buffer_kwargs']
    )
    replay_buffer_eval = ObsDictRelabelingBuffer(
        env=environment,
        observation_key=observation_key,
        desired_goal_key=desired_goal_key,
        achieved_goal_key=achieved_goal_key,
        **variant['replay_buffer_kwargs']
    )

    
    prev_data = None
    load_buffer = False
    load_networks = False

    if  variant['continue_training'] != '':
        print("Loading previous training parameters and replay buffer")
        prev_data = torch.load(variant['continue_training'])
        load_buffer = True
        load_networks = True

    elif variant['reuse_replay_buffer'] != '':
        print("Loading previous replay buffer")
        prev_data = torch.load(variant['reuse_replay_buffer'])
        load_buffer = True

    if prev_data != None and load_buffer:
        #exploration data
        n = prev_data['replay_buffer_expl/top']

        if n > 0:
            replay_buffer_expl._top = n
            replay_buffer_expl._size = n
            replay_buffer_expl._actions[:n] = prev_data['replay_buffer_expl/actions']
            replay_buffer_expl._terminals[:n] = prev_data['replay_buffer_expl/terminals']
            replay_buffer_expl._idx_to_future_obs_idx[:n] = prev_data['replay_buffer_expl/idx_to_future_obs_idx']

            replay_buffer_expl._obs['achieved_goal'][:n] = prev_data['replay_buffer_expl/observation']['achieved_goal']
            replay_buffer_expl._obs['desired_goal'][:n] = prev_data['replay_buffer_expl/observation']['desired_goal']
            replay_buffer_expl._obs['observation'][:n] = prev_data['replay_buffer_expl/observation']['observation']

            replay_buffer_expl._next_obs['achieved_goal'][:n] = prev_data['replay_buffer_expl/next_obs']['achieved_goal']
            replay_buffer_expl._next_obs['desired_goal'][:n] = prev_data['replay_buffer_expl/next_obs']['desired_goal']
            replay_buffer_expl._next_obs['observation'][:n] = prev_data['replay_buffer_expl/next_obs']['observation']

            print("Loaded shared exploration replay buffer of size: {}".format(replay_buffer_expl._size))
            print("Last expl buffer item:\n   action: {}\n   desired goal: {}\n   achieved goal: {}\n   observation: {}".format(replay_buffer_expl._actions[replay_buffer_expl._size-1], replay_buffer_expl._obs['achieved_goal'][replay_buffer_expl._size-1], replay_buffer_expl._obs['desired_goal'][replay_buffer_expl._size-1], replay_buffer_expl._obs['observation'][replay_buffer_expl._size-1]))
        else:
            print(colored("Loaded exploration replay buffer was empty! No data attached!", color='red'))

        #evaluation data
        n = prev_data['replay_buffer_eval/top']
        if n > 0:
            replay_buffer_eval._top = n
            replay_buffer_eval._size = n
            replay_buffer_eval._actions[:n] = prev_data['replay_buffer_eval/actions']
            replay_buffer_eval._terminals[:n] = prev_data['replay_buffer_eval/terminals']
            replay_buffer_eval._idx_to_future_obs_idx[:n] = prev_data['replay_buffer_eval/idx_to_future_obs_idx']

            replay_buffer_eval._obs['achieved_goal'][:n] = prev_data['replay_buffer_eval/observation']['achieved_goal']
            replay_buffer_eval._obs['desired_goal'][:n] = prev_data['replay_buffer_eval/observation']['desired_goal']
            replay_buffer_eval._obs['observation'][:n] = prev_data['replay_buffer_eval/observation']['observation']

            replay_buffer_eval._next_obs['achieved_goal'][:n] = prev_data['replay_buffer_eval/next_obs']['achieved_goal']
            replay_buffer_eval._next_obs['desired_goal'][:n] = prev_data['replay_buffer_eval/next_obs']['desired_goal']
            replay_buffer_eval._next_obs['observation'][:n] = prev_data['replay_buffer_eval/next_obs']['observation']

            print("Loaded shared evaluation replay buffer of size: {}".format(replay_buffer_eval._size))
            print("Last eval buffer item:\n   action: {}\n   desired goal: {}\n   achieved goal: {}\n   observation: {}".format(replay_buffer_eval._actions[replay_buffer_eval._size-1], replay_buffer_eval._obs['achieved_goal'][replay_buffer_eval._size-1], replay_buffer_eval._obs['desired_goal'][replay_buffer_eval._size-1], replay_buffer_eval._obs['observation'][replay_buffer_eval._size-1]))

        else:
            print(colored("Loaded evaluation replay buffer was empty! No data attached!", color='red'))


    obs_dim = environment.observation_space.spaces['observation'].low.size
    action_dim = environment.action_space.low.size
    goal_dim = environment.observation_space.spaces['desired_goal'].low.size
    qf1 = FlattenMlp(
        input_size=obs_dim + action_dim + goal_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/qf1']

    qf2 = FlattenMlp(
        input_size=obs_dim + action_dim + goal_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/qf2']

    target_qf1 = FlattenMlp(
        input_size=obs_dim + action_dim + goal_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/target_qf1']

    target_qf2 = FlattenMlp(
        input_size=obs_dim + action_dim + goal_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not load_networks else prev_data['trainer/target_qf2']

    policy = TanhGaussianPolicy(
        obs_dim=obs_dim + goal_dim,
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
    trainer = HERTrainer(trainer)
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
    algorithm.to(ptu.device)
    print("Everything set up. Starting to train")
    algorithm.train()



if __name__ == "__main__":

    session_name = "200213-real-print"

    variant = dict(
        algorithm='HER-SAC',
        version='normal',
        reuse_replay_buffer='',
        continue_training='/home/ros/deepbuilder/learning_ws/data/200116-hs-long-test/200116-hs-long-test_2020_02_07_18_41_25_0000--s-0/params.pkl',
        env_kwargs=dict(
            session_name=session_name,            
            rhino_pid=6160,
            is_simulation=False,
            action_dim=7, 
            observation_dim=144,
            goal_dim=10,
            observation_noise_mean=0.0,
            observation_noise_std=0.0002,
            max_steps_per_play=30,
            terminate_at_collision=False,
            populate_simulation=0.0 #IMPORTANT!!! CHANGE WHEN NOT SIMULATION
        ),
        algo_kwargs=dict(
            batch_size=256,
            num_epochs=99999,
            num_eval_plays_per_epoch=1,
            num_expl_plays_per_epoch=10,            
            num_train_loops_per_epoch=300,
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
            max_size=int(1E6),
            fraction_goals_rollout_goals=0.2,  # equal to k = 4 in HER paper
            fraction_goals_env_goals=0,
        ),
        qf_kwargs=dict(
            hidden_sizes=[400, 300],
        ),
        policy_kwargs=dict(
            hidden_sizes=[400, 300],
        ),
    )
    setup_logger(session_name, variant=variant, snapshot_mode="gap_and_last", snapshot_gap=20)
    experiment(variant)