######################## GENERAL ENV SETTINGS ########################
######################################################################
BOX_WIDTH = 120.0
BOX_HEIGHT = 80.0
#HOME_POSE = [1.2778060327134739,-1.4472531241992734,0.57571839568919525,-0.79269921521795972,-1.5426572143956907,-0.29167462436362385]
HOME_POSE = [1.1334346532821655,-1.7553976217852991,0.8690872192382812,-0.6843889395343226,-1.5728209654437464,-0.424158]
SOURCE_POSE = [-0.54280186239678885, -1.4080453135706659, 2.6720083944846227, -1.2639630809139579, -3.6843945159865816, 0.0]
ROBOT_SPEED_AUTO = 0.5
ROBOT_GET_BLOCK_SPEED = 0.6

######################## ROS / ROBOTICS SETTINGS ########################
#########################################################################
ROS_HOST = 'localhost'  # The server's hostname or IP address
ROS_PORT = 65432        # The port used by the server
BUF_SIZE_OBS = 8192     # buffer size. This could become large. 8192 should be fine for up to around 30 boxes



######################## SIMULATION SETTINGS ########################
#####################################################################
#this communicates with the RhinoManager, an ASP.NET application running on windows, offering functions to kill / restart rhino, in case of crashes
RHINOREMOTE_URL = 'http://192.168.137.1:5000/'
RR_TIMEOUT = 40
RR_BASIC_CTRL = 'RhinoRemote'
RR_GH_FORWARDING_CTRL = 'Forward'

#the Grasshopper adress is assembled from the GH_IP, Rhino PID number and the specific controller
#e.g. http://127.0.0.1:13648/action_reach
#if the rhino pid is shorter than five characters, it will be filled with leading port prefixes (GH_PORT_PREFIX)
#e.g. rhino pid: 768 --> port nr: 44768
GH_PORT_PREFIX = '4'
GH_CTRL_DROP = 'drop'
GH_CTRL_COLL = 'coll_test' #also screenshots
GH_CTRL_FH_RUN = 'fh_run'
GH_CTRL_FH_RESET = 'fh_reset'

TIME_RESET_BTN = 0.5 #how long is the FH reset button pressed
TIMEOUT_DROP = 45.0
TIMEOUT_COLL = 45.0      #timeout for generic requests
TIMEOUT_FH = 45.0       #timeout for flexhopper controls (start and reset)

ROS_REQUIRED = False



######################## DOCUMENTATION SETTINGS ########################
########################################################################
DOC_ROOT_PATH = './doc' #path relative to where agent is started from
DOC_NETS_PATH = '/nets'
DOC_DATA_PATH = '/data'
DOC_PICS_PATH = '/pics'
DOC_AGENT_PATH = '/agent'

PICS_URL_CTRL = 'http://192.168.137.1:5000/Images?'
P_TIMEOUT = 30

SAVE_NETS_EVERY = 1000
SAVE_DATA_EVERY = 1000
SAVE_PICS_EVERY = 500