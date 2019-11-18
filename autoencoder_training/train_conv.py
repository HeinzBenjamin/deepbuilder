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
import ae_networks

sessions={
    '0':{
        'learning_rate': 0.00005,
        'momentum': 0.7,
        'weight_decay' : 0.0,
        'bottleneck': 256
    },
    '1':{
        'learning_rate': 0.00005,
        'momentum': 0.7,
        'weight_decay' : 0.0,
        'bottleneck': 144
    },
    '2':{
        'learning_rate': 0.02,
        'momentum': 0.7,
        'weight_decay' : 0.0,
        'bottleneck': 256
    },
    '3':{
        'learning_rate': 0.00005,
        'momentum': 0.7,
        'weight_decay' : 0.001,
        'bottleneck': 256
    },
    '4':{
        'learning_rate': 0.00005,
        'momentum': 0.4,
        'weight_decay' : 0.0,
        'bottleneck': 256
    }
}

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--test_samples_directory',type=str,default='/home/ros/deepbuilder/autoencoder_training/training_data/thingy_solid_lvl6_torch_conv3d/test/')
    parser.add_argument('--train_samples_directory',type=str,default='/home/ros/deepbuilder/autoencoder_training/training_data/thingy_solid_lvl6_torch_conv3d/train/')
    parser.add_argument('--samples_per_epoch',type=int,default=2000)
    parser.add_argument('--model_directory',type=str,default='/home/ros/deepbuilder/autoencoder_training/trained_models/conv3d/')
    parser.add_argument('--num_epochs',type=int,default=9999999999)
    parser.add_argument('--random_order',type=int,default=1)
    parser.add_argument('--noise_std',type=float,default=1.5/750.0)

    args=parser.parse_args()

    test_files = [f for f in listdir(args.test_samples_directory) if isfile(join(args.test_samples_directory, f))]
    train_files = [f for f in listdir(args.train_samples_directory) if isfile(join(args.train_samples_directory, f))]

    num_test_samples = len(test_files)

    offset = 0
    train_data = torch.zeros(args.samples_per_epoch, 64,64,64).cuda()   
    test_data = torch.zeros(num_test_samples, 64,64,64).cuda() 

    for i in range(num_test_samples):
        t = torch.load(args.test_samples_directory+test_files[i]).cuda()
        test_data[i] = t

    models = []
    model_folders = []
    optimizers = []

    for i in sessions:
        model = ae_networks.autoencoder64(sessions[i]['bottleneck']).cuda()
        models.append(model)        
        optimizer = torch.optim.SGD(model.parameters(), lr=sessions[i]['learning_rate'], weight_decay=sessions[i]['weight_decay'], momentum=sessions[i]['momentum'])
        optimizers.append(optimizer)
        model_folders.append(util.store_config(args.model_directory,sessions['0'], "--"+i))

    criterion = nn.MSELoss()
    print("First model folder: " + model_folders[0])
    for epoch in range(args.num_epochs):
        sample_files = random.sample(train_files, k=args.samples_per_epoch)
        i = 0
        for s in sample_files:
            t = torch.load(args.train_samples_directory+s).cuda()
            train_data[i] = t
            i+=1

        for i in range(args.samples_per_epoch):            
            t_sample = Variable(train_data[i]).unsqueeze(0).unsqueeze(0)

            noise = torch.tensor(data=np.random.normal(loc=0.0, scale=args.noise_std, size=np.shape(t_sample)), dtype=torch.float32).cuda()
            t_sample += noise

            losses = []
            for s in sessions:
                output = models[int(s)](t_sample)
                loss = criterion(output, t_sample)
                optimizers[int(s)].zero_grad()
                loss.backward()
                optimizers[int(s)].step()
                losses.append(loss.tolist())
            if (i+1) % 10 == 0:
                print(('[TRAIN] Epoch '+str(epoch)+' - Step [{:5d}/{}] - Sample [{}] - Loss: [{:.6f}, {:.6f}, {:.6f}, {:.6f}, {:.6f}]\r'.format(i+1,args.samples_per_epoch,sample_files[i], losses[0],losses[1],losses[2],losses[3],losses[4])), end="" if i < (args.samples_per_epoch-1) else "\n")


        avg_losses = [0.0,0.0,0.0,0.0,0.0]
        for i in range(num_test_samples):
            t_sample = test_data[i]
            t_sample=Variable(t_sample).cuda().unsqueeze(0).unsqueeze(0)
            
            for s in sessions:
                loss = criterion(models[int(s)](t_sample), t_sample)
                avg_losses[int(s)] += loss.data / num_test_samples

            if (i+1) % 10 == 0:
                print('[ TEST] Epoch {} - Step [{:5d}/{}]\r'.format(epoch, i+1, num_test_samples), end="" if i < num_test_samples-1 else "\n")

        # ===================log========================
        print('[ TEST] Epoch {} - Average Test Losses: [{:.6f}, {:.6f}, {:.6f}, {:.6f}, {:.6f}]'.format(epoch + 1, avg_losses[0],avg_losses[1],avg_losses[2],avg_losses[3],avg_losses[4]))
        for s in sessions:
            util.store_loss(model_folders[int(s)], epoch, avg_losses[int(s)].tolist())


        if epoch % 10 == 0:
            print("Saving models")
            for s in sessions:
                torch.save(model.state_dict(), model_folders[int(s)]+'model.db')

   