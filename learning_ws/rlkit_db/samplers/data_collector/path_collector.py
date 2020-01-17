from collections import deque, OrderedDict

from rlkit_db.core.eval_util import create_stats_ordered_dict
from rlkit_db.samplers.rollout_functions import rollout, multitask_rollout
from rlkit_db.samplers.data_collector.base import PathCollector
from termcolor import colored


class MdpPathCollector(PathCollector):
    def __init__(
            self,
            env,
            policy,
            max_num_epoch_paths_saved=None,
            render=False,
            render_kwargs=None,
    ):
        if render_kwargs is None:
            render_kwargs = {}
        self._env = env
        self._policy = policy
        self._max_num_epoch_paths_saved = max_num_epoch_paths_saved
        self._epoch_paths = deque(maxlen=self._max_num_epoch_paths_saved)
        self._render = render
        self._render_kwargs = render_kwargs

        self._num_steps_total = 0
        self._num_paths_total = 0

    def collect_new_paths(
            self,
            num_steps,
            discard_incomplete_paths,
    ):
        paths = []
        num_steps_collected = 0
        try:
            self._env.reset()
        except ValueError as err:
                if err.args[0] == "GH_OUT":
                    print("Starting GH")
                else:
                    raise
                
        while num_steps_collected < num_steps:
            try:
                path = rollout(
                    self._env,
                    self._policy,
                )
                num_steps_collected += len(path['actions'])
            except ValueError as err:
                if err.args[0] == "GH_OUT":
                    print("Lost connection to GH, will need to play this episode again")
                    self._env.reset()
                    continue
                else:
                    raise            
            paths.append(path)

        self._num_paths_total += len(paths)
        self._num_steps_total += num_steps_collected
        self._epoch_paths.extend(paths)
        return paths

    def get_epoch_paths(self):
        return self._epoch_paths

    def end_epoch(self, epoch):
        self._epoch_paths = deque(maxlen=self._max_num_epoch_paths_saved)

    def get_diagnostics(self):
        path_lens = [len(path['actions']) for path in self._epoch_paths]
        stats = OrderedDict([
            ('num steps total', self._num_steps_total),
            ('num paths total', self._num_paths_total),
        ])
        stats.update(create_stats_ordered_dict(
            "path length",
            path_lens,
            always_show_all_stats=True,
        ))
        return stats

    def get_snapshot(self):
        d = dict(
            #env=self._env,
            policy=self._policy,
        )
        return d


class GoalConditionedPathCollector(PathCollector):
    def __init__(
            self,
            env,
            policy,
            max_num_epoch_paths_saved=None,
            render=False,
            render_kwargs=None,
            observation_key='observation',
            desired_goal_key='desired_goal',
    ):
        if render_kwargs is None:
            render_kwargs = {}
        self._env = env
        self._policy = policy
        self._max_num_epoch_paths_saved = max_num_epoch_paths_saved
        self._render = render
        self._render_kwargs = render_kwargs
        self._epoch_paths = deque(maxlen=self._max_num_epoch_paths_saved)
        self._observation_key = observation_key
        self._desired_goal_key = desired_goal_key

        self._num_steps_total = 0
        self._num_paths_total = 0

    def collect_new_paths(
            self,
            num_plays,
    ):
        paths = []
        play = 0
        num_steps_collected = 0
        while play < num_plays:
            try:
                path = multitask_rollout(
                    self._env,
                    self._policy,
                    observation_key=self._observation_key,
                    desired_goal_key=self._desired_goal_key,
                    return_dict_obs=True,
                )
                
            except ValueError as err:
                if err.args[0] == "GH_OUT":
                    print(colored("GH_OUT was thrown during play. Play is restarted. No path was recorded.", color='magenta'))
                    continue

            num_steps_collected += len(path['actions'])
            paths.append(path)
            play += 1

        self._num_paths_total += len(paths)
        self._num_steps_total += num_steps_collected
        self._epoch_paths.extend(paths)
        return paths





    def get_epoch_paths(self):
        return self._epoch_paths

    def end_epoch(self, epoch):
        self._epoch_paths = deque(maxlen=self._max_num_epoch_paths_saved)

    def get_diagnostics(self):
        path_lens = [len(path['actions']) for path in self._epoch_paths]
        stats = OrderedDict([
            ('num steps total', self._num_steps_total),
            ('num paths total', self._num_paths_total),
        ])
        stats.update(create_stats_ordered_dict(
            "path length",
            path_lens,
            always_show_all_stats=True,
        ))
        return stats

    def get_snapshot(self):
        return dict(
            env=self._env,
            policy=self._policy,
            observation_key=self._observation_key,
            desired_goal_key=self._desired_goal_key,
        )
