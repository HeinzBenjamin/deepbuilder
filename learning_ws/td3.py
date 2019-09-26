import rlkit.torch.pytorch_util as ptu
from rlkit.data_management.env_replay_buffer import EnvReplayBuffer
from rlkit.envs.wrappers import NormalizedBoxEnv
from rlkit.exploration_strategies.base import \
    PolicyWrappedWithExplorationStrategy
from rlkit.exploration_strategies.gaussian_strategy import GaussianStrategy
from rlkit.launchers.launcher_util import setup_logger
from rlkit.samplers.data_collector import MdpPathCollector
from rlkit.torch.networks import FlattenMlp, TanhMlpPolicy
from rlkit.torch.td3.td3 import TD3Trainer
from rlkit.torch.torch_rl_algorithm import TorchBatchRLAlgorithm

from modules import environment as env
from modules import networks as n
from modules import stuff
from modules import documentation as doc
from modules.settings import *
import json, os, torch, copy


def experiment(args, variant): 

    core_env = env.DeepBuilderEnv(args.session_name, args.act_dim, args.box_dim, args.max_num_boxes, args.height_field_dim)
    eval_env = stuff.NormalizedActions(core_env)
    expl_env = stuff.NormalizedActions(core_env)
    obs_dim = expl_env.observation_space.low.size
    action_dim = eval_env.action_space.low.size

    resumed = args.resume == 1

    if resumed:
        variant, params = doc.load_rklit_file(args.session_name)
        variant['algorithm_kwargs']['min_num_steps_before_training']=0

    qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not resumed else params['trainer/qf1']

    qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not resumed else params['trainer/qf2']

    target_qf1 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not resumed else params['trainer/target_qf1']

    target_qf2 = FlattenMlp(
        input_size=obs_dim + action_dim,
        output_size=1,
        **variant['qf_kwargs']
    ) if not resumed else params['trainer/target_qf2']

    policy = TanhMlpPolicy(
        input_size=obs_dim,
        output_size=action_dim,
        **variant['policy_kwargs']
    ) if not resumed else params['trainer/policy']

    target_policy = TanhMlpPolicy(
        input_size=obs_dim,
        output_size=action_dim,
        **variant['policy_kwargs']
    ) if not resumed else params['trainer/target_policy']

    es = GaussianStrategy(
        action_space=expl_env.action_space,
        max_sigma=0.1,
        min_sigma=0.1,  # Constant sigma
    ) if not resumed else params['trainer/strategy']

    exploration_policy = PolicyWrappedWithExplorationStrategy(
        exploration_strategy=es,
        policy=policy,
    )

    eval_path_collector = MdpPathCollector(
        eval_env,
        policy,
    )

    expl_path_collector = MdpPathCollector(
        expl_env,
        exploration_policy,
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

    elif args.replay_add_sess_name != '':
        _, other_params = doc.load_rklit_file(args.replay_add_sess_name)
        num_samples = int(args.replay_add_num_samples)
        replay_buffer._size = 0
        replay_buffer._top = 0
        print("Loading "+str(num_samples)+" batch samples from session " + args.replay_add_sess_name)
        for i in range(num_samples):
            replay_buffer._actions[i] = copy.deepcopy(other_params['replay_buffer/actions'][i].tolist())
            replay_buffer._next_obs[i] = copy.deepcopy(other_params['replay_buffer/next_obs'][i].tolist())
            replay_buffer._observations[i] = copy.deepcopy(other_params['replay_buffer/observations'][i].tolist())
            replay_buffer._rewards[i] = copy.deepcopy(other_params['replay_buffer/rewards'][i].tolist())
            replay_buffer._terminals[i] = copy.deepcopy(other_params['replay_buffer/terminals'][i].tolist())
            replay_buffer._size += 1
            replay_buffer._top += 1

        other_params = {}

    trainer = TD3Trainer(
        policy=policy,
        qf1=qf1,
        qf2=qf2,
        target_qf1=target_qf1,
        target_qf2=target_qf2,
        target_policy=target_policy,
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
    parser.add_argument('--save_agent_every', type=int, default=1)
    parser.add_argument('--resume', type=int, default=0)
    parser.add_argument('--rnd_plays', type=int, default=0)
    parser.add_argument('--height_field_dim', type=int, default=12)

    parser.add_argument('--act_dim',type=int,default=6)    
    parser.add_argument('--box_dim',type=int,default=7)
    parser.add_argument('--hid_dim',type=int,default=256)
    parser.add_argument('--max_num_boxes',type=int,default=20)   

    #args relevant for agent setup and learning hyper params
    parser.add_argument('--replay_buffer_size',type=int,default=210000)
    parser.add_argument('--value_lr',type=float,default=3e-4)
    parser.add_argument('--soft_q_lr',type=float,default=3e-4)
    parser.add_argument('--policy_lr',type=float,default=3e-4)

    #training-specific args
    parser.add_argument('--num_epochs',type=int,default=50000)
    parser.add_argument('--num_plays_eval',type=int,default=10)
    parser.add_argument('--num_plays_expl',type=int,default=40)
    parser.add_argument('--num_trains_per_train_loop',type=int,default=500)
    parser.add_argument('--batch_size',type=int,default=256)

    parser.add_argument('--replay_add_sess_name', type=str, default='')
    parser.add_argument('--replay_add_num_samples', type=str, default=0)

    args=parser.parse_args()


    # noinspection PyTypeChecker
    variant = dict(
        algorithm_kwargs=dict(
            num_epochs=args.num_epochs,
            min_num_steps_before_training=args.rnd_plays * (1+args.max_num_boxes),
            num_eval_steps_per_epoch=args.num_plays_eval * (1+args.max_num_boxes),
            num_trains_per_train_loop=args.num_trains_per_train_loop,
            num_expl_steps_per_train_loop=args.num_plays_expl * (1+args.max_num_boxes),
            max_path_length=args.max_num_boxes+1,
            batch_size=args.batch_size,
        ),
        trainer_kwargs=dict(
            discount=0.99,
        ),
        qf_kwargs=dict(
            hidden_sizes=[args.hid_dim, args.hid_dim],
        ),
        policy_kwargs=dict(
            hidden_sizes=[args.hid_dim, args.hid_dim],
        ),
        replay_buffer_size=args.replay_buffer_size,
    )

    setup_logger(args.session_name, variant=variant, snapshot_mode="gap_and_last", snapshot_gap=args.save_agent_every)

    
    ptu.set_gpu_mode(True)  # optionally set the GPU (default=False)
    experiment(args, variant)