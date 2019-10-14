import json, argparse, os, csv
import matplotlib.pyplot as plt
import numpy as np
from modules import documentation as doc
from scipy.signal import savgol_filter

from mpl_toolkits.axes_grid1 import host_subplot
import mpl_toolkits.axisartist as AA

'''
def interpolate(start_val, next_val, num_steps, current_step):
    return start_val + (next_val - start_val) * (float(current_step) / float(num_steps))

def load_rlkit_progress(session_name, plays_per_epoch):
    sub_folders = []
    for name in os.listdir('/home/ros/deepbuilder/learning_ws/rlkit/data/'+session_name):
        if os.path.isdir('/home/ros/deepbuilder/learning_ws/rlkit/data/'+session_name+"/"+name):
            sub_folders.append('/home/ros/deepbuilder/learning_ws/rlkit/data/'+session_name+"/"+name)

    if len(sub_folders) == 0:
        print("No snapshot found to resum")
        return None, None

    i = 0
    for s in sub_folders:
        print("["+str(i)+"]: " + s)
        i += 1

    i = input("Chose version from folder names above [int]: ")
    directory = sub_folders[int(i)]
    file_path = directory + "/progress.csv"
    print("Loading from path " + directory)

    data = {}
    data['rewards']=[]
    data['']=[]
    with open(file_path) as csvfile:
        rd = csv.DictReader(csvfile, delimiter=',')
        for row in rd:
            for i in args.plays_per_epoch:
                data['rewards'].append(interpolate(float(row['evaluation/Return Mean'])))


    return data
'''


def partition_list(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]
    #for i in range(0, len(l), n):
    #    yield(l[i:i + n])

    

def smooth(y, window,deg):
    #box = np.ones(box_pts)/box_pts
    #y_smooth = np.convolve(y, box, mode='full')
    #return y_smooth[(len(y_smooth)-len(y)):len(y_smooth)]
    #y_smooth = np.convolve(y, box, mode='same')
    #return y_smooth
    return savgol_filter(y,window, deg)

#def rlkit_plot(args, data, directory):
    

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
    if args.mode == 'sac':
        directory = ('./doc/'+args.session_name+'/data/') if args.session_name != '' else './'
        filepath = directory+'data.dat'
        with open(filepath, 'r') as f:
            data = json.load(f)

    elif args.mode.startswith('rlkit'):
        directory = ('./rlkit/data/'+args.session_name) if args.session_name != '' else './'
        data['rewards'] = {}
        data['tower_heights'] = {}
        data['collisions'] = {}
        variant, params = doc.load_rklit_file(args.session_name)
        random_play_offset = args.start_offset + int(variant['algorithm_kwargs']['min_num_steps_before_training'])
        end_offset = args.end_offset
        rew = []
        tow=[]
        col=[]
        collisions = []
        which_buf = "_eval" if args.mode == 'rlkit_eval' else ('_expl' if not args.mode == 'rlkit' else '')
        for i in range(random_play_offset, int(params['replay_buffer'+which_buf+'/size']-end_offset)):
            step_rew=params['replay_buffer'+which_buf+'/rewards'][i].tolist()[0]
            rew.append(step_rew)
            tow.append(max(params['replay_buffer'+which_buf+'/observations'][i].tolist()))
            col.append(0 if step_rew > 0 else 1)
        r = partition_list(rew, 21)
        t = partition_list(tow, 21)
        c = partition_list(col, 21)
        collisions = []
        towers = []
        for i in range(len(r)):
            data['rewards'][str(i)] = r[i]
            data['tower_heights'][str(i)] = max(t[i])
            data['collisions'][str(i)] = sum(c[i])
            collisions.append(sum(c[i]))
            towers.append(max(t[i]))


    num_plays = len(data['rewards'])
    returns = [None]*num_plays
    

    for i in data['rewards']:
        returns[int(i)]=sum(data['rewards'][i])

    if args.mode == 'sac':
        plt.plot(range(num_plays), returns, linewidth=0.3, color='#C9DBFF')
        plt.plot(range(num_plays), smooth(returns, args.smoothing), linewidth=0.6)
        plt.xlabel('plays')
        plt.ylabel('returns')
        plt.title('Total reward')
        plt.savefig(directory+'/returns.png', dpi=300, figsize=(19.20*2,10.80*2))
        if args.show == 'True':
            plt.show()

        sac_plot(args, data, directory, num_plays)

    elif args.mode.startswith('rlkit'):
        '''
        plt.plot(range(num_plays), returns, linewidth=0.3, color='#C9DBFF')
        plt.plot(range(num_plays), smooth(returns, args.smoothing), linewidth=0.6)
        plt.xlabel('plays')
        plt.ylabel('returns')
        plt.title(args.title)
        plt.savefig(directory+'/rlkit_'+args.title+'.png', dpi=300, figsize=(19.20*2,10.80*2))
        '''
        host = host_subplot(111, axes_class=AA.Axes)
        plt.subplots_adjust(right=0.75)

        par1 = host.twinx()
        par2 = host.twinx()

        offset = 50
        new_fixed_axis = par2.get_grid_helper().new_fixed_axis
        par2.axis["right"] = new_fixed_axis(loc="right", axes=par2,
                                                offset=(offset, 0))

        par1.axis["right"].toggle(all=True)

        host.set_xlim(0, num_plays)
        host.set_ylim(-3.0, 12.0)

        host.set_xlabel("Plays")
        host.set_ylabel("Return")
        par1.set_ylabel("Nr. of Collisions")
        par2.set_ylabel("Tower Height [mm]")

        #returns = returns[args.start_offset:num_plays]
        #collisions = collisions[args.start_offset:num_plays]
        #towers = towers[args.start_offset:num_plays]
        #rng = range(0,num_plays - args.start_offset)
        rng=range(num_plays)
        p1, = host.plot(rng, returns, linewidth=0.15, alpha = 0.4,color='#FF0000')
        p1a, = host.plot(rng, smooth(returns, args.smooth_window,args.smooth_deg), label="Returns", linewidth=0.7,color='#FF0000')
        p2, = par1.plot(rng, collisions, linewidth=0.15, alpha = 0.4,color='#0000FF')
        p2a, = par1.plot(rng, smooth(collisions, args.smooth_window,args.smooth_deg), label="Collisions", linewidth=0.7,color='#0000FF')
        p3, = par2.plot(rng, towers, linewidth=0.15, alpha = 0.4,color='#00FF00')
        p3a, = par2.plot(rng, smooth(towers, args.smooth_window,args.smooth_deg), label="Tower Height", linewidth=0.7,color='#00FF00')

        par1.set_ylim(0, 23)
        par2.set_ylim(0.0, 1300.0)

        host.legend()

        host.axis["left"].label.set_color(p1a.get_color())
        par1.axis["right"].label.set_color(p2a.get_color())
        par2.axis["right"].label.set_color(p3a.get_color())
        plt.title(args.title)

        #plt.draw()
        if args.show == 'True':
            plt.show()

        
        plt.savefig(directory+'/rlkit_'+args.title+'.png', dpi=300, figsize=(19.20*2,10.80*2))
        

    

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--session_name',type=str, default='')
    parser.add_argument('--mode', type=str,default='rlkit_expl')
    parser.add_argument('--show',type=str,default='True')
    parser.add_argument('--smooth_window',type=int,default=201)
    parser.add_argument('--smooth_deg',type=int,default=1)
    parser.add_argument('--plays_per_epoch',type=int,default=50)
    parser.add_argument('--start_offset',type=int,default=21000)
    parser.add_argument('--end_offset',type=int,default=0)
    parser.add_argument('--title',type=str,default='')
    args=parser.parse_args()
    main(args)