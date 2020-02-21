import gym, torch, uuid, time, requests, json, datetime, random, copy
from termcolor import colored
import numpy as np
from gym import spaces

from . import ros_communication as rc
from . import settings
from . import util
'''
import ros_communication as rc
import settings
import util
'''


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


        



class DeepBuilderEnv():
    def __init__(
        self, 
        session_name, 
        is_simulation, 
        rhino_pid, 
        action_dim, 
        observation_dim,
        goal_dim,
        additional_info_dim,
        observation_noise_mean,
        observation_noise_std,
        terminate_at_collision,
        max_steps_per_play,
        populate_simulation
        ):

        #super(DeepBuilderGoalEnv, self).__init__()      

        np.set_printoptions(precision = 5, suppress=True)

        #things relevant for connections
        self.session_name = session_name
        self.is_simulation = is_simulation

        self.action_id = '00000000'
        self.rhino_pid = rhino_pid
        self.is_synced = True #is only false during step and reset operations in which state, action, operation, reward tuples are not in sync
        self.phase = 'init'

        self.terminate_at_collision = terminate_at_collision
        self.max_steps_per_play = max_steps_per_play
        self.current_step = 0
        self.current_play = 0
        self.state_mesh = {}
        self.populate_simulation = populate_simulation
        self.print_result = {}        

        #basic config
        self.action_dim = action_dim         #six axes plus one box rotation in tcp frame (for now)
        self.observation_dim = observation_dim  #bc #yolo
        self.goal_dim = goal_dim
        self.additional_info_dim = additional_info_dim
        self.observation_noise_mean = observation_noise_mean
        self.observation_noise_std = observation_noise_std
        self.reward_range = (0.0, 1.0)

        #holds actual values
        self.action_array = np.zeros(self.action_dim, dtype=np.float32)
        self.reward = 0
        self.done=False

        self.observation_dict = {}
        self.observation_dict['observation'] = []
        self.observation_dict['desired_goal'] = self.goal_dict_to_tensor(self.random_desired_goal())
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.default_achieved_goal())

        #just needed for some registration and book keeping. doesn't actually hold any value
        self.action_space = spaces.Box(-np.pi,  np.pi, shape=(self.action_dim,), dtype=np.float32)
        self.observation = spaces.Box(-np.pi,  np.pi, shape=(self.observation_dim,), dtype=np.float32) #bounds solely based on observations and estimation! no garantuee
        self.desired_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success
        self.achieved_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success
        self.additional_info = spaces.Box(-999999.9, 999999.9, shape=(self.additional_info_dim,), dtype=np.float32)

        self.observation_space = spaces.Dict()
        self.observation_space.spaces['observation'] = self.observation
        self.observation_space.spaces['desired_goal'] = self.desired_goal
        self.observation_space.spaces['achieved_goal'] = self.achieved_goal    
        self.observation_space.spaces['additional_info'] = self.additional_info     

        #info to print to screen
        self.note = ""

        #stuff for printing
        self.print_speed = 0.001
        self.nozzle_speed_factor = 0.1
        self.print_heat = 200
        self.state_tags = None
        self.previous_print_result = {}

        self.previous_height = 0.0
        self.previous_area = 0.0
        self.previous_tcp_displacement = 0.0


        '''HIDDEN MEMBERS'''
        self.__ros_comm = None

        self.achieved_goal_dict = self.default_achieved_goal()

    '''
    main functions
    '''
    def reset(self):
        self.is_synced = False

        #self.ros_comm().reset_state_mesh()
        #self.ros_comm().reset_compressed_mesh()
        self.state_mesh = {}
        self.achieved_goal_dict = self.default_achieved_goal()
        self.RhinoSimulation(settings.HOME_POSE)

        if self.is_simulation:            
            self.print_result = self.FH_Reset()            
            self.observation_dict['observation'] = self.print_result["state_compressed"]
            self.fill_goal_dict_from_gh_simulation(self.achieved_goal_dict, self.print_result)
            

        else:
            print("Retrieving sensor paths")
            sensing_poses = self.get_sensor_poses(settings.HOME_SCANNING_POSE)

            print("Collecting tag info")
            self.state_tags = self.ros_scan_state(sensing_poses)

            print("Sending new state tags to Rhino")
            sim_res = self.update_state_tags(self.state_tags)
            self.observation_dict['observation'] = sim_res["state_compressed"]
            self.achieved_goal_dict = {} #TO DO
            self.print_result = {} #TO DO
            

        self.state_mesh['indices'] = self.print_result['state_mesh_indices']
        self.state_mesh['vertices'] = self.print_result['state_mesh_vertices']
        self.previous_height = self.print_result['current_height']
        self.previous_area = self.print_result['current_area']
        self.previous_tcp_displacement = self.print_result['current_tcp_displacement']

        col_res = {}
        col_res['message'] = "SUCCESS"
        col_res['collisions'] = [False,False,False,False,False] #we'll assume no collisions in reset state

        self.observation_dict['observation'] += np.random.normal(loc=self.observation_noise_mean, scale=self.observation_noise_std, size=[self.observation_dim])        
        self.observation_dict['desired_goal'] = self.goal_dict_to_tensor(self.random_desired_goal())
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.achieved_goal_dict)
        self.observation_dict['additional_info'] = self.assemble_additional_info(col_res, self.print_result)

        
        self.current_step = 0
        self.done = False
        self.current_step = 0
        self.is_synced=True
        self.note = "Reset"
        return self.observation_dict

    def step(self, action):
        #guid generation
        self.is_synced = False
        self.note = ""
        self.print_db("\n {}      Phase: {}      Play: {}      Step: {}".format(self.session_name, self.phase, self.current_play+1, self.current_step+1), color='red')
        #previous observation becomes current state 

        self.action_id = str(uuid.uuid4().hex)[:8]

        action_array = action.copy()

        #moveit path planning
        path_planning_result = self.ros_comm().test_pose(action_array[:6].tolist(), state_mesh=self.state_mesh)
        self.note += "Path " + path_planning_result['message']
        #self.fill_goal_dict_from_moveit_collisions(achieved_goal_dict, path_planning_result['collisions'])


        if path_planning_result['message'] == "SUCCESS":            
            if self.is_simulation:
                self.print_result = self.print_simulation(action)
            else:
                self.print_result = self.print_real(action)

            self.fill_goal_dict_from_gh_simulation(self.achieved_goal_dict, self.print_result)
            self.ros_comm().update_compressed_mesh(comp_mesh_vertices = self.print_result['compressed_mesh_vertices'], comp_mesh_indices = self.print_result['compressed_mesh_indices'])
            self.ros_comm().update_state_mesh(self.print_result['state_mesh_vertices'], self.print_result['state_mesh_indices'])
            self.observation_dict['observation'] = np.array(self.print_result['state_compressed'], dtype=np.float32)

        else:
            self.print_result['printability_ratio'] = 0.0
            self.print_result['tilt_angle'] = 3.141
            self.print_result['action_tcp']['position']['x'] = 0.0 #if I decide to include tcp pose in learning, this will have to be properly computed
            self.print_result['action_tcp']['position']['y'] = 0.0
            self.print_result['action_tcp']['position']['z'] = 0.0
            self.print_result['action_tcp']['orientation']['x'] = 0.0
            self.print_result['action_tcp']['orientation']['y'] = 0.0
            self.print_result['action_tcp']['orientation']['z'] = 0.0
            self.print_result['action_tcp']['orientation']['w'] = 0.0
            self.print_result['dist_to_state_mesh'] = settings.DISTANCE_TCP_STATE_MAX

        if (self.terminate_at_collision and path_planning_result['message'] != 'SUCCESS') or (self.current_step >= (self.max_steps_per_play - 1)):
            self.done = True
            self.current_play += 1

        self.state_mesh['indices'] = self.print_result['state_mesh_indices']
        self.state_mesh['vertices'] = self.print_result['state_mesh_vertices']
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.achieved_goal_dict)
        self.observation_dict['additional_info'] = self.assemble_additional_info(path_planning_result, self.print_result)
        self.observation_dict['observation'] += np.random.normal(loc=self.observation_noise_mean, scale=self.observation_noise_std, size=[self.observation_dim])


        if self.is_goal_based():
            self.reward = self.compute_reward(self.observation_dict['achieved_goal'], self.observation_dict['desired_goal'], '')
        else:
            self.reward = self.shape_reward(path_planning_result, self.print_result)

        self.note += " ({:.1f})".format(self.observation_dict['additional_info'][0])
        self.note += " - dist {:.2f} | printab {:.2f} | height {:.2f} | area {:.2f} | displ {:.2f}".format(self.observation_dict['additional_info'][1], self.observation_dict['additional_info'][2], self.observation_dict['additional_info'][4], self.observation_dict['additional_info'][5], self.observation_dict['additional_info'][6])


        self.previous_height = self.print_result['current_height']
        self.previous_area = self.print_result['current_area']
        self.previous_tcp_displacement = self.print_result['current_tcp_displacement']
        self.current_step += 1

        self.is_synced = True
        self.print_db("[{}-{}] Goal (D): {}".format(self.session_name, self.action_id, self.observation_dict['desired_goal']), color='blue')
        self.print_db("[{}-{}] Goal (A): {}".format(self.session_name, self.action_id, self.observation_dict['achieved_goal']), color='blue')        
        self.print_db("[{}-{}]     Done: {}".format(self.session_name, self.action_id, self.done), color='blue', end="")        
        self.print_db("   Reward: {}".format(self.reward), color='blue', attrs=['bold'])
        self.print_db("[{}-{}]     Note: {}".format(self.session_name, self.action_id, self.note), color='cyan')


        #rlkit requries us to return quote 'next_o, r, d, env_info' as simple lists and numbers
        return self.observation_dict, self.reward, self.done, ''

    def print_simulation(self, action_array):
        return self.RhinoSimulation(action_array)


    def print_real(self, action):
        print("Trying to get print path from Rhino")
        #actually try to get a print path from rhino
        print_plan = self.get_print_path(action)
        print_result = copy.deepcopy(self.previous_print_result)
        print_result['printability_ratio'] = print_plan['printability_ratio']
        print_result['dist_to_state'] = print_plan['dist_to_state']

        if print_plan["printability_ratio"] > 0.0:
            _in = input("Got GH print path. [y/n] to continue printing or skip")
            if _in == 'y':
                try:
                    self.print_db("Attempting robotic print", color='yellow')
                    msg = env.ros_print_path_with_robot(action, print_plan)
                    self.print_db(msg, color='yellow')

                    self.print_db("Retrieving sensor paths", color='yellow')
                    sensing_poses = self.get_sensor_poses(action[:6])

                    self.print_db("Collecting tag info", color='yellow')
                    state_tags = self.ros_scan_state(sensing_poses)

                    self.print_db("Sending new state tags to Rhino", color='yellow')
                    rhino_state_update = self.update_state_tags(state_tags)
                    print_result['current_height'] = rhino_state_update['current_height']
                    print_result['current_area'] = rhino_state_update['current_area']
                    print_result['deformation'] = rhino_state_update['deformation']


                except Exception as e:
                    print(e)
                    
        self.previous_print_result = copy.deepcopy(print_result)

        return print_result

    '''
    process step results
    '''
    def default_achieved_goal(self):
        #most pessimistic case
        goal_dict = {}
        goal_dict['current_height'] = -1
        goal_dict['current_area'] = -1
        goal_dict['current_deformation'] = -1
        return goal_dict

    def random_desired_goal(self):
        #best case
        goal_dict = {}
        goal_dict['current_height'] = random.uniform(-0.5, -0.2) # something between 18.75cm and 30.0cm
        goal_dict['current_area'] = random.uniform(-0.8, -0.6) # something between a tenth and a fifth of the working area covered
        goal_dict['current_deformation'] = random.uniform(0.5, 0.75) #something between 2.5cm and 1.25cm average tcp displacement 
        return goal_dict

    def fill_goal_dict_from_moveit_collisions(self, goal_dict, collisions):
        # REDO!!!
        #success case
        if not collisions[4]:
            goal_dict['collision'] = 1.0
            return
        
        #self collision
        if collisions[0]:
            goal_dict['collision'] = -1.0
            return

        #wall collision
        if collisions[1]:
            goal_dict['collision'] = -0.3333333
            return

        #table collision
        if collisions[2]:
            goal_dict['collision'] = 0.3333333
            return

        #state collision
        if collisions[3]:
            goal_dict['collision'] = 0.66666666
            return

        #combined collision
        if collisions[4]:
            goal_dict['collision'] = 0.9
            return

    def fill_goal_dict_from_gh_simulation(self, goal_dict, sim_result):
        #remapping from 0.0 to 750.0 into -1.0 to 1.0
        goal_dict['current_height'] = (sim_result['current_height'] / settings.OBSERVATION_CUBE_LENGTH) * 2.0 - 1.0

        #remapping from 0.0 to MAX_AREA into -1.0 to 1.0
        goal_dict['current_area'] = (sim_result['current_area'] / settings.MAX_AREA) * 2.0 - 1.0

        #remapping from 0.0 to MAX_DEFORMATION to -1.0 to 1.0
        goal_dict['current_deformation'] = (sim_result['current_tcp_displacement'] / settings.MAX_DEFORMATION) * -2.0 + 1.0

        #deformation is mean cartesian tcp displacement scaled by observation_cube_length
        #by default deformation is 1.0 (meaning NO deformation), bc. that results in smooth transition from 'no tcps present' to 
        #'slightly deformed tcps present' as it's the case when new tcps with high anchor amount are introduced
        #this encourages the agent to maintain deformation=1.0 rather than figuring out that there's a step between 0 present tcps and some tcps

        return goal_dict

    def goal_dict_to_tensor(self, goal_dict):
        tensor = np.zeros(shape=(self.goal_dim,), dtype=np.float32)
        tensor[0] = min(1.0, max( -1.0, goal_dict['current_height']))
        tensor[1] = min(1.0, max( -1.0, goal_dict['current_area']))
        tensor[2] = min(1.0, max( -1.0, goal_dict['current_deformation']))
        return tensor

    def assemble_additional_info(self, path_planning_result, print_result):
        info = np.zeros(shape=(self.additional_info_dim,), dtype=np.float32)
        col = path_planning_result['collisions']
        info[0] = 0.0 if col[0] else (0.2 if col[1] else (0.4 if col[2] else (0.6 if col[3] else (0.8 if col[4] else 1.0))))

        info[1] = print_result['dist_to_state_mesh']
        info[2] = print_result['printability_ratio']
        info[3] = print_result['tilt_angle']
        info[4] = print_result['current_height']
        info[5] = print_result['current_area']
        info[6] = print_result['current_tcp_displacement']
        info[7] = print_result['action_tcp']['position']['x']
        info[8] = print_result['action_tcp']['position']['y']
        info[9] = print_result['action_tcp']['position']['z']
        info[10] = print_result['action_tcp']['orientation']['x']
        info[11] = print_result['action_tcp']['orientation']['y']
        info[12] = print_result['action_tcp']['orientation']['z']
        info[13] = print_result['action_tcp']['orientation']['w']
        info[14] = print_result['compression_loss']
        info[15] = print_result['highest_point']['x']
        info[16] = print_result['highest_point']['y']
        info[17] = print_result['highest_point']['z']

        return info

    def compute_reward(self, achieved_goal, desired_goal, info):
        if achieved_goal[0] >= desired_goal[0] and achieved_goal[2] >= desired_goal[2]:
            return 1.0
        if achieved_goal[1] >= desired_goal[1] and achieved_goal[2] >= desired_goal[2]:
            return 1.0

        return 0.0

    def shape_reward(self, path_planning_result, print_result):
        #collision
        col = path_planning_result['collisions']
        self.reward = 0.0 if col[0] else (0.04 if col[1] else (0.08 if col[2] else (0.12 if col[3] else (0.16 if col[4] else 0.2))))
        if self.reward < 0.2:
            return self.reward

        #distance to state mesh
        dist_ratio = (1.0 - min(1.0, (max(0.0, (print_result['dist_to_state_mesh'] - 100.0)) / (settings.DISTANCE_TCP_STATE_MAX - 200.0)))) * 0.3
        tilt_ratio = max(0.7854, min(1.5708, print_result['tilt_angle'])) - 0.7854
        tilt_ratio_0to1 = 1.0 - (tilt_ratio / (1.5708 - 0.7854))
        self.reward += dist_ratio * tilt_ratio_0to1


        #printability
        printab = print_result['printability_ratio'] * 0.2
        if printab == 0.0:
            return self.reward

        #TO DO if printab > 0.0 and print_result['current_tcp']['position']['z'] > 
        self.reward += printab
        

        #area growth or height growth
        height_growth_0to1 = min(1.0, (max(0.0, print_result['current_height'] - self.previous_height) / 90.0))
        area_growth_0to1 = min(1.0, (max(0.0, print_result['current_area'] - self.previous_area) / (90.0 * 90.0)))        
        #TO DO displ_1to0 = min(-2.0, max(2.0, print_result['current_tcp_displacement'] - self.previous_tcp_displacement)) / 4.0
        performance_ratio = min(1.0, (height_growth_0to1 + area_growth_0to1)) * 0.3

        self.reward += performance_ratio

        return self.reward


    def is_goal_based(self):
        if "DeepBuilderGoalEnv" in str(self.__class__):
            return True
        elif "DeepBuilderShapedEnv" in str(self.__class__):
            return False

    '''
    RHINO REQUESTS
    '''
    #for simulation
    def FH_Reset(self):
        p = {}
        p["reset"]=True
        p["populate_sim"]=0
        self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)
        time.sleep(settings.TIME_RESET_BTN)
        p["reset"]=False
        pop = self.current_play % 10 < self.populate_simulation * 10
        p["populate_sim"]= 0 if not pop else random.randint(0, 99999999)
        
        simulation_result = self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)

        if pop and int(self.rhino_pid) > 0:
            self.state_mesh = dict(vertices = simulation_result['state_mesh_vertices'], indices=simulation_result['state_mesh_indices'])
            #self.ros_comm().test_pose(settings.HOME_POSE, state_mesh=self.state_mesh)

        return simulation_result

    def FH_Run(self, run):
        p={}
        p["run"]=run
        return self.SafeRequest('fh_run', p, settings.TIMEOUT_FH)
        

    #for real
    def get_print_path(self, action):
        p = {}
        p["action"] = []
        for a in range(len(action)):
            p["action"].append("A"+str(a)+"="+str(action[a]))        

        return self.SafeRequest('get_print_path', p, settings.TIMEOUT_ACTION)

    def get_sensor_poses(self, action):
        p = {}
        p["action"] = []
        for a in range(len(action)):
            p["action"].append("A"+str(a)+"="+str(action[a]))        

        return self.SafeRequest('get_sensor_path', p, settings.TIMEOUT_ACTION)

    #sends tags recognized in ros through robotic real world scanning to rhino and gets the compression back
    def update_state_tags(self, tags):
        return self.SafeRequest('update_state', tags, settings.TIMEOUT_ACTION)

    #for both simulation and real print
    def RhinoSimulation(self, action):
        p = {}
        p["action"]=[]
        for a in range(len(action)):
            p["action"].append("A"+str(a)+"="+str(action[a]))

        return self.SafeRequest('print_segment', p, settings.TIMEOUT_ACTION)

    def SafeRequest(self, controller, _params, _timeout):
        _params["rhino_pid"]=self.rhino_pid
        _params["session"]=self.session_name
        _params["act_id"]=self.action_id

        while True:
            try:
                r = requests.get(settings.RHINOREMOTE_URL + controller, params = _params, timeout = _timeout, headers={'Cache-Control': 'no-cache'})

                if r.text == "invalid request":
                    raise ValueError('Invalid request', 'Invalid request')

                j = json.loads(r.text)

                if int(j["rhino_pid"]) != int(self.rhino_pid):
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

    '''
    ROS REQUESTS
    '''
    def ros_comm(self):
        if self.__ros_comm == None:
            print("Connecting to ROS...")
            self.__ros_comm = rc.Connection(self.session_name)
            print("...Done!")
        return self.__ros_comm

    #print_plan should be a dict containing three members: way_points_cartesian as a flat array of 7d way points, 'first_way_point_joint_states' and 'last_way_point_joint_states' (required for planning)
    def ros_print_path_with_robot(self, action, print_plan):
        print_plan["action"] = action[0:6]
        return self.ros_comm().print_path(print_plan)

    def ros_scan_state(self, sensor_poses):
        return self.ros_comm().scan_state(sensor_poses)

    def print_db(self, text, color, end="\n", attrs=[]):
        attributes = (['dark'] if self.phase == 'eval' else [])
        attributes.extend(attrs)
        print(colored(text, color=color, attrs=attributes), end=end)


class DeepBuilderGoalEnv(DeepBuilderEnv, gym.GoalEnv):
    def __init__(
        self, 
        session_name, 
        is_simulation, 
        rhino_pid=-1, 
        action_dim=7, 
        observation_dim=144,
        goal_dim=3,
        additional_info_dim = 18,
        observation_noise_mean=0.0,
        observation_noise_std=0.0008,
        terminate_at_collision=False,
        max_steps_per_play=30,
        populate_simulation=0.5
        ):

            DeepBuilderEnv.__init__(
            self, 
            session_name, 
            is_simulation, 
            rhino_pid, 
            action_dim, 
            observation_dim,
            goal_dim,
            additional_info_dim,
            observation_noise_mean,
            observation_noise_std,
            terminate_at_collision,
            max_steps_per_play,
            populate_simulation
            )

            gym.GoalEnv.__init__(self)
            

class DeepBuilderShapedEnv(DeepBuilderEnv, gym.Env):
    def __init__(
        self, 
        session_name, 
        is_simulation, 
        rhino_pid=-1, 
        action_dim=7, 
        observation_dim=144,
        goal_dim=3,
        additional_info_dim = 18,
        observation_noise_mean=0.0,
        observation_noise_std=0.0008,
        terminate_at_collision=False,
        max_steps_per_play=30,
        populate_simulation=0.5
        ):

            DeepBuilderEnv.__init__(
            self, 
            session_name, 
            is_simulation, 
            rhino_pid, 
            action_dim, 
            observation_dim,
            goal_dim,
            additional_info_dim,
            observation_noise_mean,
            observation_noise_std,
            terminate_at_collision,
            max_steps_per_play,
            populate_simulation
            )

            gym.Env.__init__(self)


if __name__ == "__main__":
    env = NormalizedActions(DeepBuilderGoalEnv(session_name = "debug_sess", is_simulation = True))
    env.env.rhino_pid = 16580
    num_steps = 20
    while True:
        env.env.reset()
        for i in range(num_steps):
            _in = input("action: ")
            action = list(map(float, _in.split(',')))
            obs, rew, done, info = env.step(action)
            if done:
                break
    print("done bye")