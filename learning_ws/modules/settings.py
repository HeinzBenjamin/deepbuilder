import torch
import numpy as np

######################### ROBOTICS SETTINGS ##########################
######################################################################
ACTION_LIMIT_LOWER = np.array([-0.5 * np.pi, -np.pi, -0.5 * np.pi, -np.pi, -0.5 * np.pi, 0.0, -np.pi])
ACTION_LIMIT_UPPER = np.array([1.5 * np.pi, 0.0, 1.5 * np.pi, np.pi, 1.5 * np.pi, 2.0 * np.pi, np.pi])


######################## GENERAL ENV SETTINGS ########################
######################################################################
HOME_POSE = HOME_POSITION = [1.13344,-1.8112,1.2823,0.5129,1.6990,3.1416]


######################## ROS / ROBOTICS SETTINGS ########################
#########################################################################
ROS_HOST = 'localhost'  # The server's hostname or IP address
ROS_PORT = 9090        # The port used by the server
ROS_PATH_SRV_TIMEOUT = 30
ROBOT_SPEED_AUTO = 0.7
ROBOT_GET_BLOCK_SPEED = 0.8


######################## SIMULATION SETTINGS ########################
#####################################################################
#this communicates with the RhinoManager, an ASP.NET application running on windows, offering functions to kill / restart rhino, in case of crashes
RHINOREMOTE_URL = 'http://192.168.137.1:5000/'
RR_TIMEOUT = 40
RR_BASIC_CTRL = 'RhinoRemote'
OBSERVATION_CUBE_LENGTH = 750.0
DISTANCE_TCP_STATE_MAX = 2500.0 #millimeter
DISTANCE_TCP_STATE_LOW = 90.0 #lower threshold, any distance lower than that is considered perfect

MAX_AREA = 750.0 * 750.0 #sqmm

#IMPORTANT!!!!!!! Needs to be adapted when encoder nets are exchanged
#DEFAULT_OBSERVATION = [1.41394353,-0.7328441,-0.216456532,0.132131383,0.5628936,0.621495664,-0.042967096,-0.54986614,1.09692991,0.203249544,1.045459,-0.594510138,-0.5410571,-0.120454118,-0.474964023,0.6354702,0.82455647,1.41160262,0.3397056,-0.411052138,-0.3890899,-0.8606682,-0.8521638,-0.316793919,-0.08466716,-0.77982986,0.07484783,-0.149932325,-0.161270767,0.878216445,-0.389449745,0.160662517,-0.143946528,-0.288012832,-0.2876643,-0.6954398,-0.499914616,-0.6400545,-0.2963224,0.204220772,0.0548774973,-0.843710542,-0.493706524,0.0304473955,0.335234761,-0.613973856,-0.47471118,1.05593109,0.288394034,-0.7499815,-0.216303512,0.1516957,0.447063863,-0.6134914,-0.188074976,0.543978333,0.8098208,-0.194325641,-1.11878943,0.0131476885,-1.40260577,-0.6210821,0.4812973,0.0481635481,-0.609477043,-0.310510844,-0.336126179,0.266224056,-0.346502483,1.1146276,-0.02414852,-0.04047532,0.8526183,0.2829353,-0.537636042,0.5037297,-0.5179882,0.5249299,-0.08572379,-0.3042769,0.128822729,-0.195631161,-1.1044383,-0.206233263,0.276607662,-0.9461615,0.0246469,0.2178366,-0.4167207,-0.102067709,-0.231598765,-0.6982418,0.044614993,0.101383254,0.0396048166,1.24481344,0.17074956,-0.492292732,1.50022006,-0.0469850674,-0.478051722,-0.352735,0.279484332,-0.204656333,-0.318086922,-0.3759336,-0.6070871,-0.104005039,-0.07774596,-0.7044998,0.245780319,0.119996965,0.591127157,0.0427409858,0.0233280361,0.495551437,0.5736942,-0.91105336,0.3640009,0.236330137,-0.224246129,1.38389051,-0.747978032,-0.1226271,-0.436486036,0.00709986128,-0.192450508,0.3121583,0.385311663,-0.5500742,0.219748765,0.6599861,0.745518267,-0.358147472,-0.7133359,0.382541716,0.282331973,-0.791285753,0.205041468,0.376267761,-0.563913047,0.813086,0.0148315392,1.2114768]

#the Grasshopper adress is assembled from the GH_IP, Rhino PID number and the specific controller
#e.g. http://127.0.0.1:13648/action_reach
#if the rhino pid is shorter than five characters, it will be filled with leading port prefixes (GH_PORT_PREFIX)
#e.g. rhino pid: 768 --> port nr: 44768

TIME_RESET_BTN = 0.5 #how long is the FH reset button pressed
TIMEOUT_ACTION = 60.0
TIMEOUT_FH = 60.0       #timeout for flexhopper controls (start and reset) AND start


######################## DOCUMENTATION SETTINGS ########################
########################################################################
DOC_ROOT_PATH = './doc' #path relative to where agent is started from
DOC_NETS_PATH = '/nets'
DOC_DATA_PATH = '/data'
DOC_PICS_PATH = '/pics'
DOC_AGENT_PATH = '/agent'

SAVE_NETS_EVERY = 1000
SAVE_DATA_EVERY = 1000
SAVE_PICS_EVERY = 500