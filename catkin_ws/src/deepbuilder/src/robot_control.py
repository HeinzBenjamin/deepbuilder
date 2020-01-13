#!/usr/bin/env python

# offers all robot controls necessary in deepbuilder project
# also works with simulated robot for learning
import rospy, actionlib
from control_msgs.msg import *
from visualization_msgs.msg import Marker
from tf2_msgs.msg import TFMessage
from termcolor import colored
from deepbuilder.srv import *
import path_planning as pp
import settings

client = None
table_marker = Marker()
table_marker_pub = rospy.Publisher('/deepbuilder/robot/environment', Marker ,queue_size=1)

def make_table_marker():
    global table_marker

    table_marker.header.frame_id=settings.BASE_FRAME_ID_KINEMATICS
    table_marker.header.stamp = rospy.Time.now()
    table_marker.ns = 'table-fixed'
    table_marker.id = 0
    table_marker.type = Marker.CUBE
    table_marker.action = Marker.ADD
    table_marker.pose.position.x = 0.0
    table_marker.pose.position.y = -0.447
    table_marker.pose.position.z = -0.465
    table_marker.pose.orientation.w = 1.0
    table_marker.scale.x = 0.795
    table_marker.scale.y = 1.195
    table_marker.scale.z = 0.93
    table_marker.color.r = 0.2
    table_marker.color.g = 0.2
    table_marker.color.b = 0.2
    table_marker.color.a = 1.0
    table_marker.lifetime = rospy.Duration()

#draw everything belonging to environment into the rviz canvas
def draw_environment(data):
    global table_marker_pub
    global table_marker
    table_marker_pub.publish(table_marker)


def move_home(req):
    print "Moving home..."
    reqq = ro_move_pointRequest()
    reqq.goal = settings.HOME_POSE
    reqq.speed = req.speed
    return str(move_point(reqq))

def move_point(req):
    print "Moving to point..."
    reqq = ro_check_pathRequest()
    reqq.goal = req.goal
    res = pp.plan_path(reqq)
    if res.message != "SUCCESS":
        print res
        return res
    reqqq = ro_move_pathRequest()
    
    reqqq.path = res.path
    return move_path(reqqq)

def move_path(req):
    pass
    #client bla bla

def main():
    global client
    global table_marker_pub
    global table_marker

    try:
        print colored("[deepbuilder] Robot Control STARTUP", 'cyan')
        rospy.init_node("deepbuilder_robot_control")
        client = actionlib.SimpleActionClient('follow_joint_trajectory', FollowJointTrajectoryAction)
        client.wait_for_server()
        print colored("[deepbuilder] Found Joint Trajectory Server", 'cyan')

        srv_home = rospy.Service('deepbuilder/robot/move_home',ro_move_home, move_home)
        srv_point = rospy.Service('deepbuilder/robot/move_point', ro_move_point, move_point)
        srv_path = rospy.Service('deepbuilder/robot/move_path', ro_move_path, move_path)
        
        make_table_marker()
        draw_environment('')
        rospy.Subscriber("/tf", TFMessage, draw_environment)

        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

    except:
        raise



if __name__ == '__main__':
    main()