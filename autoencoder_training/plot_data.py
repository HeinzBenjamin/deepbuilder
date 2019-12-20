import json, argparse
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import host_subplot
import mpl_toolkits.axisartist as AA

def main(args):
    vals = []
    files = args.files.split(',')
    
    i = 0
    for file_name in files:
        vals.append([])
        with open(file_name, 'r') as f:
            data = json.load(f)
            for key in data:
                vals[i].append(data[key])
        plt.plot(range(len(vals[i])), vals[i], linewidth=1.5, label='Configuration '+str(i))
        i += 1
    plt.ylim(0.0,0.006)
    plt.legend()
    plt.show()

    



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    #args relevant for env setup
    parser.add_argument('--files',type=str, default='')
    args=parser.parse_args()
    main(args)
