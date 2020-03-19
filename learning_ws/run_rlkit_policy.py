### ONLY SAC SUPPORTED

from rlkit.samplers.rollout_functions import rollout
from rlkit.torch.pytorch_util import set_gpu_mode
import argparse
import torch
import uuid
import deepbuilder
from rlkit.core import logger

from modules import environment as env
from modules import networks as n
from modules import stuff
from modules import documentation as doc
from modules.settings import *

filename = str(uuid.uuid4())


def simulate_policy(args):
    #data = torch.load(args.file)
    variant, data = doc.load_rklit_file(args.session_name)
    if args.mode == 'eval':
        policy = data['evaluation/policy']
    elif args.mode == 'expl':
        policy = data['exploration/policy']
    else:
        policy = None
    #env = data['evaluation/env']
    environment = stuff.NormalizedActions(env.DeepBuilderEnv(args.session_name, 6, 7, 20, 12))
    environment.env.is_simulation = args.simulation == 1
    print("Policy loaded")

    set_gpu_mode(True)
    policy.cuda()


    while True:
        path = rollout(
            environment,
            policy,
            #max_path_length=args.H,
            render=False,
        )
        if hasattr(env, "log_diagnostics"):
            environment.log_diagnostics([path])
        logger.dump_tabular()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--H', type=int, default=300,
                        help='Max length of rollout')
    parser.add_argument('--gpu', action='store_true')
    parser.add_argument('--session_name', type=str)
    parser.add_argument('--simulation', type=int,default=1)
    parser.add_argument('--mode', type=str, default='expl')
    args = parser.parse_args()

    simulate_policy(args)
