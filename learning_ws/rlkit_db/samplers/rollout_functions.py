import numpy as np
from termcolor import colored


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
    agent.reset()
    obs = env.reset()
    done = env.done

    goal = obs[desired_goal_key]
    while not done:
        dict_obs.append(obs)
        if observation_key:
            obs = obs[observation_key]
        if obs.size != env.env.observation_dim or goal.size != env.env.goal_dim:
            print(colored("\nInvalid data dimensions [obs:{}, goal:{}]. Is AE_SERVER running? Sample corrupted. GH_OUT raised".format(obs.size, goal.size), color='magenta', attrs=['bold']))
            raise ValueError('GH_OUT', 'GH_OUT')
        concatenated = np.hstack((obs, goal))
        a, agent_info = agent.get_action(concatenated, **get_action_kwargs)
        next_obs, rew, done, env_info = env.step(a)
        observations.append(obs)
        rewards.append(rew)
        terminals.append(done)
        actions.append(a)
        next_observations.append(next_obs)
        dict_next_obs.append(next_obs)
        agent_infos.append(agent_info)
        env_infos.append(env_info)
        path_length += 1
        if done:
            break
        obs = next_obs
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
    obs = env.reset()
    done = False
    agent.reset()
    next_state = None
    if render:
        env.render(**render_kwargs)
    while not done:
        #find out what to do
        action, agent_info = agent.get_action(obs.cuda())
        print(colored(">>>>> SESSION: " + env.session_name + " >>>>> PLAY: " + str(_play) + " >>>>> ROUND: " + str(len(actions)) + " >>>>> TICK: " +str(_tick)+" ["+str(action[0])+", "+str(action[1])+", "+str(action[2])+", "+str(action[3])+", "+str(action[4])+", "+str(action[5])+"]", 'blue'))

        #do it
        next_state, rew, done, info = env.step(action)
        observations.append(obs.clone().numpy())
        rewards.append(rew)
        terminals.append(done)
        actions.append(action)
        agent_infos.append(agent_info)
        env_infos.append(info)
        _tick +=1
        

        if done:
            break
        obs = next_state
        if render:
            env.render(**render_kwargs)

    _play+=1
    actions = np.array(actions)
    if len(actions.shape) == 1:
        actions = np.expand_dims(actions, 1)
    observations = np.array(observations)
    if len(observations.shape) == 1:
        observations = np.expand_dims(observations, 1)
        next_state = np.array([next_state])
    next_observations = np.vstack(
        (
            observations[1:, :],
            np.expand_dims(next_state, 0)
        )
    )

    print(colored((">>>>>TRAJECTORY REWARD:   " + str(sum(rewards)) + "   after " + str(len(actions)) + " rounds in play " + str(_play)), "red"))


    return dict(
        observations=observations,
        actions=actions,
        rewards=np.array(rewards).reshape(-1, 1),
        next_observations=next_observations,
        terminals=np.array(terminals).reshape(-1, 1),
        agent_infos=agent_infos,
        env_infos=env_infos,
    )
