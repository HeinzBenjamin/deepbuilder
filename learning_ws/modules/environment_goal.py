import gym
from gym import spaces
import numpy as np
from . import environment as env

#this is the environment used by every learning algorithm
#it communicates with ROS learner and runtime to exchange info
#sad that this shit requires so much boiler plate code

class DeepBuilderGoalEnv(env.DeepBuilderEnv):
    def __init__(self, sess_name, act_dim, box_dim, max_num_boxes, height_field_res, goal_dim):
        super(DeepBuilderGoalEnv, self).__init__(sess_name, act_dim, box_dim, max_num_boxes, height_field_res)

        self.desired_goal = spaces.Box(0.0, 1600.0, shape=(goal_dim,), dtype=np.float64)
        self.achieved_goal = spaces.Box(0.0, 1600.0, shape=(goal_dim,), dtype=np.float64)
        self.observation = spaces.Box(self.state_low, self.state_high, shape=(height_field_res*height_field_res,),dtype=np.float32)

        self.observation_space = spaces.Dict({"observation": self.observation, "desired_goal": self.desired_goal, "achieved_goal": self.achieved_goal})
        print(self.observation_space)

    def goal_mapping(self, prev_state, obs):
        #each state fulfills exactly one goal
        # goals:
        # [0, 0, 1] : robot outside boundary, collision, bad
        # [1, 0, 0] :   
        return achieved_goal, rew