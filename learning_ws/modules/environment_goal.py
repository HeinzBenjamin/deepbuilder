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
    def __init__(
        self, 
        session_name, 
        is_simulation, 
        rhino_pid=-1, 
        action_dim=7, 
        observation_dim=144,
        goal_dim=10,
        observation_noise_mean=0.0,
        observation_noise_std=0.00005,
        terminate_at_collision=False,
        max_steps_per_play=30,
        populate_simulation=True
        ):

        super(DeepBuilderGoalEnv, self).__init__()      

        #things relevant for connections
        self.session_name = session_name
        self.is_simulation = is_simulation
        np.set_printoptions(precision = 3, suppress=True)


        self.action_id = '00000000'
        self.rhino_pid = rhino_pid
        self.is_synced = True #is only false during step and reset operations in which state, action, operation, reward tuples are not in sync
        self.phase = 'init'

        self.terminate_at_collision = terminate_at_collision
        self.max_steps_per_play = max_steps_per_play
        self.current_step = 0
        self.current_play = 0
        self.state_mesh = {}
        self.send_state_mesh_to_ros = False
        self.populate_simulation = populate_simulation
        

        #basic config
        self.action_dim = action_dim         #six axes plus one box rotation in tcp frame (for now)
        self.observation_dim = observation_dim  #bc #yolo
        self.goal_dim = goal_dim
        self.observation_noise_mean = observation_noise_mean
        self.observation_noise_std = observation_noise_std
        self.reward_range = (-1.0, 7.01)

        #holds actual values
        self.state_array = self.default_observation()
        self.action_array = np.zeros(self.action_dim, dtype=np.float32)
        self.reward = 0
        self.done=False

        self.observation_dict = {}
        self.observation_dict['observation'] = self.state_array.copy()
        self.observation_dict['desired_goal'] = self.goal_dict_to_tensor(self.default_desired_goal())
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.default_achieved_goal())

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
        self.is_synced = False
        self.print_db("\n {}      Phase: {}      Play: {}      Step: {}".format(self.session_name, self.phase, self.current_play+1, self.current_step+1), color='red')
        #previous observation becomes current state
        self.state_array = self.observation_dict['observation'].copy()  

        self.action_id = str(uuid.uuid4().hex)[:8]
        info = "{}--{}--{}--{}".format(self.session_name, self.action_id, self.current_play, self.current_step)

        action_array = action.copy()
        achieved_goal_dict = self.default_achieved_goal()

        #moveit path planning
        mesh_to_send = {} if not self.send_state_mesh_to_ros else self.state_mesh
        path_planning_result = self.ros_comm().test_pose(action_array[:6].tolist(), state_mesh=mesh_to_send)
        self.print_db("[{}-{}] Path planning result: {}".format(self.session_name, self.action_id, path_planning_result['message']), color='white')
        info += " +++ path_planning: " + path_planning_result['message']
        self.fill_goal_dict_from_moveit_collisions(achieved_goal_dict, path_planning_result['collisions'])
        

        if path_planning_result['message'] == 'SUCCESS':
            simulation_result = self.RhinoSimulation(action_array)
            self.fill_goal_dict_from_gh_simulation(achieved_goal_dict, simulation_result)
            info += " +++ is_printable: " + str(simulation_result['is_printable'])
            self.print_db("[{}-{}] Simulation result: Is printable: {}".format(self.session_name, self.action_id, simulation_result['is_printable']), color='white')
            self.observation_dict['observation'] = np.array(simulation_result['state_compressed'], dtype=np.float32)
            self.send_state_mesh_to_ros = simulation_result['is_printable']
            if self.send_state_mesh_to_ros:
                self.state_mesh = dict(vertices = simulation_result['state_mesh_vertices'], indices=simulation_result['state_mesh_indices'])

        if (self.terminate_at_collision and path_planning_result['message'] != 'SUCCESS') or (self.current_step >= (self.max_steps_per_play - 1)):
            self.done = True
            self.current_play += 1

         
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(achieved_goal_dict)                

        self.reward = self.compute_reward(self.observation_dict['achieved_goal'], self.observation_dict['desired_goal'], '')

             

        self.current_step += 1

        self.is_synced = True
        self.print_db("[{}-{}] Done: {}, Achieved Goal: {}, Reward: {}".format(self.session_name, self.action_id, self.done, self.observation_dict['achieved_goal'], self.reward), color='blue')

        #rlkit requries us to return quote 'next_o, r, d, env_info' as simple lists and numbers
        return self.observation_dict, self.reward, self.done, info
            
    def default_achieved_goal(self):
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

    def default_desired_goal(self):
        goal_dict = {}
        goal_dict['self_collision'] = 1
        goal_dict['wall_collision'] = 1
        goal_dict['table_collision'] = 1
        goal_dict['state_collision'] = 1
        goal_dict['all_collision'] = 1
        goal_dict['is_printable'] = 1
        goal_dict['dist_to_state'] = 0.9 # corresponds to a radius of 12.5cm around the state mesh. the goal is to get that near or closer
        goal_dict['current_height'] = -0.33333333 # corresponds to a height of 25cm
        goal_dict['current_area'] = -0.5 #corresponds to a quarter of the totally available area being covered (anchor area subtracted)
        goal_dict['deformation'] = 0.95 # corresponds to a average displacement of 2cm for the recorded tcps. the goal is to get that or less
        return goal_dict

    
    def default_observation(self, add_noise=True):
        obs = np.array(settings.DEFAULT_OBSERVATION, dtype=np.float32)
        if add_noise:
            obs += np.random.normal(loc=self.observation_noise_mean, scale=self.observation_noise_std, size=obs.size)
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

        #if all individually are successful but the combination of all fails, goal achievement can be nuanced
        #this doesn't effect reward structure though
        if collisions[4] and not collisions[0] and not collisions[1] and not collisions[2] and not collisions [3]:
            goal_dict['self_collision'] = -0.5 
            goal_dict['wall_collision'] = -0.5
            goal_dict['table_collision'] = -0.5
            goal_dict['state_collision'] = -0.5

    def fill_goal_dict_from_gh_simulation(self, goal_dict, sim_result):
        #if printable 1, else -1
        goal_dict['is_printable'] = 1 if sim_result['is_printable'] else -1

        #remapping of 0.0 to 2500.0 into -1.0 to 1.0; sing flipped bc, the shorter the distance the better
        goal_dict['dist_to_state'] = (sim_result['dist_to_state_mesh'] / settings.DISTANCE_TCP_STATE_MAX) * -2.0 + 1.0

        #remapping from 0.0 to 750.0 into -1.0 to 1.0
        goal_dict['current_height'] = (sim_result['current_height'] / settings.OBSERVATION_CUBE_LENGTH) * 2.0 - 1.0

        #remapping from 0.0 to MAX_AREA into -1.0 to 1.0
        goal_dict['current_area'] = (sim_result['current_area'] / settings.MAX_AREA) * 2.0 - 1.0

        #deformation is mean cartesian tcp displacement scaled by observation_cube_length
        #by default deformation is 1.0 (meaning NO deformation), bc. that results in smooth transition from 'no tcps present' to 
        #'slightly deformed tcps present' as it's the case when new tcps with high anchor amount are introduced
        #this encourages the agent to maintain deformation=1.0 rather than figuring out that there's a step between 0 present tcps and some tcps
        #mapping from 0.0 to 750.0 into -1.0 to 1.0; averaged; sings flipped bc the less deformation the better
        deformation = 0.0
        if len(sim_result['current_tcp_displacements']) == 0:
            deformation = 1.0
        else:
            for d in sim_result['current_tcp_displacements']:
                deformation += ((d / settings.OBSERVATION_CUBE_LENGTH) * -2.0 + 1) / len(sim_result['current_tcp_displacements'])
        goal_dict['deformation'] = deformation

        return goal_dict

    def goal_dict_to_tensor(self, goal_dict):
        tensor = np.zeros(shape=(self.goal_dim,), dtype=np.float32)
        tensor[0] = min(1.0, max( -1.0, goal_dict['self_collision']))
        tensor[1] = min(1.0, max( -1.0, goal_dict['wall_collision']))
        tensor[2] = min(1.0, max( -1.0, goal_dict['table_collision']))
        tensor[3] = min(1.0, max( -1.0, goal_dict['state_collision']))
        tensor[4] = min(1.0, max( -1.0, goal_dict['all_collision']))
        tensor[5] = min(1.0, max( -1.0, goal_dict['is_printable']))
        tensor[6] = min(1.0, max( -1.0, goal_dict['dist_to_state']))
        tensor[7] = min(1.0, max( -1.0, goal_dict['current_height']))
        tensor[8] = min(1.0, max( -1.0, goal_dict['current_area']))
        tensor[9] = min(1.0, max( -1.0, goal_dict['deformation']))
        return tensor

    def compute_reward(self, achieved_goal, desired_goal, info):
        # we use a smaller-0 discriminator, so virtual goals of continuous values can be evaluated too
        # solver should hopefully be able to figure out step at zero in solution landscape
        # any collision results in negative reward
        if ((achieved_goal[0] < 0.0) != (desired_goal[0] < 0.0)
                or (achieved_goal[1] < 0.0) != (desired_goal[1] < 0.0)
                or (achieved_goal[2] < 0.0) != (desired_goal[2] < 0.0)
                or (achieved_goal[3] < 0.0) != (desired_goal[3] < 0.0)
                or (achieved_goal[4] < 0.0) != (desired_goal[4] < 0.0)):
            return -1
        
        reward = 0.01 #shouldn't be zero to be effective, shouldn't be meaningful positive either
        #printability
        if (achieved_goal[5] < 0.0) == (desired_goal[5] < 0.0):
            reward += 1.0

        #distance to state
        if achieved_goal[6] >= desired_goal[6]:
            reward += 1.0

        #current_height
        if achieved_goal[7] >= desired_goal[7]:
            reward += 2.0

        #current_area
        if achieved_goal[8] >= desired_goal[8]:
            reward += 2.0

        #deformation
        if achieved_goal[9] >= desired_goal[9]:
            reward += 1.0

        return reward

    def reset(self):
        self.is_synced = False

        self.ros_comm().reset_state_mesh()
        self.send_state_mesh_to_ros = False
        self.state_mesh = {}

        if self.is_simulation:
            self.FH_Reset()
            self.RhinoSimulation(settings.HOME_POSE)
        self.state = self.default_observation()
        self.observation_dict['observation'] = self.state.copy()
        self.achieved_goal_dict = self.default_achieved_goal()
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.achieved_goal_dict)

        self.current_step = 0
        self.done = False
        self.current_step = 0
        self.is_synced=True
        return self.observation_dict

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
        p["populate_sim"]=0
        self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)
        time.sleep(settings.TIME_RESET_BTN)
        p["reset"]=False
        p["populate_sim"]=self.populate_simulation
        return self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)

    def FH_Run(self, run):
        p={}
        p["run"]=run
        return self.SafeRequest('fh_run', p, settings.TIMEOUT_FH)

    def SafeRequest(self, controller, _params, _timeout):
        _params["rhino_pid"]=self.rhino_pid
        _params["session"]=self.session_name
        _params["act_id"]=self.action_id

        while True:
            try:
                r = requests.get(settings.RHINOREMOTE_URL + controller, params = _params, timeout = _timeout, headers={'Cache-Control': 'no-cache'})

                if r.text == "inready request":
                    raise ValueError('INready REQUEST', 'INready REQUEST')

                j = json.loads(r.text)

                if j["rhino_pid"] != self.rhino_pid:
                    self.rhino_pid = j["rhino_pid"]
                    if controller != 'fh_reset':
                        raise ValueError('GH_OUT', 'GH_OUT')

                json_output = json.loads(j["content"])
                #normally we leave the function here
                return json_output

            #upon forseeable errors we give an info...
            except (requests.exceptions.ReadTimeout):
                print(colored("RhinoManager: Timeout. ", color='red'))                

            except (requests.exceptions.ConnectionError):
                print(colored("RhinoManager: Connection Error. ", color='red'))  

            #...and start the retry countdown
            try:
                countdown = 30
                while countdown >= 0:
                    countdown -= 1
                    print("Automatic retry in {}. Hit keyboard interrupt to resume immediately.".format(str(datetime.timedelta(seconds=countdown))), end='\r')
                    time.sleep(1)   
                print("Retrying... Wish me luck")
                continue
            except KeyboardInterrupt:
                print("Retrying... Wish me luck")
                continue

    def print_db(self, text, color):
        print(colored(text, color=color, attrs=['dark'] if self.phase == 'eval' else []))

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