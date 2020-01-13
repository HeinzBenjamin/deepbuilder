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

configuration={
    'learning_rate': 0.02,
    'momentum': 0.7,
    'weight_decay' : 0.0,
    'bottleneck': 144
}

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--test_samples_directory',type=str,default='/home/ros/deepbuilder_backup_191230/autoencoder_training/training_data/thingy_solid_lvl6_torch_conv3d/test/')
    parser.add_argument('--train_samples_directory',type=str,default='/home/ros/deepbuilder_backup_191230/autoencoder_training/training_data/thingy_solid_lvl6_torch_conv3d/train/')
    parser.add_argument('--samples_per_epoch',type=int,default=2000)
    parser.add_argument('--model_directory',type=str,default='/home/ros/deepbuilder_backup_191230/autoencoder_training/trained_models/conv3d/')
    parser.add_argument('--num_epochs',type=int,default=9999999999)
    parser.add_argument('--random_order',type=int,default=1)
    parser.add_argument('--noise_std',type=float,default=1.5/750.0)
    parser.add_argument('--test_every',type=int,default=5)
    parser.add_argument('--save_every',type=int,default=10)

    args=parser.parse_args()

    #get lists of all available train and test files from directories
    test_files = [f for f in listdir(args.test_samples_directory) if isfile(join(args.test_samples_directory, f))]
    train_files = [f for f in listdir(args.train_samples_directory) if isfile(join(args.train_samples_directory, f))]

    num_test_samples = len(test_files)
    num_train_files = len(train_files)

    offset = 0
    #set buffer tensors for test and training data
    train_data = torch.zeros(args.samples_per_epoch, 64,64,64, dtype=torch.float16).cuda()   
    test_data = torch.zeros(num_test_samples, 64,64,64, dtype=torch.float16).cuda() 

    #fill test data tensors
    for i in range(num_test_samples):
        t = torch.load(args.test_samples_directory+test_files[i]).cuda()
        test_data[i] = t


    model = ae_networks.autoencoder64(configuration['bottleneck']).cuda()     
    optimizer = torch.optim.SGD(model.parameters(), lr=configuration['learning_rate'], weight_decay=configuration['weight_decay'], momentum=configuration['momentum'])
    model_folder = util.store_config(args.model_directory,configuration,"")

    criterion = nn.MSELoss()
    print("Model folder: " + model_folder)
    for epoch in range(args.num_epochs):
        try:
            sample_files = random.sample(train_files, k=args.samples_per_epoch)
            i = 0
            for s in sample_files:
                t = torch.load(args.train_samples_directory+s).cuda()
                train_data[i] = t
                i+=1

            for ii in range(args.samples_per_epoch):            
                t_sample = Variable(train_data[ii].to(torch.float32)).unsqueeze(0).unsqueeze(0)

                noise = torch.tensor(data=np.random.normal(loc=0.0, scale=args.noise_std, size=np.shape(t_sample)), dtype=torch.float32).cuda()
                t_sample += noise

                output = model(t_sample)
                loss = criterion(output, t_sample)
                optimizer.zero_grad()
                loss.backward()
                optimizer.step()

                print(('[TRAIN] Epoch '+str(epoch)+' - Step [{:5d}/{}] - Sample [{}] - Loss: [{:.6f}]\r'.format(ii+1,args.samples_per_epoch,sample_files[ii], loss)), end="" if ii < (args.samples_per_epoch-1) else "\n")


            if epoch % args.test_every == 0:
                avg_loss = 0.0
                for ii in range(num_test_samples):
                    t_sample = test_data[ii].to(torch.float32)
                    t_sample=Variable(t_sample).cuda().unsqueeze(0).unsqueeze(0)

                    test_loss = criterion(model(t_sample), t_sample)
                    avg_loss += test_loss.data / num_test_samples

                    print('[ TEST] Epoch {} - Step [{:5d}/{}]\r'.format(epoch, ii+1, num_test_samples), end="" if ii < num_test_samples-1 else "\n")

                # ===================log========================
                print('[ TEST] Epoch {} - Average Test Losses: [{:.6f}]'.format(epoch, avg_loss))
                util.store_loss(model_folder, epoch, avg_loss.tolist())


            if epoch % args.save_every == 0:
                print("Saving model")
                torch.save(model.state_dict(), model_folder+'model.db')
                torch.save(optimizer.state_dict(),model_folder+'optimizer.db')
                    
        
        except (KeyboardInterrupt):
            cont = ''
            while cont != 'n' and cont != 'y':
                print("\n")
                cont = input("Pause! Continue training with next epoch? [y/n]")
                if cont == 'n':
                    raise
                elif cont == 'y':
                    print("Continuing training...")
                    break

   