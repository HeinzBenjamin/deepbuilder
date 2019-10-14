#!/usr/bin/env python
import sys, copy, rospy, moveit_commander
import moveit_msgs.msg
import robot_control as rc
from geometry_msgs.msg import *
from std_msgs.msg import *
from deepbuilder.srv import *
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
import settings

robot = {}
scene = {}
move_group = {}
display_trajectory_publisher = {}


class scene_objects():
    #planes must start with pln, they're just PoseStamped objects
    pln_floor = PoseStamped()
    pln_floor.pose.orientation.w = 1.0

    pln_handle_bar = PoseStamped()
    pln_handle_bar.pose.orientation.x = 0.5
    pln_handle_bar.pose.orientation.y = 0.5
    pln_handle_bar.pose.orientation.z = 0.5
    pln_handle_bar.pose.orientation.w = -0.5
    pln_handle_bar.pose.position.y = -1.046

    pln_ceiling = PoseStamped()
    pln_ceiling.pose.position.z = 1.4
    pln_ceiling.pose.orientation.y = 1.0

    pln_back = PoseStamped()
    pln_back.pose.position.y = 0.403
    pln_back.pose.orientation.x = 0.5
    pln_back.pose.orientation.y = 0.5
    pln_back.pose.orientation.z = -0.5
    pln_back.pose.orientation.w = 0.5

    pln_left = PoseStamped()
    pln_left.pose.position.x = 0.4925
    pln_left.pose.orientation.x = 0.5
    pln_left.pose.orientation.y = -0.5
    pln_left.pose.orientation.z = -0.5
    pln_left.pose.orientation.w = 0.5

    pln_right = PoseStamped()
    pln_right.pose.position.x = -0.4925
    pln_right.pose.orientation.x = 0.5
    pln_right.pose.orientation.y = 0.5
    pln_right.pose.orientation.z = 0.5
    pln_right.pose.orientation.w = 0.5


    #boxes must start with box, it's a dict of pose and size
    box_source = {}
    box_source["pose"] = PoseStamped()
    box_source["pose"].pose.position.x = -0.32
    box_source["pose"].pose.position.y = 0.32
    box_source["pose"].pose.position.z = 0.3
    box_source["pose"].pose.orientation.w = 1.0
    box_source["size"] = [0.16, 0.12, 0.6]


def move_home_moveit(req):
    print "Moving home moveit..."
    reqq = ro_move_pointRequest()
    reqq.goal = settings.HOME_POSE
    reqq.speed = req.speed
    return str(move_point_moveit(reqq))

def move_point_moveit(req):
    print "Moving to point moveit..."
    reqq = ro_check_pathRequest()
    reqq.goal = req.goal
    res = plan_path(reqq)
    if res.message != "SUCCESS":
        print res
        return res
    reqqq = ro_move_pathRequest()
    
    ppath = []
    for i in res.path.points:
        ppath.extend(i.positions)
    reqqq.speed = req.speed
    reqqq.path = ppath
    p = rospy.ServiceProxy('deepbuilder/robot/move_path', ro_move_path)
    return p(reqqq)


def plan_path(req):
    global move_group
    res = ro_check_pathResponse()

    move_group.clear_pose_targets()

    # We want the Cartesian path to be interpolated at a resolution of 1 cm
    # which is why we will specify 0.01 as the eef_step in Cartesian
    # translation.  We will disable the jump threshold by setting it to 0.0 disabling:
    plan = move_group.plan(req.goal)
    if len(req.state) > 0 and req.session_name!='':
        draw_learner_state(req.state, req.session_name)

    # Note: We are just planning, not asking move_group to actually move the robot yet:
    res.path = plan.joint_trajectory
    res.message = "SUCCESS" if len(plan.joint_trajectory.points) > 0 else "INVALID"
    return res

    ## END_SUB_TUTORIAL
marker_pub_state=rospy.Publisher('/deepbuilder/robot/learner_state_array', MarkerArray, queue_size=1)

def draw_learner_state(state, session_name):
    marker_array = MarkerArray()
    resolution=12
    minX = 0.373
    maxX = -0.378
    minY = -1.0215
    maxY = -0.2755
    m = Marker()
    m.type = Marker.POINTS
    m.action = Marker.ADD
    m.header.frame_id = "/base"
    m.header.stamp = rospy.Time.now()
    m.ns = session_name
    m.id=0
    m.pose.orientation.w=1.0
    m.scale.x=0.01
    m.scale.y=0.01
    m.scale.z=0.01
    m.lifetime=rospy.Duration()

    i = 0
    for iterY in range(resolution):
        for iterX in range(resolution):
            p = Point()
            p.x = minX + ((maxX - minX) * (float(iterX) / float(resolution - 1)))
            p.y = minY + ((maxY - minY) * (float(iterY) / float(resolution - 1)))
            p.z = state[i]
            c = ColorRGBA()
            c.r = 0.4 * float(iterX) / float(resolution)
            c.g = 0.8 * float(iterY) / float(resolution)
            c.b = 0.4
            c.a = 1.0
            m.points.append(p)
            m.colors.append(c)
            i+=1

    marker_array.markers.append(m)
    marker_pub_state.publish(marker_array)

def display_trajectory(plan, speed_factor):
    # Copy class variables to local variables to make the web tutorials more clear.
    # In practice, you should use the class variables directly unless you have a good
    # reason not to.
    global robot
    global display_trajectory_publisher

    ## BEGIN_SUB_TUTORIAL display_trajectory
    ##
    ## Displaying a Trajectory
    ## ^^^^^^^^^^^^^^^^^^^^^^^
    ## You can ask RViz to visualize a plan (aka trajectory) for you. But the
    ## group.plan() method does this automatically so this is not that useful
    ## here (it just displays the same trajectory again):
    ##
    ## A `DisplayTrajectory`_ msg has two primary fields, trajectory_start and trajectory.
    ## We populate the trajectory_start with our current robot state to copy over
    ## any AttachedCollisionObjects and add our plan to the trajectory.
    display_trajectory = moveit_msgs.msg.DisplayTrajectory()
    display_trajectory.trajectory_start = robot.get_current_state()
    display_trajectory.trajectory.append(plan)
    #for i in range(len(display_trajectory.trajectory.joint_trajectory.points)):
    #    display_trajectory.trajectory.joint_trajectory.points[i].time_from_start *= speed_factor
    # Publish
    display_trajectory_publisher.publish(display_trajectory)

    ## END_SUB_TUTORIAL

def main():
    global robot
    global scene
    global move_group
    global display_trajectory_publisher

    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('db_path_planning', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()

    group_name = "ur10_deepbuilder_pg"
    move_group = moveit_commander.MoveGroupCommander(group_name)


    display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path_speed',
                                                   moveit_msgs.msg.DisplayTrajectory,
                                                   queue_size=20)

    rospy.sleep(2)

    for name in dir(scene_objects):
        if name.startswith('pln'):
            print("Adding collision plane to scene: " + name)
            obj = getattr(scene_objects, name)
            obj.header.frame_id = 'base'
            scene.add_plane(name, obj)
            scene.add_box('box_'+name, obj, [0.2,0.2,0.005])

        elif name.startswith('box'):
            print("Adding collision box to scene: " + name)
            obj = getattr(scene_objects, name)
            obj["pose"].header.frame_id = 'base'

            scene.add_box(name, obj["pose"], obj["size"])

        rospy.sleep(0.1)


    planning_frame = move_group.get_planning_frame()
    print "============ Reference frame: %s" % planning_frame

    # We can also print the name of the end-effector link for this group:
    eef_link = move_group.get_end_effector_link()
    print "============ End effector: %s" % eef_link

    # We can get a list of all the groups in the robot:
    group_names = robot.get_group_names()
    print "============ Robot Groups:", robot.get_group_names()
    if group_names[0] != "ur10_deepbuilder_pg":
        rospy.logerr("Path planner: Incorrect group names. Bye!")
        return

    # Sometimes for debugging it is useful to print the entire state of the
    # robot:
    print "============ Robot axis values"
    print robot.get_current_state().joint_state.position
    
    
    srv_home = rospy.Service('/deepbuilder/robot/check_path',ro_check_path, plan_path)
    srv_home = rospy.Service('deepbuilder/robot/move_home_moveit',ro_move_home, move_home_moveit)
    srv_pt_mv = rospy.Service('deepbuilder/robot/move_to_point_moveit', ro_move_point, move_point_moveit) 
    rospy.spin()

if __name__ == '__main__': main()
