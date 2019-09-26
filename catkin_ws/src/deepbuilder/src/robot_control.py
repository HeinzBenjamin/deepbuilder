#!/usr/bin/env python
import time, json, math, rospy, tf, actionlib
import roslib; roslib.load_manifest('ur_driver')
from termcolor import colored
from control_msgs.msg import *
from trajectory_msgs.msg import *
from std_msgs.msg import *
from sensor_msgs.msg import JointState
from my_msgs.msg import *
from geometry_msgs.msg import *
from apriltag_ros.msg import AprilTagDetectionArray as tags
from tf2_msgs.msg import TFMessage
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from math import pi
from deepbuilder.srv import *
import settings

ROBOT_STATE = {}

JOINT_NAMES = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint',
               'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']

#source to home path. must be axis vals, must contain Distances between successive TCPs in 3D
s2h_path_file = '/home/ros/deepbuilder/catkin_ws/src/deepbuilder/src/paths/190826_source2home.path'
s2c_path_file = '/home/ros/deepbuilder/catkin_ws/src/deepbuilder/src/paths/190716_source2cam.path'
s2h_path = []
s2c_path = []
#axis distances calculated from axis val points in .path
s2h_ang_dist = []
s2c_ang_dist = []

#3D ditances between successive TCPs, this must be given in the .path file
s2h_tcp_dist = []
s2c_tcp_dist = []

#unweighted 6D Euclidean dist in axis space
#whenever the robot state deviates from the starting point of a path by more than this threshold, a confirmation request is thrown
angular_dist_threshold = 0.15

#when movement is requested in angular_mode the time difference between successive path points in the trajectory
#is calculated based on the distance in axis space (6D Euclidean). When the angular distance is calculated, by
#default the more relevant axes are weighed more so that large changes in lower axes results in slower movement
#that's what axis_weights is for. This can also be turned of with use_weights=False
axis_weights = [1.4, 1.4, 1.35, 1.1, 1.0, 1.0]

client = None

#gripper control services are handled in gripper_control.cpp, here we just use them via proxies
open_gripper = rospy.ServiceProxy('/deepbuilder/gripper/open', deepbuilder.srv.ro_gripper_open)
close_gripper = rospy.ServiceProxy('/deepbuilder/gripper/close', deepbuilder.srv.ro_gripper_close)
moveto_gripper = rospy.ServiceProxy('/deepbuilder/gripper/moveto', deepbuilder.srv.ro_gripper_moveto)

marker_pub_temp=rospy.Publisher('/deepbuilder/robot/block_temp_array', MarkerArray, queue_size=1)
marker_pub_state=rospy.Publisher('/deepbuilder/robot/block_state_array', MarkerArray, queue_size=1)

def partition_list(l, n):
    pl = []
    for i in range(len(l)/n):
        ppl = []
        for ii in range(n):
            ppl.append(l[i*n+ii])
        pl.append(ppl)
    return pl

def angular_distance(pointA, pointB,use_weights=True):
    return math.sqrt(sq_angular_distance(pointA, pointB))

def sq_angular_distance(pointA, pointB, use_weights=True):
    dist = 0.0
    for i in range(0,6):
        optA = abs(pointA[i]-pointB[i])
        optB = abs(2.0*pi-pointA[i]+pointB[i])
        optC = abs(2.0*pi-pointB[i]+pointA[i])
        i_dist = min(optA, min(optB, optC))
        dist += i_dist*i_dist * (1.0 if not use_weights else axis_weights[i])
    return dist

def find_closest(point, path):
    min_dist = float("inf")
    I = 0
    i = 0
    for p in path:
        d = sq_angular_distance(p, point, False)
        if d < min_dist:
            min_dist = d
            I = i
        i += 1
    return I

def goal_trajectory(path, speed, distances=[]):
    global joints_pos
    g = FollowJointTrajectoryGoal()
    g.trajectory = JointTrajectory()
    g.trajectory.joint_names = JOINT_NAMES
    try:
        joint_states = rospy.wait_for_message("joint_states", JointState)
        joints_pos = joint_states.position
        g.trajectory.points = []
        s = 0.0
        i = 0
        g.trajectory.points.append(
            JointTrajectoryPoint(positions=joints_pos, velocities=[0]*6, time_from_start=rospy.Duration(s)))
        for point in path:
            p = [point[0], point[1], point[2], point[3], point[4], point[5]]
            if distances == [] or i == 0:
                s += 1.0
            else:
                s += distances[i-1]/speed
            g.trajectory.points.append(
                JointTrajectoryPoint(positions=p, velocities=[0]*6, time_from_start=rospy.Duration(s)))
            i += 1
        g.trajectory.points[-1].time_from_start.secs += 1.0

        return g
        
    except:
        raise

#expects path as tuple of tuples of radian axis vals
def _move_path(path, speed, distances=[]):
    global joints_pos
    try:
        goal_traj = None
        joint_states = rospy.wait_for_message("joint_states", JointState)
        joints_pos = joint_states.position
        dist = angular_distance(joints_pos, path[0], False)
        if dist > angular_dist_threshold:
            print "Robot state"
            print str([joints_pos[i]/pi*180 for i in xrange(0,6)])
            print "is far away from path start"
            print str([path[0][i]/pi*180 for i in xrange(0,6)])
            print "Axis space distance: %.3f" % dist
            print "You have the following options:"
            print "g [go]: Go ahead. ATTENTION .. this is point 2 point movement. Make sure the path is clear"
            print "m [merge]: Look for the closest point in the path to robot state and start path from there"
            print "_ [<anything else>]: Abort"
            inp = raw_input("Continue? g/m/_: ")[0]
            if inp == 'g':
                goal_traj = goal_trajectory(path, speed, distances)
            elif inp == 'm':
                I = find_closest(joints_pos, path)
                print "Robot state is closests to point " + str(I)
                print str([path[I][i]/pi*180 for i in xrange(0,6)])
                print "Axis space distance: %.3f" % angular_distance(joints_pos, path[I], False)
                inp = raw_input("Continue? y/n: ")[0]
                if inp == 'y':
                    goal_traj = goal_trajectory(path[I:], speed, distances[I:])
                else:
                    print "Halting service call"
            else:
                print "Halting service call"
        else:
            goal_traj = goal_trajectory(path, speed, distances)

        if goal_traj != None:
            client.send_goal(goal_traj)
            client.wait_for_result()

    except KeyboardInterrupt:
        client.cancel_goal()
        raise
    except:
        raise

def move_source_h2s(req):
    print "Moving to source h2s..."
    _move_path(s2h_path[::-1], req.speed, s2h_tcp_dist[::-1] if req.tcp_mode else s2h_ang_dist[::-1])
    return ro_move_sourceResponse("SUCCESS")
        
def move_home_s2h(req):
    print "Moving home s2h..."
    _move_path(s2h_path, req.speed, s2h_tcp_dist if req.tcp_mode else s2h_ang_dist)
    return ro_move_homeResponse("SUCCESS")

def move_point_p2p(req):
    print "Moving to point p2p..."
    _move_path([req.goal], req.speed)
    return ro_move_pointResponse("SUCCESS")

def move_path(req):
    path = partition_list(req.path, 6)
    dists = []
    for i in range(len(path)-1):
        dists.append(angular_distance(path[i],path[i+1]))

    print "Moving along path..."
    _move_path(path, req.speed, dists)
    return ro_move_pathResponse("SUCCESS")

def get_block(req):
    #speed 0.6 for anything real
    #speed 0.3 for debugging
    #Also possible:
    open_gripper()
    move_source_h2s(req)
    moveto_gripper(goal=80)
    move_home_s2h(req)
    #open_gripper()

    return ro_get_blockResponse("SUCCESS")

def move_cam(req):
    print "Moving along camera path..."
    _move_path([s2h_path[-1]], 0.1)
    _move_path(s2c_path, req.speed, s2c_tcp_dist if req.tcp_mode else s2c_ang_dist)
    return ro_move_camResponse("SUCCESS")

#draws the fixed table and whatever is in global block_state
def draw_things(whatever):
    global block_state

    mA_state = MarkerArray()
    #draw currently stored box state
    #note: the state is maintained and updated in get_state, not here in this function
    #here we only draw it to rviz
    
    #table
    mt = Marker()
    mt.header.frame_id="/base"
    mt.header.stamp=rospy.Time.now()
    mt.ns="table-fixed"
    mt.id=199
    mt.type=Marker.CUBE
    mt.action=Marker.ADD
    mt.pose.position.x = 0.0
    mt.pose.position.y = -0.447
    mt.pose.position.z = -0.465
    mt.pose.orientation.x = 0.0
    mt.pose.orientation.y = 0.0
    mt.pose.orientation.z = 0.0
    mt.pose.orientation.w = 1.0
    mt.scale.x=0.795
    mt.scale.y=1.195
    mt.scale.z=0.93
    mt.color.r=0.2
    mt.color.g=0.2
    mt.color.b=0.2
    mt.color.a=1.0
    mt.lifetime=rospy.Duration()
    mA_state.markers.append(mt)

    #blocks
    
    for bl_name in block_state:
        box_pose = block_state[bl_name]

        ms = Marker()
        ms.header.frame_id="/base"
        ms.header.stamp=rospy.Time.now()
        ms.ns="block-state"
        ms.id=100 + int(bl_name.split("-")[1])
        ms.type=Marker.CUBE
        ms.action=Marker.ADD
        ms.pose.position.x = box_pose.position.x
        ms.pose.position.y = box_pose.position.y
        ms.pose.position.z = box_pose.position.z
        ms.pose.orientation.x = box_pose.orientation.x
        ms.pose.orientation.y = box_pose.orientation.y
        ms.pose.orientation.z = box_pose.orientation.z
        ms.pose.orientation.w = box_pose.orientation.w
        ms.scale.x=0.12
        ms.scale.y=0.12
        ms.scale.z=0.08
        ms.color.r=1.0
        ms.color.g=0.0
        ms.color.b=0.6
        ms.color.a=1.0
        ms.lifetime=rospy.Duration()
        mA_state.markers.append(ms)

    mA_state = draw_lines(mA_state, -0.378, 0.373, -1.0215, -0.2755, 11.0)
    marker_pub_state.publish(mA_state)

record_tags = False
boxes = []

tf_listener = None
tf_broadcaster = None

block_poses_base={}
block_poses_table={}

block_state = {}

def draw_lines(marker_array, minX, maxX, minY, maxY, resolution):
    x = minX
    y = minY
    stepX = (maxX-minX)/resolution
    stepY = (maxY-minY)/resolution

    m = Marker()
    m.header.frame_id="/base"
    m.header.stamp=rospy.Time.now()
    m.ns="ray"
    m.id=0
    m.type=Marker.LINE_LIST
    m.action=Marker.ADD
    m.pose.position.x = 0.0
    m.pose.position.y = 0.0
    m.pose.position.z = 0.0
    m.pose.orientation.x = 0.0
    m.pose.orientation.y = 0.0
    m.pose.orientation.z = 0.0
    m.pose.orientation.w = 1.0
    m.color.r=0.5
    m.color.g=0.1
    m.color.b=0.7
    m.color.a=0.4
    m.scale.x=0.0015

    while y<maxY:
        x=minX
        while x<maxX:
            p1 = Point(x,y,0.0)
            p2 = Point(x,y,0.4)
            m.points.append(p1)
            m.points.append(p2)
            x += stepX
        y += stepY

    m.lifetime=rospy.Duration()
    marker_array.markers.append(m)

    return marker_array
    
mA_temp = None

def tags_callback(tags):
    global tf_listener
    global tf_broadcaster
    global block_poses_base
    global block_poses_table
    global block_state
    global mA_temp

    #drawe fresh detections
    mA_temp = MarkerArray()
    try:
        #(table_trans, table_rot) = tf_listener.lookupTransform("/table", "/base", rospy.Time(0))
        tm = Marker()
        tm.header.frame_id="/table"
        tm.header.stamp=rospy.Time.now()
        tm.ns="table"
        tm.id=99
        tm.type=Marker.CUBE
        tm.action=Marker.ADD
        tm.pose.position.x = -0.002
        tm.pose.position.y = -0.6485
        tm.pose.position.z = 0.0
        tm.pose.orientation.x = 0.0
        tm.pose.orientation.y = 0.0
        tm.pose.orientation.z = 0.0
        tm.pose.orientation.w = 1.0
        tm.scale.x=0.781
        tm.scale.y=0.777
        tm.scale.z=0.001
        tm.color.r=0.2
        tm.color.g=0.2
        tm.color.b=0.4
        tm.color.a=0.6
        tm.lifetime=rospy.Duration()
        mA_temp.markers.append(tm)
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
        print "No table detected."

    

    for d in tags.detections:
        if len(d.id) == 6:
            try:
                bl_id = (d.id[0]-4)/6
                bl_name = "/block-%02d" % (bl_id,)

                m = Marker()
                #m.header.frame_id=bl_name
                m.header.frame_id = "/camera_color_optical_frame"
                m.header.stamp=rospy.Time.now()
                m.ns="block-temp"
                m.id=bl_id
                m.type=Marker.CUBE
                m.action=Marker.ADD
                p = d.pose.pose.pose
                m.pose.position.x = p.position.x
                m.pose.position.y = p.position.y
                m.pose.position.z = p.position.z
                m.pose.orientation.x = p.orientation.x
                m.pose.orientation.y = p.orientation.y
                m.pose.orientation.z = p.orientation.z
                m.pose.orientation.w = p.orientation.w
                m.scale.x=0.12
                m.scale.y=0.12
                m.scale.z=0.08
                m.color.r=0.0
                m.color.g=0.0
                m.color.b=0.7
                m.color.a=0.6
                m.lifetime=rospy.Duration()
                #marker_pub.publish(m)
                mA_temp.markers.append(m)
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                pass

            if not record_tags:
                continue

            try:
                pose_from_base = Pose()
                (pose_from_base.position, pose_from_base.orientation) = tf_listener.lookupTransform("/base", bl_name, rospy.Time(0))
                if bl_name not in block_poses_base:
                    block_poses_base[bl_name] = []
                block_poses_base[bl_name].append(pose_from_base)

            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                print "Couldn't find block transform relative to base"
            
            try:
                pose_from_table = Pose()
                (pose_from_table.position, pose_from_table.orientation) = tf_listener.lookupTransform("/table", bl_name, rospy.Time(0))
                if bl_name not in block_poses_table:
                    block_poses_table[bl_name] = []
                block_poses_table[bl_name].append(pose_from_table)

            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                print "Couldn't find block transform relative to table"

    marker_pub_temp.publish(mA_temp)

def get_state(req):
    global record_tags
    global block_poses_base
    global block_poses_table
    global block_state

    #empty global block buffers
    block_poses_base = {}
    block_poses_table = {}

    #declare srv return object
    resB = [] #Pose array to be returned

    #start recording
    print "Collecting block info..."
    record_tags = True

    move_cam(req)
    
    #end recording
    record_tags = False
    print "Done collecting"

    block_state = {}
    for bl_name in block_poses_base:
        newP = Pose()
        invLen = 1.0 / len(block_poses_base[bl_name])
        for p in block_poses_base[bl_name]:
            newP.position.x += p.position[0] * invLen 
            newP.position.y += p.position[1] * invLen 
            newP.position.z += p.position[2] * invLen  
            newP.orientation.x += p.orientation[0] * invLen
            newP.orientation.y += p.orientation[1] * invLen
            newP.orientation.z += p.orientation[2] * invLen
            newP.orientation.w += p.orientation[3] * invLen
        resB.append(newP)
        block_state[bl_name]=newP

    return ro_get_stateResponse(resB)

def get_robot_state(req):
    js = rospy.wait_for_message("joint_states", JointState)
    return ro_get_robot_stateResponse(joint_states = js.position)

def get_sensor_values(req):
    v = rospy.wait_for_message("deepbuilder/sensing/values", float_array)
    return se_get_valuesResponse(values=v)


def main():
    global client
    global tf_listener
    global tf_broadcaster

    try:
        print colored("--- Deep Builder Robot STARTUP ---", 'cyan')
        rospy.init_node("deepbuilder_robot_controls")
        client = actionlib.SimpleActionClient('follow_joint_trajectory', FollowJointTrajectoryAction)
        print colored("Waiting for UR server...", 'cyan')
        client.wait_for_server()
        print colored("Connected to UR server", 'cyan')

        parameters = rospy.get_param(None)
        index = str(parameters).find('prefix')
        if (index > 0):
            prefix = str(parameters)[index+len("prefix': '"):(index+len("prefix': '")+str(parameters)[index+len("prefix': '"):-1].find("'"))]
            for i, name in enumerate(JOINT_NAMES):
                JOINT_NAMES[i] = prefix + name

        print "Loading source2home path from file " + s2h_path_file
        with open(s2h_path_file, 'r') as f:
            s2h = json.load(f)
            for point in s2h["Path"]:
                s2h_path.append([point["A0"], point["A1"], point["A2"], point["A3"], point["A4"], point["A5"]])
                if len(s2h_path) > 1:
                    s2h_ang_dist.append(angular_distance(s2h_path[-1], s2h_path[-2]))
                
            for d in s2h["Distances"]:
                s2h_tcp_dist.append(d)

        print "Loading source2cam path from file " + s2c_path_file
        with open(s2c_path_file, 'r') as f:
            s2c = json.load(f)
            for point in s2c["Path"]:
                s2c_path.append([point["A0"], point["A1"], point["A2"], point["A3"], point["A4"], point["A5"]])
                if len(s2c_path) > 1:
                    s2c_ang_dist.append(angular_distance(s2c_path[-1], s2c_path[-2]))
                
            for d in s2c["Distances"]:
                s2c_tcp_dist.append(d)

        

        tf_listener = tf.TransformListener()
        tf_broadcaster = tf.TransformBroadcaster()
        pp_proxy = rospy.ServiceProxy('deepbuilder/robot/check_path', ro_check_path)

        rospy.Subscriber("/tag_detections", tags, tags_callback)
        rospy.Subscriber("/tf", TFMessage, draw_things)

        srv_home_s2h = rospy.Service('deepbuilder/robot/move_home_s2h',ro_move_home, move_home_s2h)
        srv_source_h2s = rospy.Service('deepbuilder/robot/move_source_h2s',ro_move_source, move_source_h2s)
        srv_pt = rospy.Service('deepbuilder/robot/move_to_point_p2p',ro_move_point, move_point_p2p) 
        srv_get_block = rospy.Service('deepbuilder/robot/get_block',ro_get_block, get_block) 
        srv_cam = rospy.Service('deepbuilder/robot/move_cam',ro_move_cam, move_cam)   
        srv_state = rospy.Service('deepbuilder/robot/get_state',ro_get_state, get_state)  
        srv_ro_states = rospy.Service('deepbuilder/robot/get_robot_state', ro_get_robot_state, get_robot_state)
        srv_move_goal = rospy.Service('deepbuilder/robot/move_path', ro_move_path, move_path)
        srv_sensing = rospy.Service('deepbuilder/sensing/get_values', se_get_values, get_sensor_values)


        rospy.spin()

    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

if __name__ == '__main__': main()