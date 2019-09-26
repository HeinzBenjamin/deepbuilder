import numpy as np
import torch
import torch.nn as nn
import torch.functional as F


class SimplestPolicyNetwork(nn.Module):
    def __init__(self, obs_dim, act_dim, hid_dim, num_hidden):
        super(PolicyNetwork, self).__init__()

        self.linear_i = nn.Linear(obs_dim, hid_dim)
        self.linear_h = []
        for _ in range(num_hidden):
            self.linear_h.append(nn.Linear(hid_dim, hid_dim))
        self.linear_o = nn.Linear(hid_dim, act_dim)
        self.num_hidden = num_hidden

    '''
    accepts a state of rank two where rows are boxes described in their columns
    state=
    [
        [box0_posX, box0_posY, box0_posZ, box0_ornX, box0_ornY, box0_ornZ, box0_ornW],
        [box1_posX, box1_posY, box1_posZ, box1_ornX, box1_ornY, box1_ornZ, box1_ornW],
        [box2_posX, box2_posY, box2_posZ, box2_ornX, box2_ornY, box2_ornZ, box2_ornW],
        .
        .
    ]
    '''
    def forward(self, state):
        x = F.F.relu(self.linear_i(state.reshape(1,state.numel()).squeeze()))
        for i in range(self.num_hidden):
            x=F.F.relu(self.linear_h[i](x))
        x=F.F.relu(self.linear_o(x))
        return x


#soft actor critic
#estimates the state value
class ValueNetwork(nn.Module):
    def __init__(self, state_dim, hidden_dim, init_w=3e-3):
        super(ValueNetwork, self).__init__()
        self.device=torch.device("cuda" if torch.cuda.is_available() else "cpu")
        
        self.linear1 = nn.Linear(state_dim, hidden_dim)
        self.linear2 = nn.Linear(hidden_dim, hidden_dim)
        self.linear3 = nn.Linear(hidden_dim, 1)
        
        self.linear3.weight.data.uniform_(-init_w, init_w)
        self.linear3.bias.data.uniform_(-init_w, init_w)
        
    def forward(self, state):
        x = F.F.relu(self.linear1(state))
        x = F.F.relu(self.linear2(x))
        x = self.linear3(x)
        return x
        
        
class SoftQNetwork(nn.Module):
    def __init__(self, num_inputs, num_actions, hidden_size, init_w=3e-3):
        super(SoftQNetwork, self).__init__()
        self.device=torch.device("cuda" if torch.cuda.is_available() else "cpu")
        
        self.linear1 = nn.Linear(num_inputs + num_actions, hidden_size)
        self.linear2 = nn.Linear(hidden_size, hidden_size)
        self.linear3 = nn.Linear(hidden_size, 1)
        
        self.linear3.weight.data.uniform_(-init_w, init_w)
        self.linear3.bias.data.uniform_(-init_w, init_w)
        
    def forward(self, state, action):
        x = torch.cat([state, action], 1)
        x = F.F.relu(self.linear1(x))
        x = F.F.relu(self.linear2(x))
        x = self.linear3(x)
        return x
        
        
class PolicyNetwork(nn.Module):
    def __init__(self, num_inputs, num_actions, hidden_size, init_w=3e-3, log_std_min=-10, log_std_max=1.14473):
        super(PolicyNetwork, self).__init__()
        self.device=torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.log_std_min = log_std_min
        self.log_std_max = log_std_max
        
        self.linear1 = nn.Linear(num_inputs, hidden_size)
        self.linear2 = nn.Linear(hidden_size, hidden_size)
        
        self.mean_linear = nn.Linear(hidden_size, num_actions)
        self.mean_linear.weight.data.uniform_(-init_w, init_w)
        self.mean_linear.bias.data.uniform_(-init_w, init_w)
        
        self.log_std_linear = nn.Linear(hidden_size, num_actions)
        self.log_std_linear.weight.data.uniform_(-init_w, init_w)
        self.log_std_linear.bias.data.uniform_(-init_w, init_w)
        
    def forward(self, state):
        x = F.F.relu(self.linear1(state))
        x = F.F.relu(self.linear2(x))
        
        mean    = self.mean_linear(x)
        log_std = self.log_std_linear(x)
        log_std = torch.clamp(log_std, self.log_std_min, self.log_std_max)
        
        return mean, log_std
    
    def evaluate(self, state, epsilon=1e-6):
        mean, log_std = self.forward(state)
        std = log_std.exp()
        
        normal = torch.distributions.Normal(0, 1)
        z      = normal.sample()
        action = torch.tanh(mean+ std*z.to(self.device))
        log_prob = torch.distributions.Normal(mean, std).log_prob(mean+ std*z.to(self.device)) - torch.log(1 - action.pow(2) + epsilon)
        log_prob = log_prob.sum(1, keepdim=True)
        return action, log_prob, z, mean, log_std
        
    
    def get_action(self, state):
        state = torch.FloatTensor(state).unsqueeze(0).to(self.device)
        mean, log_std = self.forward(state)
        std = log_std.exp()
        
        normal = torch.distributions.Normal(0, 1)
        z      = normal.sample().to(self.device)
        action = torch.tanh(mean + std*z)
        
        action  = action.cpu()
        return action[0]

