import copy, os, torch
from os import listdir
from os.path import isfile, join
import tntorch as tn

rank = 22

def sdf2cp(source_dir, goal_dir, start_with):
    files = [f for f in listdir(source_dir) if isfile(join(source_dir, f))]
    i = 0
    if start_with != '':
        i = files.index(start_with)
        files = files[i:]

    for f in files:
        i+=1
        sdf = torch.load(join(source_dir, f)).to(torch.float32).cuda()

        tnt = tn.Tensor(sdf, ranks_cp = rank, device = torch.device("cuda"))
        cp = torch.cat([tnt.cores[0].flatten(), tnt.cores[1].flatten(), tnt.cores[2].flatten()])

        print("Converting file [{}/{}] {}.  SDF {}: min: {:.4f}, max: {:.4f}, mean: {:.4f} ---> CP {}: min: {:.4f}, max: {:.4f}, mean: {:.4f}".format(i, len(files), f, sdf.shape, sdf.min(), sdf.max(), sdf.mean(), cp.shape, cp.min(), cp.max(), cp.mean()))
        #print("Converting file [{}/{}] {}: SDF {} ---> CP {}".format(i, len(files), f, sdf.shape, cp.shape))
        torch.save(cp, join(goal_dir, f))
        


if __name__ == "__main__":
    input("Rank is " + str(rank) + ". Press enter to continue")
    start_with = '00053757_04.dat'
    sdf2cp('D:/Offline Data/meshdata/thingy_solid_lvl6_conv3d_torch_2/', 'D:/Offline Data/meshdata/thingy_solid_lvl6_torch_cp'+str(rank)+'/', start_with)
    print("Converted all data!")