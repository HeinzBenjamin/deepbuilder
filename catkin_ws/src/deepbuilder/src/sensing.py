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
import path_planning as pp
import settings

current_tags = []
current_ids = []
current_types = []
t_pub = rospy.Publisher('/deepbuilder/sensing/tags', MarkerArray ,queue_size=1)
tf_listener = None

srv_proxy_path = rospy.ServiceProxy('/deepbuilder/robot/plan_path', ro_plan_path)
srv_move_path = rospy.ServiceProxy('/deepbuilder/robot/move_path', ro_move_path)
srv_move_home = rospy.ServiceProxy('/deepbuilder/robot/move_home', ro_move_home)

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
    
    if len(tmp_tags) == 0:
        return

    current_tags = copy.deepcopy(tmp_tags)
    current_ids = copy.deepcopy(tmp_ids)
    current_types = copy.deepcopy(tmp_types)

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

def collect_state(req):
    robot_config = settings.ROBOT_CONFIG()

    srv_move_home.call(ro_move_homeRequest(speed=robot_config['sensing_speed'], wait=True))

    way_poses = pp.partition_list(req.poses, partition_size=6)
    last_succesful_pose = settings.HOME_POSE
    paths = []
    for pose in way_poses:
        planning_req = ro_plan_pathRequest(goal_pose=pose, state_pose=last_succesful_pose, session="sensing", speed=robot_config['sensing_speed'])
        try:
            res = srv_proxy_path.call(planning_req)
        except:
            continue
        if res.message == "SUCCESS":
            last_succesful_pose = pose
            paths.append(res.path)

    tag_collection = []

    #move along sensing path and take snapshots between each path segment
    for path in paths:
        mv_req = ro_move_pathRequest(path=path, wait=True)
        srv_move_path.call(mv_req)
        tag_collection.append(get_tags(se_get_tagsRequest()))
    
    #go back home bc #yolo
    srv_move_home.call(ro_move_homeRequest(speed=robot_config['sensing_speed'], wait=True))

    by_block = {}
    for measurement in tag_collection:
        i = 0
        for _id in measurement.ids:
            if not by_block.has_key(_id):
                by_block[_id] = []
            by_block[_id].append(measurement.tag_poses[(i*7):((i+1)*7)])
            i += 1

    res = se_collect_stateResponse()
    res.tag_poses = []

    #average over all measurements
    by_block_average = {}
    for i in by_block:
        by_block_average[i] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
        ratio = 1.0 / len(by_block[i])
        for ii in range(len(by_block[i])):
            by_block_average[i][0] += by_block[i][ii][0] * ratio
            by_block_average[i][1] += by_block[i][ii][1] * ratio
            by_block_average[i][2] += by_block[i][ii][2] * ratio
            by_block_average[i][3] += by_block[i][ii][3] * ratio
            by_block_average[i][4] += by_block[i][ii][4] * ratio
            by_block_average[i][5] += by_block[i][ii][5] * ratio
            by_block_average[i][6] += by_block[i][ii][6] * ratio
        

    #in case groups are defined
    if len(req.pair_lengths) > 0:
        
        #properly store group indices in list of lists groups
        groups = []
        offsets = [0]
        for i in range(len(req.pair_lengths)):
            offsets.append(offsets[i] + req.pair_lengths[i])
            groups.append(req.pairs[offsets[i]:offsets[i+1]])

        for g in groups:
            #check if group indices are actually present in measurements
            g = list(g)
            for i in g:
                if not by_block_average.has_key(i):
                    g.remove(i)
                
            if len(g) > 1:
                ratio = 1.0 / sum(range(len(g)+1))
                rank = len(g)
                weighted_average = [0,0,0,0,0,0,0]
                index = 0
                for i in g:
                    weighted_average[0] += by_block_average[i][0] * rank
                    weighted_average[1] += by_block_average[i][1] * rank
                    weighted_average[2] += by_block_average[i][2] * rank
                    weighted_average[3] += by_block_average[i][3] * rank
                    weighted_average[4] += by_block_average[i][4] * rank
                    weighted_average[5] += by_block_average[i][5] * rank
                    weighted_average[6] += by_block_average[i][6] * rank
                    rank -= 1
                    if index > 0:
                        del by_block_average[i]
                    index += 1

                by_block_average[g[0]][0] = weighted_average[0] * ratio
                by_block_average[g[0]][1] = weighted_average[1] * ratio
                by_block_average[g[0]][2] = weighted_average[2] * ratio
                by_block_average[g[0]][3] = weighted_average[3] * ratio
                by_block_average[g[0]][4] = weighted_average[4] * ratio
                by_block_average[g[0]][5] = weighted_average[5] * ratio
                by_block_average[g[0]][6] = weighted_average[6] * ratio

    for i in by_block_average:
        res.tag_poses.extend(by_block_average[i])
        res.types.append(0 if i < 30 else (1 if i < 44 else (2 if i < 58 else 3)))
        res.ids.append(i)


    return res


def main():
    global tf_listener

    try:
        print colored("[deepbuilder] Sensing STARTUP", 'cyan')
        rospy.init_node("deepbuilder_sensing")
        tf_listener = tf.TransformListener(cache_time = rospy.Duration(5))


        srv_tags = rospy.Service('deepbuilder/sensing/get_tags',se_get_tags, get_tags)
        srv_collect = rospy.Service('deepbuilder/sensing/collect_state', se_collect_state, collect_state)
        rospy.Subscriber("/tag_detections", AprilTagDetectionArray, update_tags)

        rospy.spin()
    except KeyboardInterrupt:
        rospy.signal_shutdown("KeyboardInterrupt")
        raise

    except:
        raise

if __name__=="__main__":
    main()