import json

HOME_POSE = [1.2228,-1.6317,1.1287,0.50297,1.2228,3.1416]

JOINT_NAMES = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']

TWINCAT_ADDRESS = 'http://192.168.137.1:8528/twincat/'

BASE_FRAME_ID_KINEMATICS = '/base'

ROBOT_CONFIG_FILE = "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/src/robot_config.json"

def ROBOT_CONFIG():
    data = {}
    with open(ROBOT_CONFIG_FILE) as json_file:
        data = json.load(json_file)
    return data

#json explanantion
# jump_threshold for move_group.compute_cartesian_path
# axis speed default axis speed when moving around, not print speed
# m/s during printing
# GVL.Override in TwinCAT file