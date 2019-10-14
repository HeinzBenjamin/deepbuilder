from rlkit.samplers.rollout_functions import rollout
from rlkit.torch.pytorch_util import set_gpu_mode
import argparse
import torch
import uuid, torch
import deepbuilder, good_path
from rlkit.core import logger

from modules import environment as env
from modules import networks as n
from modules import stuff
from modules import documentation as doc
from modules.settings import *

filename = str(uuid.uuid4())


def simulate_policy(args):
    #policy = data['evaluation/policy']
    #env = data['evaluation/env']
    environment = stuff.NormalizedActions(env.DeepBuilderEnv("replay", 6, 7, 20, 12))
    environment.env.is_simulation = args.simulation == 1
    environment.reset()

    trajectory = good_path.td3

    for i in range(int(args.start_at), len(trajectory)):
        action = trajectory[i]
        actiont = torch.FloatTensor(action)
        try:        
            environment.step(actiont)
        except ValueError as err:
            if err.args[0] == "GH_OUT":
                print("Lost connection to GH, will need to play this episode again")
            else:
                raise


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--simulation', type=int,default=1)
    parser.add_argument('--start_at', type=int,default=0)
    args = parser.parse_args()

    simulate_policy(args)
