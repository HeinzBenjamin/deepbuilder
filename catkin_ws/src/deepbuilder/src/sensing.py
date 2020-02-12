#!/usr/bin/env python

import rospy, copy, settings, tf, time
import robot_control as rc 
import path_planning as pp
from termcolor import colored
from geometry_msgs.msg import *
from apriltag_ros.msg import *
from deepbuilder.srv import *
from visualization_msgs.msg import *
import robot_control as rc
import settings

current_tags = []
current_ids = []
current_types = []
t_pub = rospy.Publisher('/deepbuilder/sensing/tags', MarkerArray ,queue_size=1)
tf_listener = None

def update_tags(tags):
    global current_tags
    global current_ids
    global current_types
    global tf_listener
    global t_pub
    
    tmp_detects = copy.deepcopy(tags)
    tags_ma = MarkerArray()  
    tf_listener.waitForTransform('/world', '/camera1_optical_frame', rospy.Time(), rospy.Duration(0.3333333))

    tmp_tags = []
    tmp_ids = []
    tmp_types = []  

    for t in tmp_detects.detections:        
        t.pose.header.frame_id = "/camera1_optical_frame"
        p_stamped = PoseStamped()
        p_stamped.pose = t.pose.pose.pose
        p_stamped.header = t.pose.header
        try:
            ppp = tf_listener.transformPose('/world', p_stamped)
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            return
        m = Marker()
        m.header = t.pose.header
        m.header.frame_id = "/world"
        m.ns = 'tags'
        m.id = int(t.id[0])
        m.type = Marker.CUBE
        m.action = Marker.ADD
        m.pose = ppp.pose

        if m.id < 58:
            m.scale.x = 0.09
            m.scale.y = 0.09
            m.scale.z = 0.045
            m.color.r=0.0
            m.color.g=0.0
            m.color.b=0.7
            m.color.a=0.6
        else:
            m.scale.x = 0.0225
            m.scale.y = 0.0225
            m.scale.z = 0.001
            m.color.r=0.0
            m.color.g=0.3
            m.color.b=0.4
            m.color.a=0.6
        m.lifetime=rospy.Duration()
        tags_ma.markers.append(m)

        tmp_tags.append(ppp.pose.position.x * 1000.0)
        tmp_tags.append(ppp.pose.position.y * 1000.0)
        tmp_tags.append(ppp.pose.position.z * 1000.0)
        tmp_tags.append(ppp.pose.orientation.x)
        tmp_tags.append(ppp.pose.orientation.y)
        tmp_tags.append(ppp.pose.orientation.z)
        tmp_tags.append(ppp.pose.orientation.w)

        tmp_ids.append(m.id)
        tmp_types.append(0 if m.id < 30 else (1 if m.id < 44 else (2 if m.id < 58 else 3)))
    
    current_tags = tmp_tags
    current_ids = tmp_ids
    current_types = tmp_types 

    t_pub.publish(tags_ma)
    rospy.sleep(rospy.Duration(0.333333))

def get_tags(req):
    global current_tags
    global current_ids
    global current_types

    res = se_get_tagsResponse()
    
    res.types = copy.deepcopy(current_types)
    res.tag_poses = copy.deepcopy(current_tags)
    res.ids = copy.deepcopy(current_ids)

    return res

def collect_tags(req):
    #CONTINUE HERE!!!! in debugging session
    #this repeatedly calls get_tags while travelling along the collection path
    #then avergaes tags based on pairs and number of detections

def main():
    global tf_listener
    try:
        print colored("[deepbuilder] Sensing STARTUP", 'cyan')
        rospy.init_node("deepbuilder_sensing")
        tf_listener = tf.TransformListener(cache_time = rospy.Duration(5))


        srv_tags = rospy.Service('deepbuilder/sensing/get_tags',se_get_tags, get_tags)

        rospy.Subscriber("/tag_detections", AprilTagDetectionArray, update_tags)

        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

    except:
        raise

if __name__=="__main__":
    main()