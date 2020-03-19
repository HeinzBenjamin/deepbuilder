import json, argparse, os, csv
import matplotlib.pyplot as plt
import numpy as np
from modules import documentation as doc
from scipy.signal import savgol_filter

from mpl_toolkits.axes_grid1 import host_subplot
import mpl_toolkits.axisartist as AA

def partition_list(l, n):
    return [l[i:i+n] for i in range(0, len(l), n)]
    

def smooth(y, window,deg):
    #box = np.ones(box_pts)/box_pts
    #y_smooth = np.convolve(y, box, mode='full')
    #return y_smooth[(len(y_smooth)-len(y)):len(y_smooth)]
    #y_smooth = np.convolve(y, box, mode='same')
    #return y_smooth
    return savgol_filter(y,window, deg)

#def rlkit_plot(args, data, directory):


def main(args):
    data={}
    files = args.file_names.split(',')
    n = 0
    for f in files:
        with open(f, newline='') as f:
            reader = csv.reader(f, delimiter=' ', quotechar='|')
            for row in reader:
                data[n] = ', '.join(row)

    if args.mode.startswith('rlkit'):
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
    parser.add_argument('--file_names',type=str, default='/home/ros/deepbuilder/learning_ws/data/200221-train-sac/200221-train-sac_2020_02_21_22_12_31_0000--s-0/progress.csv')
    parser.add_argument('--parameters',type=str, default='rewards')
    parser.add_argument('--show',type=str,default='True')
    parser.add_argument('--smooth_window',type=int,default=201)
    parser.add_argument('--smooth_deg',type=int,default=1)
    args=parser.parse_args()
    main(args)