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
        observation_noise_std=0.0008,
        terminate_at_collision=False,
        max_steps_per_play=30,
        populate_simulation=True
        ):

        super(DeepBuilderGoalEnv, self).__init__()      

        #things relevant for connections
        self.session_name = session_name
        self.is_simulation = is_simulation
        np.set_printoptions(precision = 5, suppress=True)


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
        self.action_array = np.zeros(self.action_dim, dtype=np.float32)
        self.reward = 0
        self.done=False

        self.observation_dict = {}
        self.observation_dict['observation'] = []
        self.observation_dict['desired_goal'] = self.goal_dict_to_tensor(self.default_desired_goal())
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.default_achieved_goal())

        #just needed for some registration and book keeping. doesn't actually hold any value
        self.action_space = spaces.Box(-np.pi,  np.pi, shape=(self.action_dim,), dtype=np.float32)
        self.observation = spaces.Box(-np.pi,  np.pi, shape=(self.observation_dim,), dtype=np.float32) #bounds solely based on observations and estimation! no garantuee
        self.desired_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success
        self.achieved_goal = spaces.Box(-1.0, 1.0, shape=(self.goal_dim,), dtype=np.float32) #-1: fail  1: success

        self.observation_space = spaces.Dict()
        self.observation_space.spaces['observation'] = self.observation
        self.observation_space.spaces['desired_goal'] = self.desired_goal
        self.observation_space.spaces['achieved_goal'] = self.achieved_goal        

        #info to print to screen
        self.note = ""

        #stuff for printing
        self.print_speed = 0.001
        self.nozzle_speed_factor = 0.1
        self.print_heat = 200
        self.state_tags = None
        self.previous_print_result = {}

        '''HIDDEN MEMBERS'''
        self.__ros_comm = None

    '''
    main functions
    '''
    def reset(self):
        self.is_synced = False

        self.ros_comm().reset_state_mesh()
        self.ros_comm().reset_compressed_mesh()
        self.send_state_mesh_to_ros = False
        self.state_mesh = {}

        if self.is_simulation:
            sim_res = self.FH_Reset()
            self.observation_dict['observation'] = sim_res["state_compressed"]
            

        else:
            print("Retrieving sensor paths")
            sensing_poses = self.get_sensor_poses(settings.HOME_SCANNING_POSE)

            print("Collecting tag info")
            self.state_tags = self.ros_scan_state(sensing_poses)

            print("Sending new state tags to Rhino")
            sim_res = self.update_state_tags(self.state_tags)
            self.observation_dict['observation'] = sim_res["state_compressed"]


        self.RhinoSimulation(settings.HOME_POSE)

        self.observation_dict['observation'] += np.random.normal(loc=self.observation_noise_mean, scale=self.observation_noise_std, size=[self.observation_dim])
        self.achieved_goal_dict = self.default_achieved_goal()
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(self.achieved_goal_dict)

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
        info = "{}--{}--{}--{}".format(self.session_name, self.action_id, self.current_play, self.current_step)

        action_array = action.copy()
        achieved_goal_dict = self.default_achieved_goal()

        #moveit path planning
        mesh_to_send = {} if not self.send_state_mesh_to_ros else self.state_mesh
        path_planning_result = self.ros_comm().test_pose(action_array[:6].tolist(), state_mesh=mesh_to_send)
        #self.print_db("[{}-{}] Path planning result: {}".format(self.session_name, self.action_id, path_planning_result['message']), color='white')
        self.note += "Path planning: " + path_planning_result['message'] + ", rewards: "
        info += " +++ path_planning: " + path_planning_result['message']
        self.fill_goal_dict_from_moveit_collisions(achieved_goal_dict, path_planning_result['collisions'])

        if path_planning_result['message'] == "SUCCESS":
            print_result = {}
            if self.is_simulation:
                print_result = self.print_simulation(action)
            else:
                print_result = self.print_real(action)

            self.fill_goal_dict_from_gh_simulation(achieved_goal_dict, print_result)
            self.ros_comm().update_compressed_mesh(comp_mesh_vertices = print_result['compressed_mesh_vertices'], comp_mesh_indices = print_result['compressed_mesh_indices'])
            info += " +++ printability ratio: " + str(print_result['printability_ratio'])
            #self.print_db("[{}-{}] Simulation result: Printability ratio: {}".format(self.session_name, self.action_id, print_result['printability_ratio']), color='white')
            self.observation_dict['observation'] = np.array(print_result['state_compressed'], dtype=np.float32)
            self.send_state_mesh_to_ros = print_result['printability_ratio'] > 0.0
            if self.send_state_mesh_to_ros:
                self.state_mesh = dict(vertices = print_result['state_mesh_vertices'], indices=print_result['state_mesh_indices'])

        if (self.terminate_at_collision and path_planning_result['message'] != 'SUCCESS') or (self.current_step >= (self.max_steps_per_play - 1)):
            self.done = True
            self.current_play += 1

         
        self.observation_dict['achieved_goal'] = self.goal_dict_to_tensor(achieved_goal_dict)
        self.observation_dict['observation'] += np.random.normal(loc=self.observation_noise_mean, scale=self.observation_noise_std, size=[self.observation_dim])

        self.reward = self.compute_reward(self.observation_dict['achieved_goal'], self.observation_dict['desired_goal'], '')
             

        self.current_step += 1

        self.is_synced = True
        self.print_db("[{}-{}] Action: {}".format(self.session_name, self.action_id, action), color='blue')
        #self.print_db("[{}-{}] Achieved Goal: {}".format(self.session_name, self.action_id, self.observation_dict['achieved_goal']), color='blue')
        #self.print_db("[{}-{}] Compressed state: {}, ...".format(self.session_name, self.action_id, self.observation_dict['observation'][0:3]), color='blue')
        self.print_db("[{}-{}] Note: {}".format(self.session_name, self.action_id, self.note), color='cyan')
        self.print_db("[{}-{}] Done: {}".format(self.session_name, self.action_id, self.done), color='blue', end="")
        
        self.print_db("      Reward: {}".format(self.reward), color='blue', attrs=['bold'])
        

        #rlkit requries us to return quote 'next_o, r, d, env_info' as simple lists and numbers
        return self.observation_dict, self.reward, self.done, info

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
        goal_dict['self_collision'] = -1
        goal_dict['wall_collision'] = -1
        goal_dict['table_collision'] = -1
        goal_dict['state_collision'] = -1
        goal_dict['all_collision'] = -1
        goal_dict['printability_ratio'] = -1
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
        goal_dict['printability_ratio'] = 1
        goal_dict['dist_to_state'] = 0.9 # corresponds to a radius of 12.5cm around the state mesh. the goal is to get that near or closer
        goal_dict['current_height'] = -0.33333333 # corresponds to a height of 25cm
        goal_dict['current_area'] = -0.5 #corresponds to a quarter of the totally available area being covered (anchor area subtracted)
        goal_dict['deformation'] = 0.95 # corresponds to a average displacement of 2cm for the recorded tcps. the goal is to get that or less
        return goal_dict

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
        goal_dict['printability_ratio'] = sim_result['printability_ratio'] * 2.0 - 1.0

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
        tensor[5] = min(1.0, max( -1.0, goal_dict['printability_ratio']))
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
        
        reward = -0.01 #shouldn't be zero to be effective, shouldn't be meaningful positive either
        #printability
        if (achieved_goal[5] < 0.0) == (desired_goal[5] < 0.0):
            reward += 1.0
            self.note += "printability "

        #distance to state
        if achieved_goal[6] >= desired_goal[6]:
            reward += 1.0
            self.note += "dist to state "

        #current_height
        if achieved_goal[7] >= desired_goal[7]:
            reward += 2.0
            self.note += "height "

        #current_area
        if achieved_goal[8] >= desired_goal[8]:
            reward += 2.0
            self.note += "area "

        #deformation
        if achieved_goal[9] >= desired_goal[9] and achieved_goal[5] > 0.0:
            reward += 1.0
            self.note += "deformation "

        return reward


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
        p["populate_sim"]= 0 if not pop else random.randint(0, 99999)
        
        simulation_result = self.SafeRequest('fh_reset', p, settings.TIMEOUT_FH)

        if pop and int(self.rhino_pid) > 0:
            self.state_mesh = dict(vertices = simulation_result['state_mesh_vertices'], indices=simulation_result['state_mesh_indices'])
            self.ros_comm().test_pose(settings.HOME_POSE, state_mesh=self.state_mesh)

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

    def ros_update_state_mesh(self, state_mesh_vertices, state_mesh_indices):
        self.ros_comm().update_state_mesh(state_mesh_vertices, state_mesh_indices)

    def ros_update_compressed_mesh(self, compressed_mesh_vertices, compressed_mesh_indices):
        self.ros_comm().update_compressed_mesh(compressed_mesh_vertices, compressed_mesh_indices)


    def print_db(self, text, color, end="\n", attrs=[]):
        attributes = (['dark'] if self.phase == 'eval' else [])
        attributes.extend(attrs)
        print(colored(text, color=color, attrs=attributes), end=end)

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