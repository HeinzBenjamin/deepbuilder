from datetime import datetime
from termcolor import colored
import torch, os, requests, zipfile, io, json, pickle
from .settings import *

def SaveAgent(agent, path):
    if not os.path.exists(path):
        os.makedirs(path)
    relevantmembers = {}
    for name in dir(agent):
        if name.startswith('__') or name == 'env':
            continue
        member = getattr(agent, name)
        try:
            relevantmembers[name] = member.state_dict()
        except:
            if not callable(member):
                relevantmembers[name] = member
    torch.save(relevantmembers, path+"/agent.dat")

    
def LoadAgent(agent, path):
    checkpoint = torch.load(path+"/agent.dat")
    for name in dir(agent):
        if name.startswith('__') or name == 'env':
            continue
        member = getattr(agent, name)
        try:
            member.load_state_dict(checkpoint[name])
        except:
            if not callable(member):
                setattr(agent, name, checkpoint[name])

    return agent



class Data:
    def __init__(self, params=['rewards']):
        self.params = params
        self.data = {}
        for p in params:
            self.data[p] = {}

    def push(self, param, play, values, _round = -1):
        if _round == -1:
            self.data[param][play] = values
        else:
            if str(play) not in self.data[param]:
                self.data[param][str(play)] = {}
            self.data[param][str(play)][_round] = values
                

    def save(self, file_path):
        with open(file_path, 'w') as fp:
            try:
                json.dump(self.data, fp)
                #DO THIS LATER!!!!
                #self.data={}
                #for p in self.params:
                #    self.data[p] = {}
            except:
                print(colored("Couldn't save data. What do?", 'red'))

class Documentation:
    def __init__(self, net_names, data_params=['rewards']):
        #self.agent = agent
        self.net_names = net_names
        self.data = Data(data_params)

    def PushData(self, agent):
        for p in self.data.data.keys():
            self.data.push(p, agent._play, getattr(agent, p), -1)

    def SaveData(self, agent):
        path = DOC_ROOT_PATH+'/'+agent.env.session_name+DOC_DATA_PATH+'/'
        if not os.path.exists(path):
                os.makedirs(path)
        file_name = 'data.dat'
        self.data.save(path+file_name)

    def SaveNets(self, agent):
        for n in self.net_names:
            net = getattr(agent, n)
            path = DOC_ROOT_PATH+'/'+agent.env.session_name+DOC_NETS_PATH+'/'

            if not os.path.exists(path):
                os.makedirs(path)
            file_name = self.dt() + '_'+n+'_p%d_r%d.net' %(agent._play, agent._round)
            torch.save(net.state_dict, path+file_name)

    #downloads and saves all picture files that grasshopper took as screenshots from this session
    #supply fully qulified url as rhino_remote_url, like 'http://localhost:5000'
    def SavePics(self, agent):
        r = requests.get(PICS_URL_CTRL+'session_name='+agent.env.session_name, allow_redirects=True)
        if r.ok and r.content:
            z = zipfile.ZipFile(io.BytesIO(r.content))
            z.extractall(DOC_ROOT_PATH+'/'+agent.env.session_name+DOC_PICS_PATH)
        else:
            print(colored("Couldn't download images", 'red'))


    def dt(self):
        return datetime.now().strftime('%Y%m%d-%H%M%S')