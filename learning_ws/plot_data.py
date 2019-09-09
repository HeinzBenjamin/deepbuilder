import json, argparse
import matplotlib.pyplot as plt
import numpy as np

def smooth(y, box_pts):
    box = np.ones(box_pts)/box_pts
    y_smooth = np.convolve(y, box, mode='same')
    return y_smooth

def sac_plot(args, data, directory, num_plays):
    plt.clf()
    qvalloss1=[None]*num_plays
    qvalloss2=[None]*num_plays
    value_loss=[None]*num_plays
    policy_loss=[None]*num_plays

    for i in data['q_value_loss1']:
        qvalloss1[int(i)]=data['q_value_loss1'][i]

    for i in data['q_value_loss2']:
        qvalloss2[int(i)]=data['q_value_loss2'][i]

    for i in data['policy_loss']:
        policy_loss[int(i)]=data['policy_loss'][i]

    for i in data['value_loss']:
        value_loss[int(i)]=data['value_loss'][i]
    #q value losses
    plt.plot(range(num_plays), qvalloss1, linewidth=0.15, alpha = 0.4)
    plt.plot(range(num_plays), qvalloss2, linewidth=0.15, alpha=0.4)

    plt.plot(range(num_plays), smooth(qvalloss1, args.smoothing), label='q value loss 1', linewidth=0.4)
    plt.plot(range(num_plays), smooth(qvalloss2, args.smoothing), label='q value loss 2', linewidth=0.4)
    
    plt.xlabel('plays')
    plt.legend()
    plt.title('Q-value losses')
    plt.savefig(directory+'/q_val_loss.png', dpi=300, figsize=(19.20,10.80))
    if args.show == 'True':
        plt.show()
    plt.clf()
    plt.plot(range(num_plays), value_loss, linewidth=0.15, alpha=0.4)  
    plt.plot(range(num_plays), policy_loss, linewidth=0.15, alpha=0.4)

    plt.plot(range(num_plays), smooth(value_loss, args.smoothing), label='value loss', linewidth=0.4)
    plt.plot(range(num_plays), smooth(policy_loss, args.smoothing), label='policy loss', linewidth=0.4)
    
    plt.xlabel('plays')
    plt.legend()
    plt.title('Value/policy losses')
    plt.savefig(directory+'/val_pol_loss.png', dpi=300, figsize=(19.20,10.80))
    if args.show == 'True':
        plt.show()
    plt.clf()


def main(args):
    data={}
    directory = ('./doc/'+args.session_name+'/data/') if args.session_name != '' else './'
    filepath = directory+'data.dat'
    with open(filepath, 'r') as f:
        data = json.load(f)
    
    num_plays = len(data['rewards'])
    total_rewards = [None]*num_plays
    
    for i in data['rewards']:
        total_rewards[int(i)]=sum(data['rewards'][i])
    
    plt.plot(range(num_plays), total_rewards, linewidth=0.3, color='#C9DBFF')
    plt.plot(range(num_plays), smooth(total_rewards, args.smoothing), linewidth=0.6)
    plt.xlabel('plays')
    plt.ylabel('rewards')
    plt.title('Total reward')
    plt.savefig(directory+'/total_rewards.png', dpi=300, figsize=(19.20*2,10.80*2))
    if args.show == 'True':
        plt.show()

    if args.mode == 'sac':
        sac_plot(args, data, directory, num_plays)

    

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--session_name',type=str, default='')
    parser.add_argument('--mode', type=str,default='sac')
    parser.add_argument('--show',type=str,default='True')
    parser.add_argument('--smoothing',type=int,default=500)
    args=parser.parse_args()
    main(args)