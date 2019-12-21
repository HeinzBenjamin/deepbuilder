---- Nothing yet to see here ----

Network addresses
Windows Rhino Client: 192.168.137.1 (also acting as WAN)
ROS Master Ubuntu 16.04: 192.168.0.101
ROS Client Jetson TX1: 192.168.0.200
UR10 Robot: 192.168.0.10

ROS_MASTER_URI: http://192.168.0.101:11311

Start up:

Robotic block stacking:
ROS Master:
    roslaunch ur_modern_driver ur10_bringup.launch
    roslaunch deepbuilder full.launch
Jetson (ssh):
    roslaunch realsense_camera rs_camera.launch
