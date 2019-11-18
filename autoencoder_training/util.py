import os, json, datetime, torch, random


def store_config(dir, args, suffix):
    dt = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M')

    directory = dir+dt+suffix+'/'
    if not os.path.exists(directory): 
        os.makedirs(directory)
    with open(directory+'config.json', 'w') as f:
        json.dump(args, f)
    return directory

def store_loss(directory, epoch, loss):
    if not os.path.isfile(directory+'loss.json'):
        with open(directory+'loss.json', 'w', encoding='utf-8') as f:
            json.dump({},f)

    file_data={}
    with open(directory+'loss.json', encoding='utf-8') as f:
        file_data = json.load(f)

    with open(directory+'loss.json', mode='w', encoding='utf-8') as f:
        file_data[str('epoch-{}'.format(str(epoch).zfill(6)))]=loss
        json.dump(file_data, f, indent=2)
    

