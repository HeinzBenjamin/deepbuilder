import numpy as np
from termcolor import colored
import copy


def multitask_rollout(
        env,
        agent,
        observation_key=None,
        desired_goal_key=None,
        get_action_kwargs=None,
        return_dict_obs=False,
):
    if get_action_kwargs is None:
        get_action_kwargs = {}
    dict_obs = []
    dict_next_obs = []
    observations = []
    actions = []
    rewards = []
    terminals = []
    agent_infos = []
    env_infos = []
    next_observations = []
    path_length = 0
    try:
        agent.reset()
        obs = env.reset()
    except:
        raise ValueError('GH_OUT','GH_OUT')
    
    done = env.done

    goal = obs[desired_goal_key]
    while not done:
        dict_obs.append(copy.deepcopy(obs))
        if observation_key:
            obs = obs[observation_key]
        if obs.size != env.env.observation_dim or goal.size != env.env.goal_dim:
            print(colored("\nInvalid data dimensions [obs:{}, goal:{}]. Is AE_SERVER running? Sample corrupted. GH_OUT raised".format(obs.size, goal.size), color='magenta', attrs=['bold']))
            raise ValueError('GH_OUT', 'GH_OUT')
        concatenated = np.hstack((obs, goal)) if env.env.is_goal_based() else obs
        a, agent_info = agent.get_action(concatenated, **get_action_kwargs)
        next_obs, rew, done, env_info = env.step(a)
        observations.append(copy.deepcopy(obs))
        rewards.append(rew)
        terminals.append(done)
        actions.append(copy.deepcopy(a))
        next_observations.append(copy.deepcopy(next_obs))
        dict_next_obs.append(copy.deepcopy(next_obs))
        agent_infos.append(agent_info)
        env_infos.append(env_info)
        path_length += 1
        if done:
            break
        obs = copy.deepcopy(next_obs)
    actions = np.array(actions)
    if len(actions.shape) == 1:
        actions = np.expand_dims(actions, 1)
    observations = np.array(observations)
    next_observations = np.array(next_observations)
    if return_dict_obs:
        observations = dict_obs
        next_observations = dict_next_obs
    return dict(
        observations=observations,
        actions=actions,
        rewards=np.array(rewards).reshape(-1, 1),
        next_observations=next_observations,
        terminals=np.array(terminals).reshape(-1, 1),
        agent_infos=agent_infos,
        env_infos=env_infos,
        goals=np.repeat(goal[None], path_length, 0),
        full_observations=dict_obs,
    )

_play = 0
_tick = 0

def rollout(
        env,
        agent,
        render=False,
        render_kwargs=None,
):
    """
    The following value for the following keys will be a 2D array, with the
    first dimension corresponding to the time dimension.
     - observations
     - actions
     - rewards
     - next_observations
     - terminals

    The next two elements will be lists of dictionaries, with the index into
    the list being the index into the time
     - agent_infos
     - env_infos
    """
    if render_kwargs is None:
        render_kwargs = {}

    global _tick
    global _play
    observations = []
    actions = []
    rewards = []
    terminals = []
    agent_infos = []
    env_infos = []
    obs = env.reset()['observation']
    done = False
    agent.reset()
    next_obs = None
    if render:
        env.render(**render_kwargs)
    while not done:
        #find out what to do
        action, agent_info = agent.get_action(obs)
        next_obs, rew, done, info = env.step(action)
        next_obs = next_obs['observation']
        observations.append(copy.deepcopy(obs))
        rewards.append(rew)
        terminals.append(done)
        actions.append(action)
        agent_infos.append(agent_info)
        env_infos.append(info)        

        if done:
            break
        obs = next_obs
        if render:
            env.render(**render_kwargs)

    actions = np.array(actions)
    if len(actions.shape) == 1:
        actions = np.expand_dims(actions, 1)
    observations = np.array(observations)
    if len(observations.shape) == 1:
        observations = np.expand_dims(observations, 1)
        next_obs = np.array([next_obs])
    next_observations = np.vstack(
        (
            observations[1:, :],
            np.expand_dims(next_obs, 0)
        )
    )

    return dict(
        observations=observations,
        actions=actions,
        rewards=np.array(rewards).reshape(-1, 1),
        next_observations=next_observations,
        terminals=np.array(terminals).reshape(-1, 1),
        agent_infos=agent_infos,
        env_infos=env_infos,
    )
