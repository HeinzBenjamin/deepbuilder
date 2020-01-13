import torch, os, util, random
from torch import nn
from torch.autograd import Variable
from torch.utils.data import DataLoader


class Print(nn.Module):
    def forward(self, x):
        print(x.size())
        return x

class Flatten(nn.Module):
    def forward(self, x):
        return x.view(x.size()[0], -1)

class Stack64(nn.Module):
    def forward(self, x):
        x = x.view(x.size()[1], -1)
        x=x.view(1,int(x.size()[0]/(4*4*4)),4,4,4)
        return x

class autoencoderCP(nn.Module):
    def __init__(self, rank_cp, bottle_neck_size):
        super(autoencoderCP,self).__init__()

        self.encoder = nn.Sequential(
            nn.Linear(rank_cp * 3 * 64, rank_cp * 64),
            nn.ReLU(True),
            nn.Linear(rank_cp * 64, rank_cp * 16),
            nn.ReLU(True),
            nn.Linear(rank_cp * 16, bottle_neck_size))
            
        
        self.decoder = nn.Sequential(
            nn.Linear(bottle_neck_size, rank_cp * 16),
            nn.ReLU(True),
            nn.Linear(rank_cp * 16, rank_cp * 64),
            nn.ReLU(True),
            nn.Linear(rank_cp * 64, rank_cp * 3 * 64),
            nn.Tanh())

    def load(self, other):
        for key in other:
            keys = key.split('.')
            part = self.__getattr__(keys[0])
            mod = part._modules[keys[1]]
            member = mod.__getattr__(keys[2])
            member.data = other[key].data

    def forward(self, x):
        x = self.encoder(x)
        x = self.decoder(x)
        return x

    def encode(self, x):
        return self.encoder(x)

    def decode(self, x):
        return self.decoder(x)



class autoencoder64(nn.Module):
    def __init__(self, bottle_neck_size):
        super(autoencoder64, self).__init__()

        self.encoder = nn.Sequential(
            nn.Conv3d(in_channels = 1, out_channels = 64, kernel_size = 4, stride = 2, padding = 0), #down sampled to 32^3
            nn.BatchNorm3d(64),
            nn.ReLU(True),
            nn.Conv3d(in_channels = 64, out_channels = 128, kernel_size = 4, stride = 2, padding = 0), #down sampled to 16^3
            nn.BatchNorm3d(128),
            nn.ReLU(True),
            nn.Conv3d(in_channels = 128, out_channels = 256, kernel_size = 4, stride = 2, padding = 0), #down sampled to 8^3
            nn.BatchNorm3d(256),
            nn.ReLU(True),
            nn.Conv3d(in_channels = 256, out_channels = 512, kernel_size = 4, stride = 2, padding = 0), #down sampled to 4^3
            nn.BatchNorm3d(512),
            Flatten(),
            nn.Linear(4096, 1296),
            nn.ReLU(True),
            nn.Linear(1296, 432),
            nn.ReLU(True),
            nn.Linear(432, bottle_neck_size))
            
        
        self.decoder = nn.Sequential(
            nn.Linear(bottle_neck_size, 432),
            nn.ReLU(True),
            nn.Linear(432, 1296),
            nn.ReLU(True),
            nn.Linear(1296, 4096),
            nn.ReLU(True),
            Stack64(),
            nn.ConvTranspose3d(in_channels = 64, out_channels = 256, kernel_size = 4, stride=2, padding = 1),
            nn.BatchNorm3d(256),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 256, out_channels = 128, kernel_size = 4, stride=2, padding = 1),
            nn.BatchNorm3d(128),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 128, out_channels = 64, kernel_size = 4, stride=2, padding = 1),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 64, out_channels = 1, kernel_size = 4, stride=2, padding = 1),
            nn.Tanh())

            

    def load(self, other):
        for key in other:
            keys = key.split('.')
            part = self.__getattr__(keys[0])
            mod = part._modules[keys[1]]
            member = mod.__getattr__(keys[2])
            member.data = other[key].data
        '''
        self.encoder._modules[key].bias.data = other['encoder.'+key+'.bias'].data
        self.encoder._modules[key].weight.data = other['encoder.'+key+'.weight'].data
        self.decoder._modules[key].bias.data = other['decoder.'+key+'.bias'].data
        self.decoder._modules[key].weight.data = other['decoder.'+key+'.weight'].data
        '''

    def forward(self, x):
        x = self.encoder(x)
        x = self.decoder(x)
        return x
    
    def encode(self, x):
        if len(x.shape) == 1:
            x = x.view(64,64,64)
        while len(x.shape) < 5:
            x = Variable(x).unsqueeze(0)

        return self.encoder(x)

    def decode(self, x):
        return self.decoder(x)

class autoencoder(nn.Module):
    def __init__(self, bottle_neck_size):
        super(autoencoder, self).__init__()

        self.encoder = nn.Sequential(
            nn.Conv3d(in_channels = 1, out_channels = 32, kernel_size = 6, stride = 2),
            nn.BatchNorm3d(32),
            nn.ReLU(True),
            nn.Conv3d(in_channels = 32, out_channels = 32, kernel_size = 3, stride = 1),
            nn.BatchNorm3d(32),
            nn.ReLU(True),
            nn.Conv3d(in_channels = 32, out_channels = 32, kernel_size = 4, stride = 2, padding = 1),
            nn.BatchNorm3d(32),
            Flatten(),
            nn.Linear(6912, bottle_neck_size))
        
            
        
        self.decoder = nn.Sequential(
            nn.Linear(bottle_neck_size, 2048),
            nn.ReLU(True),
            Stack(),
            nn.ConvTranspose3d(in_channels = 32, out_channels = 16, kernel_size = 4, stride=2, padding = 1),
            nn.BatchNorm3d(16),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 16, out_channels = 8, kernel_size = 4, stride=2, padding = 1),
            nn.BatchNorm3d(8),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 8, out_channels = 4, kernel_size = 4, stride=2, padding = 1),
            nn.BatchNorm3d(4),
            nn.ReLU(True),
            nn.ConvTranspose3d(in_channels = 4, out_channels = 1, kernel_size = 5, stride=1, padding = 2),
            nn.Tanh())

    def load(self, other):
        for key in other:
            keys = key.split('.')
            part = self.__getattr__(keys[0])
            mod = part._modules[keys[1]]
            member = mod.__getattr__(keys[2])
            member.data = other[key].data
        '''
        self.encoder._modules[key].bias.data = other['encoder.'+key+'.bias'].data
        self.encoder._modules[key].weight.data = other['encoder.'+key+'.weight'].data
        self.decoder._modules[key].bias.data = other['decoder.'+key+'.bias'].data
        self.decoder._modules[key].weight.data = other['decoder.'+key+'.weight'].data
        '''

    def forward(self, x):
        x = self.encoder(x)
        x = self.decoder(x)
        return x
    
    def encode(self, x):
        if len(x.shape) == 1:
            x = x.view(32,32,32)
        while len(x.shape) < 5:
            x = Variable(x).unsqueeze(0)

        return self.encoder(x)

    def decode(self, x):
        return self.decoder(x)

