import random, json
from termcolor import colored
import numpy as np
import gym

quat_sum = 200.0 #played a bit with it in rhino. 200.0 seems stable. no idea why tbh

class ReplayBuffer:
    def __init__(self, capacity):
        self.capacity = capacity
        self.buffer = []
        self.position = 0

    def push_many(self, states, actions, rewards, next_states, dones):
        print("Pushing trajectory of length "+ str(len(states))+" into replay_buffer. ")
        for i in range(len(states)):
            self.push(states[i], actions[i], rewards[i], next_states[i], dones[i])

    def push(self, state, action, reward, next_state, done):
        if len(self.buffer) < self.capacity:
            self.buffer.append(None)
        self.buffer[self.position] = (state, action, reward, next_state, done)
        self.position = (self.position + 1) % self.capacity
    
    def sample(self, batch_size):
        batch = random.sample(self.buffer, batch_size)
        state, action, reward, next_state, done = map(np.stack, zip(*batch))
        return state, action, reward, next_state, done
    
    def __len__(self):
        return len(self.buffer)


class NormalizedActions(gym.ActionWrapper):
    #great explanations on how to work with rotations in optimization here:
    #https://math.stackexchange.com/questions/2992016/how-to-linearize-quaternions
    #as suggested in one of the answers, we'll use the quaternion form with renormalization for every action (for now)
    #only necessary for cartesian actions
    def action(self, action):
        low  = self.action_space.low
        high = self.action_space.high 

        rng = high.max()-low.min()

        #first axis is halfed so we only operate in on one half of the action space
        action[0] *= 0.5
        action[0] += rng/4

        #second axis only operates in [-180, 0] to avoid obvious floor and boudning box collisions
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
