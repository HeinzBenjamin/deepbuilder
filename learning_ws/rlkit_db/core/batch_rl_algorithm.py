import abc
from termcolor import colored

import gtimer as gt
from rlkit_db.core.rl_algorithm import BaseRLAlgorithm
from rlkit_db.data_management.replay_buffer import ReplayBuffer
from rlkit_db.samplers.data_collector import PathCollector


class BatchRLAlgorithm(BaseRLAlgorithm, metaclass=abc.ABCMeta):
    def __init__(
            self,
            trainer,
            environment,
            exploration_data_collector: PathCollector,
            evaluation_data_collector: PathCollector,
            replay_buffer_eval: ReplayBuffer,
            replay_buffer_expl: ReplayBuffer,            
            num_epochs, 
            num_eval_plays_per_epoch,
            num_expl_plays_per_epoch, 
            batch_size,
            num_plays_before_training = 0,          
            num_train_loops_per_epoch = 1
    ):
        super().__init__(
            trainer,
            environment,
            exploration_data_collector,
            evaluation_data_collector,
            replay_buffer_expl,
            replay_buffer_eval,
        )
        
        self.num_plays_before_training = num_plays_before_training
        self.num_epochs = num_epochs        
        self.num_eval_plays_per_epoch = num_eval_plays_per_epoch
        self.num_expl_plays_per_epoch = num_expl_plays_per_epoch
        self.batch_size = batch_size
        self.num_train_loops_per_epoch = num_train_loops_per_epoch
        

    def _train(self):
        # DEEPBUILDER STUFF        
        #just collect stuff before training starts
        self.environment.env.phase = 'init'
        if self.num_plays_before_training > 0:
            init_expl_paths = self.expl_data_collector.collect_new_paths(
                self.num_plays_before_training,
            )
            self.replay_buffer_expl.add_paths(init_expl_paths)
            self.expl_data_collector.end_epoch(-1)

        #actual training
        for epoch in gt.timed_for(
                range(self._start_epoch, self.num_epochs),
                save_itrs=True,
        ):
            #evaluation phase, no effect on learning
            #run action steps and collect everything
            self.environment.env.phase = 'eval'
            new_eval_paths = self.eval_data_collector.collect_new_paths(
                self.num_eval_plays_per_epoch,
            )
            gt.stamp('evaluation sampling')
            self.replay_buffer_eval.add_paths(new_eval_paths)

            #exploration phase, collects learning samples
            self.environment.env.phase = 'expl'
            new_expl_paths = self.expl_data_collector.collect_new_paths(
                self.num_expl_plays_per_epoch,
            )
            gt.stamp('exploration sampling', unique=False)

            self.replay_buffer_expl.add_paths(new_expl_paths)
            gt.stamp('data storing', unique=False)

            self.training_mode(True)
            for i in range(self.num_train_loops_per_epoch):
                print(colored("Training policy networks [{:4d}/{:4d}]\r".format(i+1, self.num_train_loops_per_epoch), color='cyan', attrs=['dark']), end="" if i < self.num_train_loops_per_epoch-1 else "\n")
                train_data = self.replay_buffer_expl.random_batch(
                    self.batch_size)
                self.trainer.train(train_data)
            gt.stamp('training', unique=False)
            self.training_mode(False)

            self._end_epoch(epoch)
