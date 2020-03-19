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

def main(args, variant):

    files = args.buffer_names.split(',')
    ids = args.ids.split(',')
    data = torch.load(files[0])
    n = data['replay_buffer_expl/top']
    i = 1
    for _ in range(len(files)-1):
        new_data = torch.load(files[i])
        new_n = int(new_data['replay_buffer_expl/top'])
        _id = ids[i].split(':')
        for ii in range(2):
            _id[ii] = int(_id[ii]) if not _id[ii] == '' else new_n

        data['replay_buffer_expl/top'] += (_id[1] - _id[0])
        data['replay_buffer_expl/size'] += (_id[1] - _id[0])
        data['play'] += int((_id[1] - _id[0]) / 30) - 2
        data['epoch'] += int((_id[1] - _id[0]) / 30 / 20)
        data['train_step'] += new_data['train_step']
        
        data['replay_buffer_expl/actions'] = np.concatenate((data['replay_buffer_expl/actions'], new_data['replay_buffer_expl/actions'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/terminals'] = np.concatenate((data['replay_buffer_expl/terminals'], new_data['replay_buffer_expl/terminals'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/rewards'] = np.concatenate((data['replay_buffer_expl/rewards'], new_data['replay_buffer_expl/rewards'][_id[0]:_id[1]]), axis=0)

        data['replay_buffer_expl/observation']['achieved_goal'] = np.concatenate((data['replay_buffer_expl/observation']['achieved_goal'], new_data['replay_buffer_expl/observation']['achieved_goal'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/observation']['desired_goal'] = np.concatenate((data['replay_buffer_expl/observation']['desired_goal'], new_data['replay_buffer_expl/observation']['desired_goal'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/observation']['additional_info'] = np.concatenate((data['replay_buffer_expl/observation']['additional_info'], new_data['replay_buffer_expl/observation']['additional_info'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/observation']['observation'] = np.concatenate((data['replay_buffer_expl/observation']['observation'], new_data['replay_buffer_expl/observation']['observation'][_id[0]:_id[1]]), axis=0)

        data['replay_buffer_expl/next_obs']['achieved_goal'] = np.concatenate((data['replay_buffer_expl/next_obs']['achieved_goal'], new_data['replay_buffer_expl/next_obs']['achieved_goal'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/next_obs']['desired_goal'] = np.concatenate((data['replay_buffer_expl/next_obs']['desired_goal'], new_data['replay_buffer_expl/next_obs']['desired_goal'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/next_obs']['additional_info'] = np.concatenate((data['replay_buffer_expl/next_obs']['additional_info'], new_data['replay_buffer_expl/next_obs']['additional_info'][_id[0]:_id[1]]), axis=0)
        data['replay_buffer_expl/next_obs']['observation'] = np.concatenate((data['replay_buffer_expl/next_obs']['observation'], new_data['replay_buffer_expl/next_obs']['observation'][_id[0]:_id[1]]), axis=0)
        
        for iii in range(_id[0],_id[1]):
            new_data['replay_buffer_expl/idx_to_future_obs_idx'][iii] += (n - _id[0])
        data['replay_buffer_expl/idx_to_future_obs_idx'].extend(new_data['replay_buffer_expl/idx_to_future_obs_idx'][_id[0]:_id[1]])

        n = data['replay_buffer_expl/top']
        i += 1

    path = input("file path: ")
    torch.save(data, path)

if __name__ == "__main__":

    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--buffer_names',type=str, default = '/home/ros/deepbuilder/learning_ws/data/200316-sac-fast-track/200316-sac-fast-track_2020_03_18_15_09_32_0000--s-0/params.pkl,/home/ros/deepbuilder/learning_ws/data/200316-sac-base-100-epochs/200316-sac-base-100-epochs_2020_03_18_15_07_15_0000--s-0/params.pkl')
    parser.add_argument('--ids',type=str, default = '0:,60000:') #first ids has to be 0: for now

    args=parser.parse_args()

    variant = dict(
        algorithm='SAC',
        version='normal',
        env_kwargs=dict(
            session_name="bla",            
            rhino_pid=0,
            is_simulation=True,
            action_dim=7, 
            observation_dim=144,
            goal_dim=3,
            observation_noise_mean=0.0,
            observation_noise_std=0.0002,
            max_steps_per_play=30,
            terminate_at_collision=False,
            populate_simulation=0.7 #IMPORTANT!!! CHANGE WHEN NOT SIMULATION
        ),
        algo_kwargs=dict(
            batch_size=128,
            num_epochs=99999,
            num_eval_plays_per_epoch=0,
            num_expl_plays_per_epoch=0,            
            num_train_loops_per_epoch=0,
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
            max_size=int(3E6)
        ),
        qf_kwargs=dict(
            hidden_sizes=[432, 360, 360],
        ),
        policy_kwargs=dict(
            hidden_sizes=[432, 360, 360],
        ),
    )

    main(args, variant)