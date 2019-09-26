import rlkit.torch.pytorch_util as ptu
from rlkit.data_management.env_replay_buffer import EnvReplayBuffer
from rlkit.envs.wrappers import NormalizedBoxEnv
from rlkit.launchers.launcher_util import setup_logger
from rlkit.samplers.data_collector import MdpPathCollector
from rlkit.torch.sac.policies import TanhGaussianPolicy, MakeDeterministic
from rlkit.torch.sac.sac import SACTrainer
from rlkit.torch.networks import FlattenMlp
from rlkit.torch.torch_rl_algorithm import TorchBatchRLAlgorithm

from modules import environment as env
from modules import networks as n
from modules import stuff
from modules import documentation as doc
from modules.settings import *
import json, os, torch


def experiment(args, variant):
    #eval_env = gym.make('FetchReach-v1')
    #expl_env = gym.make('FetchReach-v1')    

    core_env = env.DeepBuilderEnv(args.session_name, args.act_dim, args.box_dim, args.max_num_boxes, args.height_field_dim)
    eval_env = stuff.NormalizedActions(core_env)
    expl_env = stuff.NormalizedActions(core_env)
    obs_dim = expl_env.observation_space.low.size
    action_dim = eval_env.action_space.low.size

    resumed = args.resume == 1

    if resumed:
        variant, params = doc.load_rklit_file(args.session_name)
        variant['algorithm_kwargs']['min_num_steps_before_training']=0

    M = variant['layer_size']

    qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        hidden_sizes=[M, M],
    ) if not resumed else params['trainer/qf1']

    qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        hidden_sizes=[M, M],
    ) if not resumed else params['trainer/qf2']

    target_qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        hidden_sizes=[M, M],
    ) if not resumed else params['trainer/target_qf1']

    target_qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        hidden_sizes=[M, M],
    ) if not resumed else params['trainer/target_qf2']

    policy = TanhGaussianPolicy(
        obs_dim=obs_dim,
        action_dim=action_dim,
        hidden_sizes=[M, M],
    ) if not resumed else params['trainer/policy']

    eval_policy = MakeDeterministic(policy) if not resumed else params['evaluation/policy']
    
    eval_path_collector = MdpPathCollector(
        eval_env,
        eval_policy,
    )

    expl_path_collector = MdpPathCollector(
        expl_env,
        policy if not resumed else params['exploration/policy'],
    )
    replay_buffer = EnvReplayBuffer(
        variant['replay_buffer_size'],
        expl_env,
    )

    if resumed:
        replay_buffer._actions = params['replay_buffer/actions']
        replay_buffer._env_infos = params['replay_buffer/env_infos']
        replay_buffer._next_obs = params['replay_buffer/next_obs']
        replay_buffer._observations = params['replay_buffer/observations']
        replay_buffer._rewards = params['replay_buffer/rewards']
        replay_buffer._size = params['replay_buffer/size']
        replay_buffer._terminals = params['replay_buffer/terminals']
        replay_buffer._top = params['replay_buffer/top']

    elif args.replay_add_sess_name_1 != '':
        _, other_params = doc.load_rklit_file(args.replay_add_sess_name_1)
        num_samples = int(args.replay_add_num_samples_1)
        replay_buffer._size = 0
        replay_buffer._top = 0
        offset = 0
        print("Loading "+str(num_samples)+" batch samples from session " + args.replay_add_sess_name_1)
        for i in range(num_samples):            
            replay_buffer._actions[i] = other_params['replay_buffer/actions'][i]
            replay_buffer._next_obs[i] = other_params['replay_buffer/next_obs'][i]
            replay_buffer._observations[i] = other_params['replay_buffer/observations'][i]
            replay_buffer._rewards[i] = other_params['replay_buffer/rewards'][i]
            replay_buffer._terminals[i] = other_params['replay_buffer/terminals'][i]
            replay_buffer._size += 1
            replay_buffer._top += 1
            offset+=1

        if args.replay_add_sess_name_2 != '':
            _, other_params = doc.load_rklit_file(args.replay_add_sess_name_2)
            num_samples = int(args.replay_add_num_samples_2)
            print("Loading "+str(num_samples)+" batch samples from session " + args.replay_add_sess_name_2)
            for i in range(num_samples):            
                replay_buffer._actions[offset+i] = other_params['replay_buffer/actions'][i]
                replay_buffer._next_obs[offset+i] = other_params['replay_buffer/next_obs'][i]
                replay_buffer._observations[offset+i] = other_params['replay_buffer/observations'][i]
                replay_buffer._rewards[offset+i] = other_params['replay_buffer/rewards'][i]
                replay_buffer._terminals[offset+i] = other_params['replay_buffer/terminals'][i]
                replay_buffer._size += 1
                replay_buffer._top += 1
                offset+=1

        if args.replay_add_sess_name_3 != '':
            _, other_params = doc.load_rklit_file(args.replay_add_sess_name_3)
            num_samples = int(args.replay_add_num_samples_3)
            print("Loading "+str(num_samples)+" batch samples from session " + args.replay_add_sess_name_3)
            for i in range(num_samples):            
                replay_buffer._actions[offset+i] = other_params['replay_buffer/actions'][i]
                replay_buffer._next_obs[offset+i] = other_params['replay_buffer/next_obs'][i]
                replay_buffer._observations[offset+i] = other_params['replay_buffer/observations'][i]
                replay_buffer._rewards[offset+i] = other_params['replay_buffer/rewards'][i]
                replay_buffer._terminals[offset+i] = other_params['replay_buffer/terminals'][i]
                replay_buffer._size += 1
                replay_buffer._top += 1
                offset+=1
            
            del other_params

    trainer = SACTrainer(
        env=eval_env,
        policy=policy,
        qf1=qf1,
        qf2=qf2,
        target_qf1=target_qf1,
        target_qf2=target_qf2,
        **variant['trainer_kwargs']
    )

    algorithm = TorchBatchRLAlgorithm(
        trainer=trainer,
        exploration_env=expl_env,
        evaluation_env=eval_env,
        exploration_data_collector=expl_path_collector,
        evaluation_data_collector=eval_path_collector,
        replay_buffer=replay_buffer,
        **variant['algorithm_kwargs']
    )

    algorithm.to(ptu.device)
    algorithm.train()




if __name__ == "__main__":
    #deepbuilder args
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--session_name',type=str)
    parser.add_argument('--use_robot',type=bool, default=False)
    parser.add_argument('--docu_nets', type=bool, default=False)
    parser.add_argument('--docu_data', type=bool, default=True)
    parser.add_argument('--docu_pics', type=bool, default=False)
    parser.add_argument('--save_agent_every', type=int, default=50)
    parser.add_argument('--resume', type=int, default=0)
    parser.add_argument('--rnd_plays', type=int, default=0)
    parser.add_argument('--height_field_dim', type=int, default=12)

    parser.add_argument('--act_dim',type=int,default=6)    
    parser.add_argument('--box_dim',type=int,default=7)
    parser.add_argument('--hid_dim',type=int,default=1)
    parser.add_argument('--max_num_boxes',type=int,default=20)   

    #args relevant for agent setup and learning hyper params
    parser.add_argument('--replay_buffer_size',type=int,default=-1)
    parser.add_argument('--value_lr',type=float,default=3e-4)
    parser.add_argument('--soft_q_lr',type=float,default=3e-4)
    parser.add_argument('--policy_lr',type=float,default=3e-4)

    #training-specific args
    parser.add_argument('--num_epochs',type=int,default=1)
    parser.add_argument('--num_plays_eval',type=int,default=1)
    parser.add_argument('--num_plays_train',type=int,default=1)
    parser.add_argument('--num_trains_per_train_loop',type=int,default=1)
    parser.add_argument('--batch_size',type=int,default=128)

    parser.add_argument('--replay_add_sess_name_1', type=str, default='')
    parser.add_argument('--replay_add_num_samples_1', type=str, default=0)

    parser.add_argument('--replay_add_sess_name_2', type=str, default='')
    parser.add_argument('--replay_add_num_samples_2', type=str, default=0)

    parser.add_argument('--replay_add_sess_name_3', type=str, default='')
    parser.add_argument('--replay_add_num_samples_3', type=str, default=0)

    args=parser.parse_args()


    # noinspection PyTypeChecker
    variant = dict(
        algorithm="SAC",
        version="normal",
        layer_size=args.hid_dim,
        replay_buffer_size=args.replay_buffer_size,
        algorithm_kwargs=dict(
            num_epochs=args.num_epochs,
            min_num_steps_before_training=args.rnd_plays * (1+args.max_num_boxes),
            num_eval_steps_per_epoch=args.num_plays_eval * (1+args.max_num_boxes),
            num_trains_per_train_loop=args.num_trains_per_train_loop,
            num_expl_steps_per_train_loop=args.num_plays_train * (1+args.max_num_boxes),
            max_path_length=args.max_num_boxes+1,
            batch_size=args.batch_size,
        ),
        trainer_kwargs=dict(
            discount=0.99,
            soft_target_tau=5e-3,
            target_update_period=1,
            policy_lr=args.policy_lr,
            qf_lr=args.soft_q_lr,
            reward_scale=1.0,
            use_automatic_entropy_tuning=True,
        ),
    )
    
    setup_logger(args.session_name, variant=variant)
    args.replay_buffer_size = args.replay_add_num_samples_1 + args.replay_add_num_samples_2 + args.replay_add_num_samples_3

    
    ptu.set_gpu_mode(True)  # optionally set the GPU (default=False)
    experiment(args, variant)