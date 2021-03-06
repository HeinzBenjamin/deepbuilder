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
import json, os, torch, copy


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
        policy,
    )

    replay_buffer_expl = EnvReplayBuffer(
        variant['replay_buffer_size'],
        expl_env,
    )

    replay_buffer_eval = EnvReplayBuffer(
        int(variant['replay_buffer_size'] * (float(args.num_plays_eval) / float(args.num_plays_expl))),
        eval_env,
    )

    if resumed:
        replay_buffer_expl._actions = params['replay_buffer_expl/actions']
        replay_buffer_expl._env_infos = params['replay_buffer_expl/env_infos']
        replay_buffer_expl._next_obs = params['replay_buffer_expl/next_obs']
        replay_buffer_expl._observations = params['replay_buffer_expl/observations']
        replay_buffer_expl._rewards = params['replay_buffer_expl/rewards']
        replay_buffer_expl._size = params['replay_buffer_expl/size']
        replay_buffer_expl._terminals = params['replay_buffer_expl/terminals']
        replay_buffer_expl._top = params['replay_buffer_expl/top']

        replay_buffer_eval._actions = params['replay_buffer_eval/actions']
        replay_buffer_eval._env_infos = params['replay_buffer_eval/env_infos']
        replay_buffer_eval._next_obs = params['replay_buffer_eval/next_obs']
        replay_buffer_eval._observations = params['replay_buffer_eval/observations']
        replay_buffer_eval._rewards = params['replay_buffer_eval/rewards']
        replay_buffer_eval._size = params['replay_buffer_eval/size']
        replay_buffer_eval._terminals = params['replay_buffer_eval/terminals']
        replay_buffer_eval._top = params['replay_buffer_eval/top']

    elif args.replay_add_sess_name != '':
        _, other_params = doc.load_rklit_file(args.replay_add_sess_name)
        num_samples = int(args.replay_add_num_samples)
        replay_buffer_expl._size = 0
        replay_buffer_expl._top = 0
        print("Loading "+str(num_samples)+" batch samples from session " + args.replay_add_sess_name)
        zeroes = []
        offset = 0
        for i in range(num_samples):
            act = other_params['replay_buffer_expl/actions'][i]
            obs = other_params['replay_buffer_expl/observations'][i]
            if act.min() == 0.0 and act.max() == 0.0 and obs.min() == 0.0 and obs.max() == 0.0:
                zeroes.append(i)
                continue

            replay_buffer_expl._actions[offset] = copy.deepcopy(act.tolist())
            replay_buffer_expl._next_obs[offset] = copy.deepcopy(other_params['replay_buffer_expl/next_obs'][i].tolist())
            replay_buffer_expl._observations[offset] = copy.deepcopy(obs.tolist())
            replay_buffer_expl._rewards[offset] = copy.deepcopy(other_params['replay_buffer_expl/rewards'][i].tolist())
            replay_buffer_expl._terminals[offset] = copy.deepcopy(other_params['replay_buffer_expl/terminals'][i].tolist())
            replay_buffer_expl._size += 1
            replay_buffer_expl._top += 1
            offset += 1

        print("Detected and ignored "+str(len(zeroes))+" zero samples in replay buffer. Total num samples loaded into replay buffer: " + str(replay_buffer_expl._size))
        other_params = {}

    trainer = SACTrainer(
        env=eval_env,
        policy=policy,
        qf1=qf1,
        qf2=qf2,
        target_qf1=target_qf1,
        target_qf2=target_qf2,
        **variant['trainer_kwargs'],
        starting_train_steps = 0 if not resumed else (params['replay_buffer_expl/top']*variant['algorithm_kwargs']['num_trains_per_train_loop']),
    )

    algorithm = TorchBatchRLAlgorithm(
        trainer=trainer,
        exploration_env=expl_env,
        evaluation_env=eval_env,
        exploration_data_collector=expl_path_collector,
        evaluation_data_collector=eval_path_collector,
        replay_buffer_eval=replay_buffer_eval,
        replay_buffer_expl=replay_buffer_expl,
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
    parser.add_argument('--save_agent_every', type=int, default=50) #intermediate save copies are made every (num_plays_expl + num_plays_eval) * save_agent_every
    parser.add_argument('--resume', type=int, default=0)
    parser.add_argument('--rnd_plays', type=int, default=0)
    parser.add_argument('--height_field_dim', type=int, default=12)

    parser.add_argument('--act_dim',type=int,default=6)    
    parser.add_argument('--box_dim',type=int,default=7)
    parser.add_argument('--hid_dim',type=int,default=256)
    parser.add_argument('--max_num_boxes',type=int,default=20)   

    #args relevant for agent setup and learning hyper params
    parser.add_argument('--replay_buffer_size',type=int,default=500000) #applies to replay_buffer_expl; replay_buffer_eval is scaled according to their relation of num_plays
    parser.add_argument('--value_lr',type=float,default=3e-4)
    parser.add_argument('--soft_q_lr',type=float,default=3e-4)
    parser.add_argument('--policy_lr',type=float,default=3e-4)

    #training-specific args
    parser.add_argument('--num_epochs',type=int,default=50000)
    parser.add_argument('--num_plays_eval',type=int,default=1)
    parser.add_argument('--num_plays_expl',type=int,default=10) #params.pkl is saved every (num_plays_expl + num_plays_eval) plays
    parser.add_argument('--num_trains_per_train_loop',type=int,default=200)
    parser.add_argument('--batch_size',type=int,default=256)

    parser.add_argument('--replay_add_sess_name', type=str, default='replay-buffer-222k')
    parser.add_argument('--replay_add_num_samples', type=str, default=222747)

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
            num_expl_steps_per_train_loop=args.num_plays_expl * (1+args.max_num_boxes),
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
    
    setup_logger(args.session_name, variant=variant, snapshot_mode="gap_and_last", snapshot_gap=args.save_agent_every)

    
    ptu.set_gpu_mode(True)  # optionally set the GPU (default=False)
    experiment(args, variant)
