import numpy as np
from . import path_planning as pp

tower_growth_rew = 70.0
tower_collapse_rew = -5.0

#COLLISION RELATED
rew_self_collision = -25.0
rew_env_collision = -25.0

block_stuck_rew = -5.0

#STD related rewards
box_std_full_rew_threshold = 60        # as the env is a bit noisy we need to add a threashold for box x,y std rewards
box_std_no_rew_threshold = 140       

#CONTROLLED ACTION related rewards
full_ctrl_act_rew_angle = 15.0 #indiscounted full reward. This is interpolated linearly btw full_rew_threshold and no_rew_throshold based on measrued angle
full_rew_threshold_angle = 0.3 # full control reward is granted when box angle is below this values
no_rew_threshold_angle = 0.8    # no control reward is granted for angle above this value, between this and the full_rew threshold values are interpolated

full_ctrl_act_rew_dist = 15.0 #indiscounted full reward. This is interpolated linearly btw full_rew_threshold and no_rew_throshold based on measrued angle
full_rew_threshold_dist = 120  # full control reward is granted when box angle is below this values
no_rew_threshold_dist = 800    # no control reward is granted for angle above this value, between this and the full_rew threshold values are interpolated
    
#PRESENT BOXES related
rew_per_present_box = 0.1

#SAFE POSE rewards
rew_per_safe_pose_found = 0.1  #only applied if threshold for path length surpassed (something like 3)

#REWARD for finding an alternative route
rew_alternative_route = 1

#REWARD for tcp block proximity
tower_tip_full_rew=20.0
tower_tip_far = 800
tower_tip_close = 120

play_volume = {"minX": -395.0, "maxX": 395.0, "minY": -1045.0, "maxY": -275.5, "minZ": 0.0, "maxZ": 1300.0}

def IsInField(pointX, pointY, pointZ):
    return play_volume["minX"] <= pointX <= play_volume["maxX"] and play_volume["minY"] <= pointY <= play_volume["maxY"] and play_volume["minZ"] <= pointZ <= play_volume["maxZ"]


def rew_interpolation(worst_rew, best_rew, worst_val, best_val, value):
    rew_range = best_rew - worst_rew
    val_range = best_val - worst_val
    add_rew = worst_rew + ((value - worst_val) / val_range) * rew_range 
    return np.clip(add_rew, a_min=worst_rew, a_max=best_rew)

def ForCollisionInGoalPose(self_collision, env_collision):
    #rew = 0 + (rew_self_collision if self_collision else 0.0) + (rew_env_collision if env_collision else 0.0)
    rew = 0 if not self_collision else rew_self_collision
    rew += 0 if not env_collision else (rew_env_collision if not self_collision else 0.0)
    info = ""
    done = False
    if self_collision:
        info += "Self collision in goal pose. "
        done = False
    if env_collision:
        info += "Env collision in goal pose. "
        done = False
    return rew, info, done, not self_collision and not env_collision

def ForLowStd(rew, info, box_std):
    if box_std <= 0.0 or box_std > box_std_no_rew_threshold:
        return rew, info
    full_rew = 10
    if box_std < box_std_full_rew_threshold:
        return rew + full_rew, info +"Low std reward: " + str(full_rew) + ". "
    else:
        rng = box_std_no_rew_threshold - box_std_full_rew_threshold
        add_rew = full_rew * (box_std_no_rew_threshold - box_std) / rng
        return rew + add_rew, info +"Low std reward: " + str(add_rew) + ". "


def ForControlledAction(rew, info, angle, tcp_box_dist):
    ang_rew = rew_interpolation(0.0, full_ctrl_act_rew_angle, no_rew_threshold_angle, full_rew_threshold_angle, angle)
    if ang_rew > 0.0:
        info += "Ctrl act reward - angle: " + str(ang_rew) + ". "
    dist_rew = rew_interpolation(0.0, full_ctrl_act_rew_dist, no_rew_threshold_dist, full_rew_threshold_dist, tcp_box_dist)
    if dist_rew > 0.0:
        info += "Ctrl act reward - dist: " + str(dist_rew) + ". "
    return rew + ang_rew + dist_rew, info

def ForPresentBoxes(rew, info, num_boxes):
    add_rew = num_boxes * rew_per_present_box
    return rew + add_rew, info + "Box presence ("+str(num_boxes)+") reward: " + str(add_rew) + ". "

def ForSafePoses(rew, info, num_point_in_path):
    add_rew = rew_per_safe_pose_found * num_point_in_path
    return rew + add_rew, info + "Safe poses ("+str(num_point_in_path)+") reward: " + str(add_rew) + ". "

def ForAlternativeRoute(rew, info):
    return rew + rew_alternative_route, info + "Alternative route reward: " + str(rew_alternative_route) + ". "

def ForTcpCloseToTower(rew, info, res, all_boxes):
    if len(all_boxes) == 0:
        return rew, info
    tcp_position = [res["last_tcp"]["position"]["x"],res["last_tcp"]["position"]["y"],res["last_tcp"]["position"]["z"]]
    box_position = [0.0,0.0,9999.9] #something very far away

    height = -9999.0
    for i in range(len(all_boxes)):
        new_height = all_boxes[i]['position']['z']
        new_box = [all_boxes[i]['position']['x'],all_boxes[i]['position']['y'],all_boxes[i]['position']['z']]
        if IsInField(new_box[0], new_box[1],new_box[2]) and new_height > height:
            box_position = new_box
            height = new_height
    
    if tcp_position[2] > box_position[2]:
        add_rew = rew_interpolation(0, tower_tip_full_rew, tower_tip_far, tower_tip_close, pp.angular_distance(tcp_position,box_position))
        info+="Tower tip proximity reward: " + str(add_rew)
        rew += add_rew

    return rew, info
    
def TowerChange(rew, info, current_height_env, res, box_width, box_height):
    height_difference = res["current_height"]-current_height_env
    if height_difference > box_height * 0.48:
        #tower got taller, but we don't know yet why and if it's valid
        if len(res["box_poses"]) == 1:
            info+="First block. "
            rew += 1
        if height_difference > box_width * 1.2 or (len(res["box_poses"]) == 1 and res["current_height"] > box_width * 0.8):
            if res["current_height"] > box_height * 0.48 and res["current_height"] < box_width * 0.6 and current_height_env < -200.0:
                info+="A block found the table. "
            elif res["current_height"] > -300.0:
                info+="Block stuck on robot. "
                rew += block_stuck_rew
            else:
                info+='Block fell from table'

        else:
            info+="Tower got taller. "
            rew += tower_growth_rew

    elif height_difference < -box_height*0.51:
        info+="Tower collapsed. "
        rew +=tower_collapse_rew
    else:
        info+="Tower unchanged. "
    return rew, info