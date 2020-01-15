import gym, torch, uuid, time, requests, json, datetime
from termcolor import colored
import numpy as np
from gym import spaces
from . import ros_communication as rc
from . import settings
from . import util

# important rlkit files:
# rlkit/core/batch_rl_algorithm.py
# rlkit/samplers/data_collector/path_collector.py
# rlkit/samplers/rollout_functions.py

class NormalizedActions(gym.ActionWrapper):
    def action(self, action):
        low  = self.action_space.low
        high = self.action_space.high

        action = util.remap_linear(action, low, high, settings.ACTION_LIMIT_LOWER, settings.ACTION_LIMIT_UPPER)

        return action

    def reverse_action(self, action):        
        low  = self.action_space.low
        high = self.action_space.high 

        action = util.remap_linear(action, settings.ACTION_LIMIT_LOWER, settings.ACTION_LIMIT_UPPER, low, high)

        return action

class DeepBuilderGoalEnv(gym.GoalEnv):
    def __init__(self, session_name, is_simulation):
        super(DeepBuilderGoalEnv, self).__init__()      

        #things relevant for connections
        self.session_name = session_name
        self.is_simulation = is_simulation


        self.action_id = '00000000'
        self.rhino_pid = -1
        

        #basic config
        self.action_dim = 7         #six axes plus one box rotation in tcp frame (for now)
        self.observation_dim = 144  #bc #yolo
        self.goal_dim = 10
        self.observation_noise_mean = 0.0
        self.obervation_noise_std = 0.00005

        #holds actual values
        self.state_array = self.default_observation()
        self.observation_array = np.zeros(shape=(self.observation_dim,), dtype=np.float32)
        self.action_array = np.zeros(self.action_dim, dtype=np.float32)
        self.desired_goal_array = np.zeros(self.goal_dim, dtype=np.float32)
        self.achieved_goal_array = np.zeros(self.goal_dim, dtype=np.float32)
        self.reward_array = np.zeros(1, dtype=np.float32)

        self.observation_dict = {}
        self.observation_dict['observation'] = self.observation_array
        self.observation_dict['desired_goal'] = self.desired_goal_array
        self.observation_dict['achieved_goal'] = self.achieved_goal_array

        #just neede for some registration and book keeping. doesn't actually hold any value
        self.action_space = spaces.Box(-np.pi,  np.pi, shape=(self.action_dim,), dtype=np.float32)
        self.observation = spaces.Box(-np.pi,  np.pi, shape=(self.observation_dim,), dtype=np.float32) #bounds solely based on observations and estimation! no garantuee
        self.desired_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success
        self.achieved_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success

        self.observation_space = spaces.Dict()
        self.observation_space.spaces['observation'] = self.observation
        self.observation_space.spaces['desired_goal'] = self.desired_goal
        self.observation_space.spaces['achieved_goal'] = self.achieved_goal

        

        '''HIDDEN MEMBERS'''
        self.__ros_comm = None

    def step(self, action):
        #guid generation
        self.action_id = str(uuid.uuid4().hex)[:8]

        action_array = action.tolist()
        achieved_goal_dict = self.default_goal()

        #moveit path planning
        print("[{}] Attempt path planning for action {}".format(self.session_name, self.action_id))
        path_planning_result = self.ros_comm().test_pose(action_array[:6])
        print("[{}] Result: {}".format(self.session_name, path_planning_result['message']))
        self.fill_goal_dict_from_moveit_collisions(achieved_goal_dict, path_planning_result['collisions'])

        if path_planning_result['message'] == 'SUCCESS':
            print("[{}] Sending print simulation...".format(self.session_name))
            simulation_result = self.RhinoSimulation(action_array)
            self.fill_goal_dict_from_gh_simulation(achieved_goal_dict, simulation_result)

        obs = simulation_result
        


        #rlkit requries us to return quote 'next_o, r, d, env_info' as simple lists and numbers
        return self.observation, self.compute_reward(self.achieved_goal_array, self.desired_goal_array), False, ''
            
    def default_goal(self):
        #most pessimistic case
        goal_dict = {}
        goal_dict['self_collision'] = -1
        goal_dict['wall_collision'] = -1
        goal_dict['table_collision'] = -1
        goal_dict['state_collision'] = -1
        goal_dict['all_collision'] = -1
        goal_dict['is_printable'] = -1
        goal_dict['dist_to_state'] = -1
        goal_dict['current_height'] = -1
        goal_dict['current_area'] = -1
        goal_dict['deformation'] = -1
        return goal_dict

    #IMPORTANT!!!!!!! Needs to be adapted when encoder nets are exchanged
    def default_observation(self, add_noise=True):
        obs = np.array(settings.DEFAULT_OBSERVATION, dtype=np.float32)
        if add_noise:
            obs += np.random.normal(loc=self.observation_noise_mean, scale=self.obervation_noise_std, size=obs.size)
        return obs

    def fill_goal_dict_from_moveit_collisions(self, goal_dict, collisions):
        #success case
        if not collisions[4]:
            goal_dict['self_collision'] = 1
            goal_dict['wall_collision'] = 1
            goal_dict['table_collision'] = 1
            goal_dict['state_collision'] = 1
            goal_dict['all_collision'] = 1
            return
        
        #fill according to collisions
        goal_dict['self_collision'] = 1 if not collisions[0] else -1
        goal_dict['wall_collision'] = 1 if not collisions[1] else -1
        goal_dict['table_collision'] = 1 if not collisions[2] else -1
        goal_dict['state_collision'] = 1 if not collisions[3] else -1
        goal_dict['all_collision'] = 1 if not collisions[4] else -1

        #if all individually are successful but the combination of all fails, only give half punishment
        if collisions[4] and not collisions[0] and not collisions[1] and not collisions[2] and not collisions [3]:
            goal_dict['self_collision'] = -0.5 
            goal_dict['wall_collision'] = -0.5
            goal_dict['table_collision'] = -0.5
            goal_dict['state_collision'] = -0.5

    def fill_goal_dict_from_gh_simulation(self, goal_dict, sim_result):
        goal_dict['is_printable'] = 1 if sim_result['is_printable'] else -1
        goal_dict['dist_to_state'] = (sim_result['dist_to_state_mesh'] / settings.LARGEST_POSSIBLE_DISTANCE_TCP_STATE) * -2.0 + 1.0
        goal_dict['current_height'] = (sim_result['current_height'] / settings.OBSERVATION_CUBE_LENGTH) * 2.0 - 1.0
        goal_dict['current_area'] = sim_result['current_area'] / settings.MAX_AREA * 2.0 - 1.0

        #deformation is mean cartesian tcp displacement scaled by observation_cube_length
        #by default deformation is 1.0 (meaning NO deformation), bc. that results in smooth transition from 'no tcps present' to 
        #'slightly deformed tcps present' as it's the case when new tcps with high anchor amount are introduced
        #this encourages the agent to maintain deformation=1.0 rather than figuring out that there's a step between 0 present tcps and some tcps
        deformation = 0.0
        if len(sim_result['current_tcp_displacements']) == 0 or (len(sim_result['current_tcp_displacements']) == 1 and sim_result['current_tcp_displacements'][0] == 0):
            deformation = 1.0
        else:
            for d in sim_result['current_tcp_displacements']:
                deformation += ((d / settings.OBSERVATION_CUBE_LENGTH) * -2.0 + 1) / len(sim_result['current_tcp_displacements'])
        goal_dict['deformation'] = deformation

        return goal_dict

    def goal_dict_to_tensor(self, goal_dict):
        tensor = np.zeros(shape=(self.goal_dim,), type=np.float32)
        tensor[0] = goal_dict['self_collision'] 
        tensor[1] = goal_dict['wall_collision'] 
        tensor[2] = goal_dict['table_collision']
        tensor[3] = goal_dict['state_collision']
        tensor[4] = goal_dict['all_collision']
        tensor[5] = goal_dict['is_printable']
        tensor[6] = goal_dict['dist_to_state']
        tensor[7] = goal_dict['current_height'] 
        tensor[8] = goal_dict['current_area']
        tensor[9] = goal_dict['deformation']
        return tensor

    def compute_reward(self, achieved_goal, desired_goal, info):
        #we use a smaller-0 discriminator, so virtual goals can be evaluated too
        #any collision results in negative reward
        if ((achieved_goal[0] < 0.0) != (desired_goal[0] < 0.0)
                or (achieved_goal[1] < 0.0) != (desired_goal[1] < 0.0)
                or (achieved_goal[2] < 0.0) != (desired_goal[2] < 0.0)
                or (achieved_goal[3] < 0.0) != (desired_goal[3] < 0.0)
                or (achieved_goal[4] < 0.0) != (desired_goal[4] < 0.0)):
            return -1
        
        reward = 0.0
        #printability
        if (achieved_goal[5] < 0.0) == (desired_goal[5] < 0.0):
            reward += 1.0

        #distance to state
        if achieved_goal[6] <= desired_goal[6]:
            reward += 1.0

        #current_height
        if achieved_goal[7] >= desired_goal[7]:
            reward += 2.0

        #current_area
        if achieved_goal[8] >= desired_goal[8]:
            reward += 2.0

        #deformation
        if achieved_goal[9] <= desired_goal[9]:
            reward += 1.0

        return reward

        

    def reset(self):
        if self.is_simulation:
            self.FH_Reset()

    def ros_comm(self):
        if self.__ros_comm == None:
            self.__ros_comm = rc.Connection(self.session_name)
        return self.__ros_comm


    def RhinoSimulation(self, action):
        p = {}
        p["action"]=[]
        for a in range(len(action)):
            p["action"].append("A"+str(a)+"="+str(action[a]))

        return self.SafeRequest('print_segment', p, settings.TIMEOUT_ACTION)

    def FH_Reset(self):
        p = {}
        p["reset"]=True
        self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)
        time.sleep(settings.TIME_RESET_BTN)
        p["reset"]=False
        return self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)

    def FH_Run(self, run):
        p={}
        p["run"]=run
        return self.SafeRequest('fh_run', p, settings.TIMEOUT_FH)

    def SafeRequest(self, controller, _params, _timeout):
        _params["rhino_pid"]=self.rhino_pid
        _params["session"]=self.session_name
        _params["act_id"]=self.action_id

        try:
            r = requests.get(settings.RHINOREMOTE_URL + controller, params = _params, timeout = _timeout, headers={'Cache-Control': 'no-cache'})

            if r.text == "invalid request":
                raise ValueError('INVALID REQUEST', 'INVALID REQUEST')

            j = json.loads(r.text)

            if j["rhino_pid"] != self.rhino_pid:
                self.rhino_pid = j["rhino_pid"]
                raise ValueError('GH_OUT', 'GH_OUT')
            try:
                json_output = json.loads(j["content"])
                return json_output
            except ValueError as err:
                print(colored("{}\nCouldn't read json response! fix this".format(str(err))))
                raise err

        except (requests.exceptions.ReadTimeout, requests.exceptions.ConnectionError):
            print(colored("RhinoManager didn't respond.", color='red'))
            try:
                timeout = 300
                while timeout >= 0:
                    timeout -= 1
                    print("Automatic retry in {}. Hit keyboard interrupt to resume immediately.".format(str(datetime.timedelta(seconds=timeout))), end='\r')
                    time.sleep(1)   
                print("Retrying... Wish me luck")
                self.SafeRequest(controller, _params, _timeout)
            except KeyboardInterrupt:
                print("Retrying... Wish me luck")
                self.SafeRequest(controller, _params, _timeout)

if __name__ == "__main__":
    env = NormalizedActions(DeepBuilderGoalEnv(session_name = "debug_sess", is_simulation = True))
    env.env.rhino_pid = 10380
    while True:
        try:
            env.reset()
            for i in range(20):         
                bla = env.step(np.random.uniform(low=-np.pi, high=np.pi, size=(7,)))
                #input("Press Enter")
        except ValueError as err:
            if err.args[0] == "GH_OUT":
                print("GH was out")
    print("done bye")