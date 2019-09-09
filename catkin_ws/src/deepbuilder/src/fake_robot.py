#!/usr/bin/env python
import sys, rospy, tf
from tf2_msgs.msg import TFMessage
from sensor_msgs.msg import JointState
from std_msgs.msg import Header


br = tf.TransformBroadcaster()
pub = rospy.Publisher('joint_states', JointState, queue_size=10)
js = JointState()

def main():
    rospy.init_node("db_fake_robot")
    rate = rospy.Rate(100.0)

    js.name = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
    js.position = [1.129921793937683, -1.7568967978106897, 0.8724079132080078, -0.68549091020693, -1.5725930372821253, -0.42765790620912725]
    js.velocity = [0.0, 0.0, -0.0, 0.0, 0.0, 0.0]
    js.effort = [-0.7598877549171448, -1.6479493379592896, -2.654303789138794, -0.3297272026538849, 0.1256103664636612, -0.004486084450036287]

    while not rospy.is_shutdown():
        js.header = Header()
        js.header.stamp = rospy.Time.now()
        pub.publish(js)

        '''
        for t in h.transforms:
            br.sendTransform(
                t["position"],
                t["orientation"],
                rospy.Time.now(),
                t["frame_id"],
                t["child_frame_id"]
            )
        '''

        rate.sleep()

if __name__ == '__main__': main()


#some transforms, not needed currently
'''
transforms = []
transforms.append({})
transforms[-1]["frame_id"]="world"
transforms[-1]["child_frame_id"]="base_link"
transforms[-1]["position"] = [0.0, 0.0, 0.0]
transforms[-1]["orientation"] = [0.0, 0.0, 0.0, 1.0]

transforms = []
transforms.append({})
transforms[-1]["frame_id"]="base_link"
transforms[-1]["child_frame_id"]="base"
transforms[-1]["position"] = [0.0, 0.0, 0.0]
transforms[-1]["orientation"] = [0.0, 0.0, 1.0, 1.0]

transforms = []
transforms.append({})
transforms[-1]["frame_id"]="base"
transforms[-1]["child_frame_id"]="tool0_controller"
transforms[-1]["position"] = [-0.00121933365401, -0.399733057427, 0.869069532322]
transforms[-1]["orientation"] = [-4.61871787428e-06, 0.999999966733, -1.87302878345e-05, 0.000257220625721]

transforms.append({})
transforms[-1]["frame_id"]="shoulder_link"
transforms[-1]["child_frame_id"]="upper_arm_link"
transforms[-1]["position"] = [0.0, 0.220941, 0.0]
transforms[-1]["orientation"] = [ 0.0, -0.0928979753283, 0.0, 0.995675633015]

transforms.append({})
transforms[-1]["frame_id"]="base_link"
transforms[-1]["child_frame_id"]="shoulder_link"
transforms[-1]["position"] = [0.0, 0.0, 0.1273]
transforms[-1]["orientation"] = [ 0.0, 0.0, 0.535397993021, 0.844599898809]

transforms.append({})
transforms[-1]["frame_id"]="upper_arm_link"
transforms[-1]["child_frame_id"]="forearm_link"
transforms[-1]["position"] = [0.0, -0.1719, 0.612]
transforms[-1]["orientation"] = [ 0.0, 0.422507330191, 0.0, 0.906359507003]

transforms.append({})
transforms[-1]["frame_id"]="forearm_link"
transforms[-1]["child_frame_id"]="wrist_1_link"
transforms[-1]["position"] = [0.0, 0.0, 0.5723]
transforms[-1]["orientation"] = [ 0.0, 0.428332404418, 0.0, 0.90362124329]

transforms.append({})
transforms[-1]["frame_id"]="wrist_1_link"
transforms[-1]["child_frame_id"]="wrist_2_link"
transforms[-1]["position"] = [0.0, 0.1149, 0.0]
transforms[-1]["orientation"] = [ 0.0, 0.0, -0.707745939738, 0.706467044373]

transforms.append({})
transforms[-1]["frame_id"]="wrist_2_link"
transforms[-1]["child_frame_id"]="wrist_3_link"
transforms[-1]["position"] = [0.0, 0.0, 0.1157]
transforms[-1]["orientation"] = [ 0.0, -0.212203197102, 0.0, 0.977225564105]
'''