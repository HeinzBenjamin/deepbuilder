import json, copy, os, torch
from statistics import mean
from os import listdir
from os.path import isfile, join

def chunks(l, n):
    """Yield successive n-sized chunks from l."""
    for i in range(0, len(l), n):
        yield l[i:i + n]

def get_object_data(path, level=6):
    with open(path) as json_file:
        full_data = json.load(json_file)

    data = []
    if level < 6:
        for d in full_data:
            vector = []
            partitioned = list(chunks(full_data[d], pow(8, (6-level))))
            for p in partitioned:
                vector.append(mean(p))
            data.append(vector)
    elif level == 6:
        for d in full_data:
            data.append(full_data[d])

    dims = []
    for d in data:
        dims.append(len(d))

    #print("Loaded " + path + ", Dimensions: " + str(dims))
    return data, dims

def get_samples(data_directory, num_samples, level=6):
    print("Loading samples")
    data = []
    files = [f for f in listdir(argsdata_directory) if isfile(join(data_directory, f))]
    i = 0
    while len(data) < num_samples:
        d, dim = get_object_data(data_directory+files[i], level)
        data.extend(d)
        i += 1

    return data

def json2torch(source_dir, goal_dir, name_to_start_at, level=6):
    print("Loading samples")
    data = []
    files = [f for f in listdir(source_dir) if isfile(join(source_dir, f))]
    files = files[files.index(name_to_start_at):]

    i = 0
    for f in files:
        try:    
            data, dim = get_object_data(source_dir+f,level=level)
            for i in range(len(data)):
                t = torch.tensor(data=data[i],dtype=torch.float16).cuda()
                t /= 7500.0
                file_name = (f.split('.')[0])+'_'+str(i)+'.dat'
                torch.save(t, goal_dir+file_name)
                print(file_name + ' - len {}, min {:.4f}, max {:.4f}, mean {:.4f}'.format(int(t.size()[0]), t.min(), t.max(),t.mean()))
                
            
        except:
            print("!!!ERROR in " + f)

def rename_files(source_dir):
    files = [f for f in listdir(source_dir) if isfile(join(source_dir, f)) and not f.startswith('0')]
    for f in files:
        bare = f.split('.')[0]        
        os.rename(source_dir+f,source_dir+ bare.zfill(8)+'.json')

        
    


if __name__ == "__main__":
    rename_files('D:/Offline Data/meshdata/thingy_solid_lvl6/')
    print("Renamed all files!")

    json2torch('D:/Offline Data/meshdata/thingy_solid_lvl6/', 'D:/Offline Data/meshdata/thingy_solid_lvl6_torch/', '00286986.json', level=6)
    print("Converted all data!")