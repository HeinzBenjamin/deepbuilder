import time, gym, torch, os
import numpy as np
import torch.nn as nn
import torch.functional as F
import torch.optim as optim
from datetime import datetime
from termcolor import colored

from modules import environment as sim
from modules import networks as n
from modules import stuff
from modules import documentation as doc
from modules.settings import *

'''
this is mainly modelled after https://github.com/vaishak2future/sac/blob/master/sac.ipynb
'''

class SAC_Agent():
    #initialize networks optimizers etc
    def __init__(self, env, act_dim, hid_dim, replay_buffer_size = 200000, value_lr = 3e-4, soft_q_lr = 3e-4, policy_lr=3e-4):
        self.env = stuff.NormalizedActions(env)
        self.docu_flags = [True, True, False] #[0] - save nets, [1] - save data, [2] - save pics
        self.save_agent_every = 10
        self.rnd_plays = 2000 #number of totally randomly played plays before starting actual learning
        self._play = 0
        self._round = 0
        self._tick = 0
        self.docu = None

        self.device=torch.device("cuda" if torch.cuda.is_available() else "cpu")

        #Init replay buffer
        self.replay_buffer_size = replay_buffer_size
        self.replay_buffer = stuff.ReplayBuffer(self.replay_buffer_size)

        #obs_dim = env.box_dim * env.max_num_boxes || BOX POSE MODE
        obs_dim = 144 #  HEIGHT FIELD MODE

        #initialize all the networks
        self.value_net = n.ValueNetwork(obs_dim, hid_dim).to(self.device)
        self.target_value_net = n.ValueNetwork(obs_dim, hid_dim).to(self.device)

        self.soft_q_net1 = n.SoftQNetwork(obs_dim, act_dim, hid_dim).to(self.device)
        self.soft_q_net2 = n.SoftQNetwork(obs_dim, act_dim, hid_dim).to(self.device)
        self.policy_net = n.PolicyNetwork(obs_dim, act_dim, hid_dim).to(self.device)

        for target_param, param in zip(self.target_value_net.parameters(), self.value_net.parameters()):
            target_param.data.copy_(param.data)

        self.value_criterion = nn.MSELoss()
        self.soft_q_criterion1 = nn.MSELoss()
        self.soft_q_criterion2 = nn.MSELoss()

        self.value_lr  = value_lr
        self.soft_q_lr = soft_q_lr
        self.policy_lr = policy_lr

        self.value_optimizer  = optim.Adam(self.value_net.parameters(), lr=self.value_lr)
        self.soft_q_optimizer1 = optim.Adam(self.soft_q_net1.parameters(), lr=self.soft_q_lr) #MAYBE DOUBLE CHECK WITH EXAMPLE, he doesn't use two different optimizers
        self.soft_q_optimizer2 = optim.Adam(self.soft_q_net2.parameters(), lr=self.soft_q_lr)
        self.policy_optimizer = optim.Adam(self.policy_net.parameters(), lr=self.policy_lr)

        #all values that should be documented with the docu class should be kept here public and updated during learning so the documentation class can access it
        self.q_value_loss1 = 0 
        self.q_value_loss2 = 0
        self.value_loss = 0
        self.policy_loss = 0

    #this is the actual training logic
    def learn_step(self, batch_size, gamma=0.99, soft_tau=1e-2):
        #get random sample from replay_buffer and bring into the proper format on the device
        state, action, reward, next_state, done = self.replay_buffer.sample(batch_size)

        state       = torch.FloatTensor(state).to(self.device)
        next_state  = torch.FloatTensor(next_state).to(self.device)
        action      = torch.FloatTensor(action).to(self.device)
        reward      = torch.FloatTensor(reward).unsqueeze(1).to(self.device)
        done        = torch.FloatTensor(np.float32(done)).unsqueeze(1).to(self.device)

        #get all predictions from the current state of the model
        predicted_q_value1 = self.soft_q_net1(state, action)
        predicted_q_value2 = self.soft_q_net2(state, action)
        predicted_value    = self.value_net(state)
        new_action, log_prob, epsilon, mean, log_std = self.policy_net.evaluate(state)

        #Training Q Function
        target_value = self.target_value_net(next_state)                                    #get prediction of target value network
        target_q_value = reward + (1 - done) * gamma * target_value                         #current reward plus discounted rew of the next step, if not done
        q_value_loss1 = self.soft_q_criterion1(predicted_q_value1, target_q_value.detach()) #calculate loss of soft q net 1
        q_value_loss2 = self.soft_q_criterion2(predicted_q_value2, target_q_value.detach()) #calculate loss of soft q net 2

        ''' EXPLANATION from https://discuss.pytorch.org/t/what-does-the-backward-function-do/9944
        loss.backward() computes dloss/dx for every parameter x which has requires_grad=True. These are accumulated into x.grad for every parameter x. In pseudo-code:
            x.grad += dloss/dx
        optimizer.step updates the value of x using the gradient x.grad. For example, the SGD optimizer performs:
            x += -lr * x.grad
        optimizer.zero_grad() clears x.grad for every parameter x in the optimizer. It’s important to call this before loss.backward(), otherwise you’ll accumulate the gradients from multiple passes.
        '''
        self.soft_q_optimizer1.zero_grad()  #set internal grad vals for each x to zero
        q_value_loss1.backward()            #computes dloss/dx for every parameter which dhas requires_grad=True
        self.soft_q_optimizer1.step()       #updates the vals of x using x.grad
        self.soft_q_optimizer2.zero_grad()  #set internal grad vals for each x to zero
        q_value_loss2.backward()            #computes dloss/dx for every parameter which dhas requires_grad=True
        self.soft_q_optimizer2.step()       #updates the vals of x using x.grad

        #Training Value Function
        predicted_new_q_value = torch.min(self.soft_q_net1(state, new_action),self.soft_q_net2(state, new_action)) #chose the lower of the two soft_q_net generated predictions, to avoid over shooting
        target_value_func = predicted_new_q_value - log_prob
        value_loss = self.value_criterion(predicted_value, target_value_func.detach())

        self.value_optimizer.zero_grad()
        value_loss.backward()
        self.value_optimizer.step()

        #Train policy function
        policy_loss = (log_prob - predicted_new_q_value).mean()

        self.policy_optimizer.zero_grad() #same procedure as above; always the cycle of .zero_grad(), .backward() and .step()
        policy_loss.backward()
        self.policy_optimizer.step()

        #perform this Polyak averaging to smoothen out net params over the last steps
        for target_param, param in zip(self.target_value_net.parameters(), self.value_net.parameters()):
            target_param.data.copy_(
                target_param.data * (1.0 - soft_tau) + param.data * soft_tau
                )

        self.q_value_loss1 = q_value_loss1.item()
        self.q_value_loss2 = q_value_loss2.item()
        self.value_loss = value_loss.item()
        self.policy_loss = policy_loss.item()

    def document(self):
        if self.docu_flags[0] or self.docu_flags[1]:
            self.docu.PushData(self) #if round doesn't matter just pass -1

        if self.docu_flags[0] and self._tick % SAVE_NETS_EVERY == 0:
            self.docu.SaveNets(self)

        if self.docu_flags[1] and self._tick % SAVE_DATA_EVERY == 0:
            self.docu.SaveData(self)

        if self.docu_flags[2] and self._tick % SAVE_PICS_EVERY == 0:
            self.docu.SavePics(self)

        if self._play % self.save_agent_every == 0 and self._round == 0:
            doc.SaveAgent(self, DOC_ROOT_PATH+"/"+self.env.session_name+DOC_AGENT_PATH)

    #main train loop
    def train(self, num_plays, batch_size):

        if self.docu_flags[0] or self.docu_flags[1] and self.docu == None:
            self.docu = doc.Documentation(net_names=['value_net', 'policy_net', 'soft_q_net1'], data_params=['rewards', 'q_value_loss1', 'q_value_loss2', 'value_loss', 'policy_loss'])

        #iterating all plays
        while self._play < num_plays:
            states =[]
            actions = []
            self.rewards = []
            next_states = []
            dones = []

            try:
                self.env.reset()
                state = self.env.state.clone()
                episode_reward = 0
                self._round = 0

                #iterating over box throws
                while True: #while True should be fine, as we'll get a done = True for sure
                    print(colored(">>>>> SESSION: " + self.env.session_name + " >>>>> PLAY: " + str(self._play) + " >>>>> ROUND: " + str(self._round) + " >>>>> TICK: " +str(self._tick), 'blue'))
                    if self._play < self.rnd_plays:
                        action = self.env.action_space.sample()
                        next_state, reward, done, info = self.env.step(action)
                    else:
                        action = self.policy_net.get_action(state).detach()
                        next_state, reward, done, info = self.env.step(action.numpy())

                    states.append(state)
                    actions.append(action)
                    self.rewards.append(reward)
                    next_states.append(next_state.clone())
                    dones.append(done)

                    state = next_state.clone()
                    episode_reward += reward                

                    if len(self.replay_buffer) > batch_size:
                        self.learn_step(batch_size)
                        
                    self.document()

                    self._tick += 1
                    self._round += 1

                    if done:
                        if self.docu_flags[2] and self.env.has_boxes:
                            self.env.screenshot(self._play, self._round)
                        break

                print(colored((">>>>>TRAJECTORY REWARD:   " + str(episode_reward) + "   after " + str(self._round-1) + " rounds in play " + str(self._play)), "red"))

                self.replay_buffer.push_many(states,  actions, self.rewards, next_states, dones)
                   

                self._play += 1

            except (KeyboardInterrupt):
                cont = ''
                while cont != 'n' and cont != 'y':
                    cont = input("Pause! Continue? [y/n]")
                    if cont == 'n':
                        raise
                    elif cont == 'y':
                        print(colored("Replaying last episode", 'red'))
                        break

            except ValueError as err:
                if err.args[0] == "GH_OUT":
                    print(colored("Lost connection to GH, will need to play this episode again", 'red'))
                else:
                    raise

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--session_name',type=str)
    parser.add_argument('--docu_nets', type=bool, default=False)
    parser.add_argument('--docu_data', type=bool, default=True)
    parser.add_argument('--docu_pics', type=bool, default=False)
    parser.add_argument('--save_agent_every', type=int, default=50)
    parser.add_argument('--resume', type=bool, default=True)
    parser.add_argument('--rnd_plays', type=int, default=1000)
    parser.add_argument('--height_field_dim', type=int, default=12)

    parser.add_argument('--act_dim',type=int,default=6)    
    parser.add_argument('--box_dim',type=int,default=7)
    parser.add_argument('--hid_dim',type=int,default=256)
    parser.add_argument('--max_num_boxes',type=int,default=20)   

    #args relevant for agent setup and learning hyper params
    parser.add_argument('--replay_buffer_size',type=int,default=2000000)
    parser.add_argument('--value_lr',type=float,default=3e-4)
    parser.add_argument('--soft_q_lr',type=float,default=3e-4)
    parser.add_argument('--policy_lr',type=float,default=3e-4)

    #training-specific args
    parser.add_argument('--num_plays',type=int,default=100000)
    parser.add_argument('--batch_size',type=int,default=128)

    parser.add_argument('--simulation', type=int, default=1)

    args=parser.parse_args()

    environment = {}
    environment = sim.DeepBuilderEnv(args.session_name, args.act_dim, args.box_dim, args.max_num_boxes, args.height_field_dim)
    environment.is_simulation = args.simulation == 1


    agent = SAC_Agent(environment, args.act_dim, args.hid_dim, args.replay_buffer_size, args.value_lr, args.soft_q_lr, args.policy_lr)
    
    loadpath = DOC_ROOT_PATH+"/" + environment.session_name + DOC_AGENT_PATH
    if(args.resume and os.path.isfile(loadpath+"/agent.dat")):
        agent = doc.LoadAgent(agent, loadpath)
        print(colored("Loaded agent from previous session at play " + str(agent._play),color='red'))

    agent.docu_flags=[args.docu_nets, args.docu_data, args.docu_pics]
    agent.rnd_plays = args.rnd_plays
    agent.save_agent_every = args.save_agent_every

    agent.train(args.num_plays, args.batch_size)

    print("\n-----------DONE TRAINING----------")
