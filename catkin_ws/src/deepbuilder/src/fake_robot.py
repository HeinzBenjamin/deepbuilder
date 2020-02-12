#!/usr/bin/env python
import sys, rospy, tf
from tf2_msgs.msg import TFMessage
from sensor_msgs.msg import JointState
from std_msgs.msg import Header
import settings
import robot_control

br = tf.TransformBroadcaster()
pub = rospy.Publisher('joint_states', JointState, queue_size=10)
js = JointState()

def main():
    rospy.init_node("db_fake_robot")
    rate = rospy.Rate(100.0)

    js.name = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']
    js.position = settings.HOME_POSE
    js.velocity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    js.effort = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    robot_control.make_table_marker()
    rospy.Subscriber("/tf", TFMessage, robot_control.draw_environment)

    while not rospy.is_shutdown():
        js.header = Header()
        js.header.stamp = rospy.Time.now()
        pub.publish(js)
        rate.sleep()

if __name__ == '__main__': main()
