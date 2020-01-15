from rlkit.samplers.rollout_functions import rollout
from rlkit.torch.pytorch_util import set_gpu_mode
import argparse
import torch
import uuid
import deepbuilder
from rlkit.core import logger

filename = str(uuid.uuid4())


def simulate_policy(args):
    data = torch.load(args.file)
    policy = data['evaluation/policy']
    #env = data['evaluation/env']
    env = deepbuilder.learning_ws.modules.stuff.NormalizedActions(deepbuilder.learning_ws.modules.environment.DeepBuilderEnv(args.session_name, 6, 7, 20, 12))
    env.is_simulation = args.simulation == 1
    print("Policy loaded")
    if args.gpu:
        set_gpu_mode(True)
        policy.cuda()
    while True:
        path = rollout(
            env,
            policy,
            max_path_length=args.H,
            render=True,
        )
        if hasattr(env, "log_diagnostics"):
            env.log_diagnostics([path])
        logger.dump_tabular()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('file', type=str,
                        help='path to the snapshot file')
    parser.add_argument('--H', type=int, default=300,
                        help='Max length of rollout')
    parser.add_argument('--gpu', action='store_true')
    parser.add_argument('--session_name', type=str)
    parser.add_argument('--simulation', type=int,default=1)
    args = parser.parse_args()

    simulate_policy(args)
