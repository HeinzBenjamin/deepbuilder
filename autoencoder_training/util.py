import os, json, datetime

def store_config(args):
    config = {}
    config['data_directory'] = args.data_directory
    config['num_train_samples'] = args.num_train_samples
    config['num_test_samples'] = args.num_test_samples
    #config['data_level'] = args.data_level not used atm
    config['learning_rate'] = args.learning_rate
    config['weight_decay'] = args.weight_decay
    config['momentum'] = args.momentum
    config['num_epochs'] = args.num_epochs
    config['random_order'] = args.random_order
    config['noise_std'] = args.noise_std
    dt = datetime.datetime.now().strftime('%Y-%m-%d-%H-%M')

    directory = args.model_directory+dt+'/'
    if not os.path.exists(directory): 
        os.makedirs(directory)
    with open(directory+'config.json', 'w') as f:
        json.dump(config, f)
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
    

