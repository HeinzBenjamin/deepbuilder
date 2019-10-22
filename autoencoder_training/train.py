from os import listdir
from os.path import isfile, join

import torch, torchvision, os, util, random
from torch import nn
from torch.autograd import Variable
from torch.utils.data import DataLoader
from torchvision import transforms
from torchvision.datasets import MNIST
from torchvision.utils import save_image

import meshdata as dat
import numpy as np

class autoencoder(nn.Module):
    def __init__(self):
        super(autoencoder, self).__init__()

        self.encoder = nn.Sequential(
            nn.Linear(32768, 8192).half(),
            nn.ReLU(True),
            nn.Linear(8192, 2048).half(),
            nn.ReLU(True),
            nn.Linear(2048, 512).half(),
            nn.ReLU(True),
            nn.Linear(512, 144).half())

        self.decoder = nn.Sequential(
            nn.Linear(144, 512).half(),
            nn.ReLU(True),
            nn.Linear(512, 2048).half(),
            nn.ReLU(True),
            nn.Linear(2048, 8192).half(),
            nn.ReLU(True), 
            nn.Linear(8192, 32768).half(), 
            nn.Tanh())

    def load(self, other):
        for i in range(4):
            key = str(2*i)
            self.encoder._modules[key].bias.data = other['encoder.'+key+'.bias'].data
            self.encoder._modules[key].weight.data = other['encoder.'+key+'.weight'].data
            self.decoder._modules[key].bias.data = other['decoder.'+key+'.bias'].data
            self.decoder._modules[key].weight.data = other['decoder.'+key+'.weight'].data

    def forward(self, x):
        x = self.encoder(x)
        x = self.decoder(x)
        return x
    
    def encode(self, x):
        return self.encoder(x)

    def decode(self, x):
        return self.decoder(x)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--data_directory',type=str,default='/home/ros/deepbuilder/autoencoder_training/training_data/thingy_solid_lvl6_torch_hilbert/')
    parser.add_argument('--num_train_samples',type=int,default=35559)
    parser.add_argument('--num_test_samples',type=int,default=2000)
    parser.add_argument('--samples_per_epoch',type=int,default=2000)
    parser.add_argument('--model_directory',type=str,default='/home/ros/deepbuilder/autoencoder_training/trained_models/hilbert/')
    parser.add_argument('--learning_rate',type=float,default=0.15)
    parser.add_argument('--weight_decay',type=float,default=0.0)
    parser.add_argument('--momentum',type=float,default=0.70)
    parser.add_argument('--num_epochs',type=int,default=999999)
    parser.add_argument('--random_order',type=int,default=1)
    parser.add_argument('--noise_std',type=float,default=2.0/750.0) #20.0e-4 m divided by normalisation scale

    args=parser.parse_args()

    files = [f for f in listdir(args.data_directory) if isfile(join(args.data_directory, f))]

    offset = 0
    train_data = torch.zeros(args.num_train_samples, 32768).half().cuda()    
    for i in range(args.num_train_samples):
        t = torch.load(args.data_directory+files[offset]).view(32768, 8).mean(1).cuda()
        train_data[i] = t
        offset += 1

    test_data = torch.zeros(args.num_test_samples, 32768).half().cuda()
    for i in range(args.num_test_samples):
        t = torch.load(args.data_directory+files[offset]).view(32768, 8).mean(1).cuda()
        test_data[i] = t
        offset += 1

    model = autoencoder().cuda()
    criterion = nn.MSELoss()
    optimizer = torch.optim.SGD(
    model.parameters(), lr=args.learning_rate, weight_decay=args.weight_decay, momentum=args.momentum)

    
    model_folder = util.store_config(args)

    print("Model folder: " + model_folder)
    for epoch in range(args.num_epochs):
        for i in range(args.samples_per_epoch):            
            # ===================forward=====================
            idx = i if args.random_order == 0 else random.randint(0, args.num_train_samples-1)
            t_sample = Variable(train_data[idx]).cuda()

            noise = torch.tensor(data=np.random.normal(loc=0.0, scale=args.noise_std, size=np.shape(t_sample)), dtype=torch.float16).cuda()
            t_sample += noise
            output = model(t_sample)
            loss = criterion(output, t_sample)
            # ===================backward====================
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            print(('[TRAIN] Epoch '+str(epoch)+' - Step [{:5d}/{}] - Sample [{:5d}/{}] - Loss: {:.8f}\r').format(i+1,args.samples_per_epoch,idx, args.num_train_samples, loss.data), end="" if i < (args.samples_per_epoch-1) else "\n")

        avg_loss = 0.0
        for i in range(args.num_test_samples):
            t_sample = test_data[i]
            t_sample=Variable(t_sample).cuda()
            output = model(t_sample)
            loss = criterion(output, t_sample)
            avg_loss += (loss.data / args.num_test_samples)
            print('[ TEST] Epoch {} - Step [{:5d}/{}] - Loss: {:0.8f}\r'.format(epoch, i+1, args.num_test_samples, loss.data), end="" if i < args.num_test_samples-1 else "\n")

        # ===================log========================
        print('[ TEST] Epoch {} - Average Test Loss: {:.8f}'.format(epoch + 1, avg_loss))
        util.store_loss(model_folder, epoch, avg_loss.tolist())

        if epoch % 10 == 0:
            print("Saving model.db to " + model_folder)
            torch.save(model.state_dict(), model_folder+'model.db')

   