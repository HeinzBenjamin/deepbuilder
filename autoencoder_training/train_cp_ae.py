from os import listdir
from os.path import isfile, join

import torch, os, util, random
from torch import nn
from torch.autograd import Variable

import meshdata as dat
import numpy as np
import ae_networks

configuration={
    'learning_rate': 0.02,
    'momentum': 0.6,
    'weight_decay' : 0.0,
    'bottleneck': 144,
    'rank': 22
}

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--test_samples_directory',type=str,default='D:/Offline Data/meshdata/thingy_solid_lvl6_torch_cp22_test/')
    parser.add_argument('--train_samples_directory',type=str,default='D:/Offline Data/meshdata/thingy_solid_lvl6_torch_cp22/')
    parser.add_argument('--samples_per_epoch',type=int,default=2000)
    parser.add_argument('--model_directory',type=str,default='D:/OneDrive - felbrich.com/Work/01 Academic/04 Robotic Reinforcement Learning/11 Ubuntu Files/deepbuilder/autoencoder_training/trained_models/cp22/')
    parser.add_argument('--num_epochs',type=int,default=9999999999)
    parser.add_argument('--random_order',type=int,default=1)
    parser.add_argument('--noise_std',type=float,default=0.0)
    parser.add_argument('--test_every',type=int,default=5)
    parser.add_argument('--save_every',type=int,default=10)

    args=parser.parse_args()

    #get lists of all available train and test files from directories
    test_files = [f for f in listdir(args.test_samples_directory) if isfile(join(args.test_samples_directory, f))]
    train_files = [f for f in listdir(args.train_samples_directory) if isfile(join(args.train_samples_directory, f))]

    num_test_samples = len(test_files)
    num_train_samples = len(train_files)

    cp_cores_length = configuration['rank'] * 3 * 64

    #set buffer tensors for test and training data
    train_data = torch.zeros(num_train_samples, cp_cores_length, dtype=torch.float32).cuda()   
    test_data = torch.zeros(num_test_samples, cp_cores_length, dtype=torch.float32).cuda() 

    #fill train data tensors
    print("Loading training samples ")
    actual_size = 0
    for i in range(num_train_samples):
        t = torch.load(args.train_samples_directory+train_files[i]).cuda()
        if t.min() > -150.0 and t.max() < 150.0:
            train_data[i] = t
            actual_size += 1
            if i % 100 == 0:
                print("[{}/{}]      \r".format(actual_size, num_train_samples), end="")
    print("\nSorted out {} bad samples.\n".format(num_train_samples - actual_size))
    num_train_samples = actual_size
    train_data = train_data[0:actual_size]

    #fill test data tensors
    actual_size = 0
    print("Loading test samples ", end="")
    for i in range(num_test_samples):
        t = torch.load(args.test_samples_directory+test_files[i]).cuda()
        if t.min() > -150.0 and t.max() < 150.0:
            test_data[i] = t
            actual_size += 1
            if i % 10 == 0:
                print("[{}/{}]      \r".format(actual_size, num_test_samples), end="")
    print("\nSorted out {} bad samples.\n".format(num_test_samples - actual_size))
    num_test_samples = actual_size
    test_data = test_data[0:actual_size]


    model = ae_networks.autoencoderCP(configuration['rank'], configuration['bottleneck']).cuda()     
    optimizer = torch.optim.SGD(model.parameters(), lr=configuration['learning_rate'], weight_decay=configuration['weight_decay'], momentum=configuration['momentum'])
    model_folder = util.store_config(args.model_directory,configuration,"")

    criterion = nn.MSELoss()
    print("Model folder: " + model_folder)
    for epoch in range(args.num_epochs):
        try:
            perm = torch.randperm(num_train_samples)
            for i in range(args.samples_per_epoch):                
                t_sample = Variable(train_data[perm[i]])

                #noise = torch.tensor(data=np.random.normal(loc=0.0, scale=args.noise_std, size=np.shape(t_sample)), dtype=torch.float32).cuda()
                #t_sample += noise

                output = model(t_sample)
                loss = criterion(output, t_sample)
                optimizer.zero_grad()
                loss.backward()
                optimizer.step()

                print(('[TRAIN] Epoch '+str(epoch)+' - Step [{:5d}/{}] - Sample [{:6d}] - Loss: [{:.6f}]\r'.format(i+1,args.samples_per_epoch, perm[i], loss)), end="" if i < (args.samples_per_epoch-1) else "\n")


            if epoch % args.test_every == 0:
                avg_loss = 0.0
                for ii in range(num_test_samples):
                    t_sample = test_data[ii].to(torch.float32)
                    t_sample=Variable(t_sample).cuda()

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

   