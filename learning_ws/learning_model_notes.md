### NOTES OF THE CURRENLTY APPLIED LEARNING ALGORITHM ###

Performance: Generally SHIT

python soft_actor_critic.py --session_name 190824_ttt

START PARAMS:
    - at default
    
    act_dim = 6 (axis space)
    box_dim = None
    box_net_resolution = 12x12
    hid_dim = 96
    num_hidden = 1
    max_num_boxes = 20
    
    replay_buffer_size = 2000000 (but not reached)
    value_lr = 3e-4
    soft_q_lr = 3e-4
    policy_lr = 3e-4
    
    num_plays = 100000 (but not reached)
    batch_size = 128

ENV PARAMS:

    box_width = 120
    box_height = 80
    action_space = -pi to pi (axis space)
    action normalization:
        a0: halfed
        a1: halfed and +pi/2 (avoid many floor collisions)
    state_space: neural net of height vals 144 (12 x 12)

REWARD SYSTEM:

    if pose not reachable (no distinction btw self collision and env collision):
        -10.0
        done = False

    if pose reachable:
        first block: 1
        block stuck on robot: -3.0
        tower got taller: 50.0
        tower collapse: -5.0
        tower unchanged: 0
        controlled action reward:
            rew_interpolation btw 0 and 15 for angles btw 0.3 (good) and 0.8 (bad)
        tcp close to tower:
            rew_interpolation btw 0 and 20 for dist 120mm (good) and 800mm (bad)

        
