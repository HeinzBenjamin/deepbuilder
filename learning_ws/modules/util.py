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


def remap_linear(value, lowerA, upperA, lowerB, upperB):
    rangeA = upperA - lowerA
    rangeB = upperB - lowerB
    return (((value - lowerA) * rangeB) / rangeA) + lowerB