import gym, torch, numpy, uuid
from gym import spaces
import ros_communication as rc
import settings

class NormalizedActions(gym.ActionWrapper):
    def action(self, action):
        low  = self.action_space.low
        high = self.action_space.high 
        rng = high.max()-low.min()

        #first axis is halfed so we only operate in on one half of the action space
        action[0] *= 0.5
        action[0] += rng/4

        #second axis only operates in [-180, 0] to avoid obvious floor collisions
        action[1] *= 0.5
        action[1] -= rng/4

        action[2] *= 0.5
        action[2] += rng/4
        return action

    def reverse_action(self, action):        
        low  = self.action_space.low
        high = self.action_space.high 

        rng = high.max-low.min
        
        action[0] -= rng/4
        action[0] *= 2.0

        action[1] += rng/4
        action[1] *= 2.0

        action[2] -= rng/4
        action[2] *= 2.0
        return action

class DeepBuilderGoalEnv(gym.GoalEnv):
    def __init__(self, session_name):
        super(DeepBuilderGoalEnv, self).__init__()

        if session_name == None or session_name == '':
            raise Exception("Session name missing")
        
        self.session_name = session_name
        self.action_dim = 7         #six axes plus one box rotation in tcp frame (for now)
        self.observation_dim = 144  #bc #yolo

        self.action_space = spaces.Box(-numpy.pi,  numpy.pi, shape=(self.action_dim,), dtype=numpy.float32)
        self.observation_space = spaces.Box(-2.5,  2.5, shape=(self.observation_dim,), dtype=numpy.float32) #bounds solely based on observations! no garantuee


        '''HIDDEN MEMBERS'''
        self.__ros_comm = None

    def step(self, action):
        #guid generation
        self.action_id = str(uuid.uuid4().hex)[:8]

        action_array = action.numpy().tolist()
        jo = self.ros_comm().test_pose(action_array)

    def compute_reward(self, achieved_goal, desired_goal, info):
        pass

    def reset(self):
        pass

    def ros_comm(self):
        if self.__ros_comm == None:
            self.__ros_comm = rc.Connection(self.session_name)
        return self.__ros_comm

if __name__ == "__main__":
    env = DeepBuilderGoalEnv("sess")
    bla = env.step(torch.rand(7))