import time, socket, pickle, gym, torch, uuid, requests, json, math, os, zipfile, io, timeit, datetime
import torch.nn as nn
import numpy as np
import multiprocessing
from termcolor import colored
from gym import spaces
from deepbuilder_py import Msgs as m
from . import networks as n
from . import path_planning as pp
from . import reward
from . import ros_communication as rc
from .settings import *

#this is the environment used by every learning algorithm
#it communicates with ROS learner and runtime to exchange info
#sad that this shit requires so much boiler plate code

class DeepBuilderEnv(gym.Env):
    def __init__(self, sess_name, act_dim, box_dim, max_num_boxes, height_field_res):
        #init base class
        super(DeepBuilderEnv, self).__init__()

        if sess_name == None or sess_name == '':
            raise Exception("Session name missing")

        #unpack and store args
        self.max_num_boxes = max_num_boxes             #nr of boxes to stack before reset is called
        self.box_dim = box_dim                         #dimension of box representation. as pose it's 7

        #documentation and communication requirements
        self.session_name = sess_name                   #a descriptive, short, unique name mentioning the algorithm, maybe date, maybe some params, used for documentation
        self.rhino_pid = 0                              #process id of grasshopper on windows side, used to keep and maybe kill the process if necessary
        self.path = []      #current gh-tested path, unformatted 
        self.act_id = ''    #current action id

        self.height_field_res = height_field_res
        self.height_field_noise_scale = 10
        self.state_low = -200.0
        self.state_high = 1600.0
        self.reward_scale = 0.01

        #setting up torch and openAI objects
        self.action_space = spaces.Box(-np.pi,  np.pi, shape=(act_dim,), dtype=np.float32)
        self.observation_space = spaces.Box(self.state_low, self.state_high, shape=(height_field_res * height_field_res,), dtype=np.float32) #no idea if we actually need this

        #this is actually kept up to date
        self.state = torch.randn(height_field_res * height_field_res) * self.height_field_noise_scale #init state as tiny

        #simulation state and parameters for actual learning
        self.current_height = -9999.9
        self.has_boxes = False
        self.box_std = 0.0                          # we monitor the standard deviation of all box x, and y value. when the agent takes an action that lowers the std, it gets an extra reward
        self.last_boxes_seen = []
        self.last_height_field_seen = [0.0]*(height_field_res*height_field_res)

        self.box_noise_scale_pos = 10
        self.box_noise_scale_ori = 0.07        

        self.is_simulation = True
        self.use_moveit = True
        self.hidden_ros_comm = rc.Connection(self.session_name)

        #path planning params
        self.path_steps = 20      #number of intermediate steps between home and pose
        self.safe_paths = []     #store all poses that can be reached without collisions      

        self.max_rounds = 20
        self.round = 0
        self.fh_needs_reset = True  

    '''
    accepts a torch tensor of size [act_dim] as action
    passes it to ROS, where it then passed to GH
    awaits response and eventually
    returns obs, rew, done, info
    '''
    def step(self, action):
        #Execute one time step within the environment
        #generate unique guid for each action. only the first 8 characters matter (for readability)
        self.act_id = str(uuid.uuid4().hex)[:8]
        old_pid = self.rhino_pid

        #msg = ("Sending action: " + self.act_id + " - A0:" + '%.3f' % action.data[0] + " A1:" + '%.3f' % action.data[1] + " A2:" + '%.3f' % action.data[2] + " A3:" + '%.3f' % action.data[3] + " A4:" + '%.3f' % action.data[4] + " A5:" + '%.3f' % action.data[5])
        #print(colored(msg, 'blue'))
        
        #set default returns
        obs = {}
        rew = 0
        done = False
        info = ""

        action_array = []
        for i in range(6):
            action_array.append(float(action[i]))

        #self.rhino_pid, res = rr.TestPathInGH(self.rhino_pid, GH_CTRL_ACTION_REACH, self.session_name, self.act_id, self.path)
        if not self.use_moveit:
            #simple p2p movement, can be imporved later
            self.path=pp.P2P(HOME_POSE, action, self.path_steps)
            res = self.RhinoTestCollision(self.path)
            rew, info, done, pose_reachable = reward.ForCollisionInGoalPose(res["self_collisions"][-1], res["env_collisions"][-1])

            #self.double_check_req(old_pid)


            '''
            REW STRUCTURE FOR PATH PLANNING
            '''
            #check if goal pose can at all be reached
            #if not: leave... angrily

            #check if collisions appear in direct p2p path from home
            primary_seg = pp.path_segment([], 0, 0)        
            try_alternative_route = False
            for i in range(self.path_steps):
                if not res["env_collisions"][i] and not res["self_collisions"][i]:
                    primary_seg.points.append(self.path[i])
                else:
                    if pose_reachable:
                        print(colored("Goal pose is safe, but direct p2p path is not. ", color='blue'))
                        try_alternative_route = True and len(self.safe_paths) > 1
                    break

            if try_alternative_route:
                #try alternative path...
                parent_id, i_in_parent, connector, _ = pp.find_closest_from_many(action, self.safe_paths) #expensive
                new_seg = pp.path_segment([], parent_id, i_in_parent)
                new_seg.points = pp.P2P(connector, action, int(self.path_steps / 2))
                new_path = pp.assemble_path(new_seg, self.safe_paths, 2)
                found_safe_path = True
                if new_path == "fail":
                    found_safe_path = False
                else:
                    self.path = new_path
                    res = self.RhinoTestCollision(self.path)

                    for i in range(len(self.path)):
                        if res["env_collisions"][i] or res["self_collisions"][i]:
                            found_safe_path = False
                            break

                if found_safe_path:
                    #print(colored("Found alternative path.", color='blue'))
                    #rew, info = reward.ForAlternativeRoute(rew, info)
                    print(colored("Found safe path.", color='blue'))
                    self.safe_paths.append(new_seg) 
                    pose_reachable = True                
                else:
                    print(colored("Couldn't find alternative path.", color='blue'))
                    pose_reachable = False

            #we're adding the primary path to safe_paths AFTER looking for an alternative path
            #so we don't interfere with alternative path finding
            #finding an alternative route is rewarded with a fixed value, not per point. That'd be silly (or not?)
            if len(primary_seg.points) > 5:
                #rew, info = reward.ForSafePoses(rew, info, len(primary_seg.points))
                self.safe_paths.append(primary_seg)


        else:
            pose_reachable, self.path, _ = self.ros_comm().test_pose(action_array, session_name = self.session_name, state = (0.001*self.state).tolist())
            rew, info, done, _ = reward.ForCollisionInGoalPose(not pose_reachable, not pose_reachable)


        #at this point it's either done = True and the rew is very negative as either goal pose is in collision
        #or the path to the goal pose is not safe
        #if the goal pose can be reached safely done = False and rew is somewhat positive (but small)
        '''
        REW STRUCTURE FOR BLOCK DROPPING
        '''
        if pose_reachable:
            #else send request for FH simulation
            res = []
            dropped_successfully = True
            if self.is_simulation:
                #simulation drop
                print(colored("Running FlexHopper simulation... ", 'blue'), end='')
                self.FH_Run(True)
                start = time.time()
                res = self.RhinoDrop(action)
                self.FH_Run(False)
                print(colored("("+str(time.time()-start)+"sec)... Got response", 'blue'))
                dropped_successfully = True

            else:
                #robo drop
                print(colored("Running action on robot... ", 'blue'), end='')
                dropped_successfully, res = self.ros_comm().drop_block(action_array, double_check=True)

                
            #if the pose can't be reached for some reason, it'll be treated as if collisions occured
            if not dropped_successfully:
                rew, info, done, _ = reward.ForCollisionInGoalPose(True, True)
            else:
                rew, info = reward.TowerChange(rew, info, self.current_height, res, BOX_WIDTH, BOX_HEIGHT)
                if "Block stuck on robot" not in info:
                    rew, info = reward.ForControlledAction(rew, info, res["angle_tcp2box"], res["dist_tcp2box"])
                    if self.has_boxes:
                        rew, info = reward.ForTcpCloseToTower(rew, info, res, self.last_boxes_seen) #only considers previously present blocks, not this new one
                        #rew, info = reward.ForLowStd(rew, info, self.box_std)

                    self.current_height = res["current_height"]
                self.last_boxes_seen = res["box_poses"]
                self.last_height_field_seen = res['height_field']


        if self.round >= self.max_rounds or len(self.last_boxes_seen) >= self.max_num_boxes:
            done = True
        self.round += 1

        #obs = self.BoxesToObservation(self.last_boxes_seen, randomize_order=True)
        obs = self.HeightFieldObservation(self.last_height_field_seen)

        self.has_boxes = len(self.last_boxes_seen) > 0

        if rew > -5.0:
            print("Reward: " + str(rew) + ", Done: " + str(done) + ", Info: " + info)
        
        return obs, rew * self.reward_scale, done, info

    def reset(self):
        # Reset the state of the environment to an initial state
        # Reset FlexHopper by deleting all boxes (if there are any)
        if self.is_simulation and (self.fh_needs_reset or self.path == [] or self.has_boxes):
            try:
                self.FH_Reset()
            except ValueError as err:
                if not err.args[0] == "GH_OUT":
                    raise

            self.state = torch.randn(self.height_field_res * self.height_field_res) * self.height_field_noise_scale

        #Resetting robot stuff with user input
        if not self.is_simulation:
            input("Resetting, make sure that a) the robot is in home position, b) the gripper is open, c) there's NO block in the gripper, d) (optional) blocks are removed from arena. Hit enter to continue!")
            self.ros_comm().move_home()
            sense_vals = self.ros_comm().get_sensor_values()
            self.state = torch.FloatTensor(sense_vals)
            self.ros_comm().get_block()

        # Reset rest
        self.current_height = -9999.9
        self.round = 0
        self.last_boxes_seen = []
        self.last_height_field_seen = [0.0]*(self.height_field_res*self.height_field_res)

        #setting box_std back to zero
        self.box_std = 0.0
        return self.state

    #if optional_path is not supplied, last self.path is used
    def screenshot(self, _play, _round, optional_path = []):
        self.RhinoScreenshot(_play,_round,self.path if optional_path == [] else optional_path)
        time.sleep(0.1)

    def RhinoTestCollision(self, path):
        p = {}
        p["path"]=[]
        
        for i in range(len(path)):
            for a in range(len(path[i])):
                point = ("P%02d" % (i,))+"A"+str(a)+"="+str(path[i][a])
                p["path"].append(point)

        return self.SafeRequest('coll_test', p, TIMEOUT_COLL)

    def RhinoDrop(self, action):
        p = {}
        p["action"]=[]
        for a in range(len(action)):
            p["action"].append("P00A"+str(a)+"="+str(action[a]))

        return self.SafeRequest('drop', p, TIMEOUT_DROP)

    def RhinoScreenshot(self, _play, _round, path):
        p = {}
        p["play"]=_play
        p["round"]=_round        
        p["path"]=[]
        for i in range(len(path)):
            for a in range(len(path[i])):
                point = ("P%02d" % (i,))+"A"+str(a)+"="+str(path[i][a])
                p["path"].append(point)

        return self.SafeRequest('screenshot', p, TIMEOUT_COLL)

    def FH_Reset(self):
        p = {}
        p["reset"]=True
        self.SafeRequest('fh_reset', p, TIMEOUT_FH)
        time.sleep(TIME_RESET_BTN)
        p["reset"]=False
        return self.SafeRequest('fh_reset', p, TIMEOUT_FH)

    def FH_Run(self, run):
        p={}
        p["run"]=run
        return self.SafeRequest('fh_run', p, TIMEOUT_FH)

    def SafeRequest(self, controller, _params, _timeout):
        _params["rhino_pid"]=self.rhino_pid
        _params["session"]=self.session_name
        _params["act_id"]=self.act_id

        try:
            r = requests.get(RHINOREMOTE_URL + controller, params = _params, timeout = _timeout, headers={'Cache-Control': 'no-cache'})

            if r.text == "invalid request":
                raise ValueError('INVALID REQUEST', 'INVALID REQUEST')

            j = json.loads(r.text)

            if j["rhino_pid"] != self.rhino_pid:
                self.rhino_pid = j["rhino_pid"]
                self.fh_needs_reset = True
                raise ValueError('GH_OUT', 'GH_OUT')
            self.fh_needs_reset = False
            try:
                return json.loads(j["content"])
            except:
                raise requests.exceptions.ConnectionError

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

    def HeightFieldObservation(self, height_field):
        for i in range(len(height_field)):
            self.state[i] = height_field[i] + np.random.normal(0, self.height_field_noise_scale)
        return self.state

    def ros_comm(self):
        if self.hidden_ros_comm == None:
            self.hidden_ros_comm = rc.Connection(self.session_name)
        return self.hidden_ros_comm

    def serializable(self):
        del self.hidden_ros_comm
        self.hidden_ros_comm = None
        return self

    '''
    def BoxesToObservation(self, box_poses, randomize_order=True):
        
        observations are stored as follows
        obs = torch.tensor
        [
            |-----------------------------------box_dim----------------------------------| 

            [0.003,         0.011,     0.006,     0.001,      0.02,     0.003,     0.071],      T
            [box5_posX, box5_posY, box5_posZ, box5_ornX, box5_ornY, box5_ornZ, box5_ornW],      |         
            [box2_posX, box2_posY, box2_posZ, box2_ornX, box2_ornY, box2_ornZ, box2_ornW],      |
            [0.001,         0.002,     0.017,     0.000,      0.02,     0.003,     0.001],      |
            [box1_posX, box1_posY, box1_posZ, box1_ornX, box1_ornY, box1_ornZ, box1_ornW],      |
            [0.001,         0.002,     0.017,     0.000,      0.02,     0.003,     0.001],      |
            .                                                                                   |
            .                                                                              max_num_boxes
            .                                                                                   |
            [box2_posX, box2_posY, box2_posZ, box2_ornX, box2_ornY, box2_ornZ, box2_ornW]       |
        ]

        whenever computation is performed this 2d tensor is flattened into 1d
        it is initialised with very small values and filled when new boxes appear at random places.
        also the order is shuffled after each step
        

        tmp_state = torch.randn(self.max_num_boxes, self.box_dim) * 0.001

        xsum=0.0
        ysum=0.0
        order = range(self.max_num_boxes)
        if randomize_order:
            order = np.random.permutation(order)

        for i in range(len(box_poses)):
            b=box_poses[i]
            xsum+=b["position"]["x"]
            ysum+=b["position"]["y"]
            tmp_state[order[i]]=torch.tensor([
                b["position"]["x"] + np.random.normal(0, self.box_noise_scale_pos),
                b["position"]["y"] + np.random.normal(0, self.box_noise_scale_pos),
                b["position"]["z"] + np.random.normal(0, self.box_noise_scale_pos),
                b["orientation"]["w"] + np.random.normal(0, self.box_noise_scale_ori),
                b["orientation"]["x"] + np.random.normal(0, self.box_noise_scale_ori),
                b["orientation"]["y"] + np.random.normal(0, self.box_noise_scale_ori),
                b["orientation"]["z"] + np.random.normal(0, self.box_noise_scale_ori)])        
        
        #calc std variations in all dimensions as vector
        
        if len(box_poses) > 1:
            xmean = xsum/len(box_poses)
            ymean = ysum/len(box_poses)
            xvar = 0.0
            yvar = 0.0

            for i in range(len(box_poses)):
                b=box_poses[i]
                xvar+=(xmean-b["position"]["x"])*(xmean-b["position"]["x"])
                yvar+=(ymean-b["position"]["y"])*(ymean-b["position"]["y"])
            
            xvar/=len(box_poses)
            yvar/=len(box_poses)

            xstd = math.sqrt(xvar)
            ystd = math.sqrt(yvar)

            self.box_std = math.sqrt((xstd*xstd)+(ystd*ystd))
            #print(colored("New box x,y standard deviation = " + str(self.box_std), 'blue'))
        
        self.state = tmp_state.reshape(self.max_num_boxes * self.box_dim,).squeeze(0)
        return self.state
    '''