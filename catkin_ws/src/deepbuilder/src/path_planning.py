#!/usr/bin/env python
import sys, rospy, moveit_commander, time, copy, math, json
from moveit_msgs.msg import *
from moveit_msgs.srv import *
from shape_msgs.msg import *
from geometry_msgs.msg import *
from deepbuilder.srv import *
from std_msgs.msg import *
from visualization_msgs.msg import Marker, MarkerArray
from tf2_msgs.msg import TFMessage
import settings

robot = {}
scene = {} # is continually filled with 
move_group = {}
arena = None
state_mesh = Mesh()
state_mesh_visualisation = None
compressed_mesh_visualisation = None
group_name = ''
marker_pub_env = rospy.Publisher('/deepbuilder/robot/state_mesh', Marker,queue_size=1)
marker_pub_comp = rospy.Publisher('/deepbuilder/robot/compressed_mesh', Marker,queue_size=1)
marker_pub_path = rospy.Publisher('/deepbuilder/robot/print_path', MarkerArray, queue_size=1)
srv_proxy_fk = rospy.ServiceProxy('/compute_fk', GetPositionFK)
srv_proxy_ik = rospy.ServiceProxy('/compute_ik', GetPositionIK)

class arena_objects():
    #planes must start with pln, they're just PoseStamped objects
    def __init__(self):
        #wall planes
        self.pln_handle_bar = PoseStamped()
        self.pln_handle_bar.pose.orientation.x = 0.5
        self.pln_handle_bar.pose.orientation.y = 0.5
        self.pln_handle_bar.pose.orientation.z = 0.5
        self.pln_handle_bar.pose.orientation.w = -0.5
        self.pln_handle_bar.pose.position.y = -1.146

        self.pln_ceiling = PoseStamped()
        self.pln_ceiling.pose.position.z = 1.4
        self.pln_ceiling.pose.orientation.y = 1.0

        self.pln_back = PoseStamped()
        self.pln_back.pose.position.y = 0.403
        self.pln_back.pose.orientation.x = 0.5
        self.pln_back.pose.orientation.y = 0.5
        self.pln_back.pose.orientation.z = -0.5
        self.pln_back.pose.orientation.w = 0.5

        self.pln_left = PoseStamped()
        self.pln_left.pose.position.x = 0.4925
        self.pln_left.pose.orientation.x = 0.5
        self.pln_left.pose.orientation.y = -0.5
        self.pln_left.pose.orientation.z = -0.5
        self.pln_left.pose.orientation.w = 0.5

        self.pln_right = PoseStamped()
        self.pln_right.pose.position.x = -0.4925
        self.pln_right.pose.orientation.x = 0.5
        self.pln_right.pose.orientation.y = 0.5
        self.pln_right.pose.orientation.z = 0.5
        self.pln_right.pose.orientation.w = 0.5

        #table box
        self.box_table = {}
        self.box_table["pose"] = PoseStamped()
        self.box_table["pose"].pose.position.x = 0.0
        self.box_table["pose"].pose.position.y = -0.447
        self.box_table["pose"].pose.position.z = -0.465
        self.box_table["pose"].pose.orientation.w = 1.0
        self.box_table["size"] = [0.795, 1.195, 0.93]

        self.box_heatplate = {}
        self.box_heatplate["pose"] = PoseStamped()
        self.box_heatplate["pose"].pose.position.x = 0.0
        self.box_heatplate["pose"].pose.position.y = -0.647
        self.box_heatplate["pose"].pose.position.z = 0.0
        self.box_heatplate["pose"].pose.orientation.w = 1.0
        self.box_heatplate["size"] = [0.22, 0.22, 0.001]

def tcp_marker(pose, ns, i, r, g, b):
    m_p = Marker()
    m_p.header.frame_id = '/world'
    m_p.header.stamp = rospy.Time.now()
    m_p.ns = ns
    m_p.id = i
    m_p.type=Marker.CUBE
    m_p.action = Marker.ADD
    m_p.pose.position.x = pose[0]
    m_p.pose.position.y = pose[1]
    m_p.pose.position.z = pose[2]
    m_p.scale.x = 0.0005
    m_p.scale.y = 0.001
    m_p.scale.z = 0.006
    m_p.pose.orientation.x = pose[3]
    m_p.pose.orientation.y = pose[4]
    m_p.pose.orientation.z = pose[5]
    m_p.pose.orientation.w = pose[6]
    m_p.color.a = 1.0    
    m_p.color.r = r
    m_p.color.g = g
    m_p.color.b = b
    return m_p


def partition_list(lst, partition_size=7):
    o_list = []
    for i in range(0, len(lst), partition_size):
        o_list.append(lst[i:i+partition_size])
    return o_list

def state_equals(state_a, state_b, tolerance = 0.001):
    for i, s in enumerate(state_a):
        if abs(s - state_b[i]) > tolerance:
            return False
    return True

def sync_scene(expected_collision_objects):
    global scene
    
    present_objects = scene.get_objects()
    synced = False

    while not synced:
        while len(present_objects) != len(expected_collision_objects):
            time.sleep(0.05)
            present_objects = scene.get_objects()
        synced = True
        for o in present_objects:
            if o not in expected_collision_objects:
                time.sleep(0.05)
                present_objects = scene.get_objects()
                synced = False
                break
    
def plan_cartesian(req):
    #maybe this?
    #global move_group
    global robot
    global scene
    global move_group
    global state_mesh
    global group_name
    res = ro_plan_cartesianResponse()  
    #remove any previous targets
    move_group.clear_pose_targets()
    robot_config = settings.ROBOT_CONFIG()
    
    
    way_points = partition_list(req.way_points)
    
    current_tcp = move_group.get_current_pose("extruder_tip_link").pose

    m_a = MarkerArray()

    m_a.markers.append(tcp_marker(
        [current_tcp.position.x, 
        current_tcp.position.y,
        current_tcp.position.z,
        current_tcp.orientation.x,
        current_tcp.orientation.y,
        current_tcp.orientation.z,
        current_tcp.orientation.w], 'current_tcp', 0, 1.0,0.0, 0.3))

    
    first_robot_state = copy.deepcopy(robot.get_current_state())
    first_robot_state.joint_state.position = req.first_way_point_joint_states

    last_robot_state = copy.deepcopy(robot.get_current_state())
    last_robot_state.joint_state.position = req.last_way_point_joint_states

    move_group.set_start_state(first_robot_state)
    
    mg_way_points = []
    i = 0
    for p in way_points:
        x = p[0] * 0.001
        y = p[1] * 0.001
        z = p[2] * 0.001
        m_a.markers.append(tcp_marker(            
            [x, y, z, p[3], p[4], p[5], p[6]],
            'print_path', i, float(i) / len(way_points), 1.0 - (float(i) / len(way_points)), 1.0))

        m_wp = copy.deepcopy(current_tcp)
        m_wp.position.x = x
        m_wp.position.y = y
        m_wp.position.z = z
        m_wp.orientation.x = p[3]
        m_wp.orientation.y = p[4]
        m_wp.orientation.z = p[5]
        m_wp.orientation.w = p[6]
        mg_way_points.append(m_wp)
        i += 1
    
    #fk_res = srv_proxy_fk.call(header = Header(), fk_link_names = ["extruder_tip_link"], robot_state = last_robot_state)
    #mg_way_points.append(fk_res.pose_stamped[0].pose)

    marker_pub_path.publish(m_a)


    
    
    #moveit_robot_state.joint_state = way_points[0]
    (moveit_trajectory, fraction) = move_group.compute_cartesian_path(mg_way_points, robot_config['eef_step'], robot_config['jump_threshold'])
    print "Cartesian motion planned to " + str(fraction*100.0) + "%"
    speed = robot_config['print_speed'] if req.speed == None else req.speed
    moveit_trajectory = move_group.retime_trajectory(robot.get_current_state(), moveit_trajectory, robot_config['print_speed'])

    m_t = Marker()
    m_t.ns = "motion-trajectory"
    m_t.id = 0
    m_t.header.frame_id = '/world'
    m_t.header.stamp = rospy.Time.now()
    m_t.type=Marker.POINTS
    m_t.action = Marker.ADD
    m_t.scale.x = 0.0005
    m_t.color.a = 1.0
    tmp_state = robot.get_current_state()
    for t in moveit_trajectory.joint_trajectory.points:
        #draw path points
        tmp_state.joint_state.position = t.positions
        fk_res = srv_proxy_fk.call(header=Header(), robot_state = tmp_state, fk_link_names = ["extruder_tip_link"])
        m_t.points.append(
            Point(
                x=fk_res.pose_stamped[0].pose.position.x,
                y=fk_res.pose_stamped[0].pose.position.y,
                z=fk_res.pose_stamped[0].pose.position.z))        

    m_a.markers.append(m_t)
    marker_pub_path.publish(m_a)      

    res.message = 'SUCCESS' if fraction == 1.0 else 'fraction: ' + str(fraction)
    res.motion_plan = moveit_trajectory.joint_trajectory
    res.collisions = []

    return res



def plan_path(req):
    global move_group
    global scene
    global arena
    global state_mesh
    global robot


    robot_config = settings.ROBOT_CONFIG()
    scene.remove_world_object() #clear scene, needs syncing later
    move_group.clear_pose_targets()

    #if req.state_pose is different from current robot pose, apply it to planning
    joint_state = robot.get_current_state().joint_state                

    if req.state_pose and len(req.state_pose) == 6 and not state_equals(joint_state.position, req.state_pose):
        joint_state.position = req.state_pose

    moveit_robot_state = RobotState()
    moveit_robot_state.joint_state = joint_state
    move_group.set_start_state(moveit_robot_state)

    print "Planning path for session [" + req.session + "] from\n" + str(joint_state.position) + " to\n" + str(req.goal_pose)
    print "Detected restricting collisions mask\n[self_collision, wall_collision, table_collision, state_collision, full_scene]"

    #default response
    res = ro_plan_pathResponse()
    res.collisions = [False, False, False, False, False]
    res.message = ''
    res.path = None

    #attempting to plan on empty scene, if this fails, it's due to self collision
    sync_scene('')
    res.path = move_group.plan(req.goal_pose).joint_trajectory
    if len(res.path.points) == 0:
        res.message += "self collision"
        res.collisions[0] = True
        res.collisions[4] = True #collision in full scene
        print str(res.collisions)
        time.sleep(0.2)
        return res

    #add walls to scene and replan
    expected_scene_objects = [] #needed for syncing
    for name in dir(arena):
        if name.startswith('pln'):
            obj = getattr(arena, name)
            obj.header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
            scene.add_plane(name, obj)
            expected_scene_objects.append(name)

    sync_scene(expected_scene_objects)
    res.path = move_group.plan(req.goal_pose).joint_trajectory
    if len(res.path.points) == 0:
        res.message += "wall collision, "
        res.collisions[1] = True
        res.collisions[4] = True #collision in full scene

    #clear scene, add table and replan
    scene.remove_world_object()
    expected_scene_objects = []
    for name in dir(arena):
        if name.startswith('box'):
            obj = getattr(arena, name)
            obj["pose"].header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
            scene.add_box(name, obj["pose"], obj["size"])
            expected_scene_objects.append(name)

    sync_scene(expected_scene_objects)
    res.path = move_group.plan(req.goal_pose).joint_trajectory
    if len(res.path.points) == 0:
        res.message += "table collision, "
        res.collisions[2] = True
        res.collisions[4] = True #collision in full scene

    # clear scene, add state mesh and replan
    scene.remove_world_object()
    expected_scene_objects = []
    if state_mesh and len(state_mesh.vertices) > 0 and len(state_mesh.triangles) > 0:
        mesh_pose = PoseStamped()
        mesh_pose.header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
        mesh_pose.header.stamp = rospy.Time.now()
        mesh_pose.pose.orientation.w = 1.0
        scene.add_mesh_custom('state_mesh', mesh_pose, state_mesh)     
        expected_scene_objects.append('state_mesh')   

        sync_scene(expected_scene_objects)
        res.path = move_group.plan(req.goal_pose).joint_trajectory
        if len(res.path.points) == 0:
            res.message += "state collision, "
            res.collisions[3] = True
            res.collisions[4] = True #collision in full scene

    #if collisions were found in either of them, return 
    if res.collisions[4]:
        print str(res.collisions)
        time.sleep(0.2)
        return res

    #if no previous collisions in seperated objects, add planes and boxes back to scene and retry
    for name in dir(arena):
        if name.startswith('pln'):
            obj = getattr(arena, name)
            obj.header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
            scene.add_plane(name, obj)
            expected_scene_objects.append(name)
        elif name.startswith('box'):
            obj = getattr(arena, name)
            obj["pose"].header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
            scene.add_box(name, obj["pose"], obj["size"])
            expected_scene_objects.append(name)

    sync_scene(expected_scene_objects)
    traj = move_group.plan(req.goal_pose)

    if len(traj.joint_trajectory.points) == 0:
            res.message += "combination collision, "
            res.collisions[4] = True #collision in full scene
            print str(res.collisions)
            time.sleep(0.2)
            return res

    speed = robot_config['jogging_speed'] if req.speed == None else req.speed
    traj = move_group.retime_trajectory(ref_state_in = robot.get_current_state(), traj_in = traj, velocity_scaling_factor = speed)
    res.path = traj.joint_trajectory
    res.message = "SUCCESS"
    print str(res.collisions)
    time.sleep(0.2)
    return res

    ## END_SUB_TUTORIAL

def update_state_mesh(req):
    global state_mesh
    global state_mesh_visualisation
    res = ro_update_state_meshResponse()
    try:
        state_mesh = Mesh() #mesh for collision checking and planning
        
        state_mesh_visualisation = Marker() #only rviz visualisation mesh
        state_mesh_visualisation.header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
        state_mesh_visualisation.header.stamp = rospy.Time.now()
        state_mesh_visualisation.ns = 'state_mesh-' + req.session
        state_mesh_visualisation.id = 1
        state_mesh_visualisation.type = Marker.TRIANGLE_LIST if len(req.vertices) > 0 else Marker.POINTS
        state_mesh_visualisation.action = Marker.ADD
        state_mesh_visualisation.pose.orientation.w = 1.0
        state_mesh_visualisation.scale.x = 1.0
        state_mesh_visualisation.scale.y = 1.0
        state_mesh_visualisation.scale.z = 1.0

        state_mesh_visualisation.color.r = 0.8
        state_mesh_visualisation.color.g = 0.3
        state_mesh_visualisation.color.b = 0.3
        state_mesh_visualisation.color.a = 1.0 if len(req.vertices) > 0 else 0.0
        state_mesh_visualisation.lifetime = rospy.Duration()

        if len(req.vertices) == 0:
            state_mesh_visualisation.points.append(Point())
            res.message = "[path_planning] State mesh succefully reset"
        else:
            for i in range(len(req.vertices)/3):
                p = Point()
                p.x = req.vertices[i*3]*0.001 #bc mm vs m
                p.y = req.vertices[i*3+1]*0.001
                p.z = req.vertices[i*3+2]*0.001
                state_mesh.vertices.append(p)

            for i in range(len(req.indices)/3):
                f = MeshTriangle()         
                f.vertex_indices[0] = req.indices[i*3]
                f.vertex_indices[1] = req.indices[i*3+1]
                f.vertex_indices[2] = req.indices[i*3+2]
                state_mesh.triangles.append(f)

                state_mesh_visualisation.points.append(state_mesh.vertices[f.vertex_indices[0]])
                state_mesh_visualisation.points.append(state_mesh.vertices[f.vertex_indices[1]])
                state_mesh_visualisation.points.append(state_mesh.vertices[f.vertex_indices[2]])

            res.message = "[path_planning] State mesh successfully updated"



    except KeyboardInterrupt:
        raise
    
    except:
        res.message = "[path_planning ERROR] State mesh could not be updated:\n" + str(sys.exc_info()[0]) + "\n" + str(sys.exc_info()[1])
    
    return res
    

def update_compressed_mesh(req):
    global compressed_mesh_visualisation
    res = ro_update_compressed_meshResponse()
    try:
        compressed_mesh_visualisation = Marker() #only rviz visualisation mesh
        compressed_mesh_visualisation.header.frame_id = settings.BASE_FRAME_ID_KINEMATICS
        compressed_mesh_visualisation.header.stamp = rospy.Time.now()
        compressed_mesh_visualisation.ns = 'compressed_mesh-' + req.session
        compressed_mesh_visualisation.id = 1
        compressed_mesh_visualisation.type = Marker.TRIANGLE_LIST if len(req.vertices) > 0 else Marker.POINTS
        compressed_mesh_visualisation.action = Marker.ADD
        compressed_mesh_visualisation.pose.orientation.w = 1.0
        compressed_mesh_visualisation.scale.x = 1.0
        compressed_mesh_visualisation.scale.y = 1.0
        compressed_mesh_visualisation.scale.z = 1.0

        compressed_mesh_visualisation.color.r = 0.4
        compressed_mesh_visualisation.color.g = 0.3
        compressed_mesh_visualisation.color.b = 0.8
        compressed_mesh_visualisation.color.a = 0.6 if len(req.vertices) > 0 else 0.0
        compressed_mesh_visualisation.lifetime = rospy.Duration()

        if len(req.vertices) == 0:
            compressed_mesh_visualisation.points.append(Point())
            res.message = "[path_planning] Compressed mesh succefully updated"
        else:
            for i in req.indices:
                compressed_mesh_visualisation.points.append(Point(req.vertices[3 * i] * 0.001, req.vertices[3 * i + 1] * 0.001, req.vertices[3 * i + 2] * 0.001))

            res.message = "[path_planning] Compressed mesh successfully updated"


    except KeyboardInterrupt:
        raise
    
    except:
        res.message = "[path_planning ERROR] Compressed mesh could not be updated:\n" + str(sys.exc_info()[0]) + "\n" + str(sys.exc_info()[1])
    
    return res
    

def draw_state_mesh(data):
    if state_mesh_visualisation:
        marker_pub_env.publish(state_mesh_visualisation)
    if compressed_mesh_visualisation:
        marker_pub_comp.publish(compressed_mesh_visualisation)
    rospy.sleep(rospy.Duration(0.05))

def main():
    global robot
    global scene
    global arena
    global state
    global move_group
    global group_name
    
    arena = arena_objects()

    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('deepbuilder_path_planning', anonymous=True)

    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()

    group_name = "ur10_deepbuilder_pg"
    move_group = moveit_commander.MoveGroupCommander(group_name)

    rospy.sleep(2)

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
    
    
    srv_plan = rospy.Service('/deepbuilder/robot/plan_path',ro_plan_path, plan_path)
    srv_motion = rospy.Service('deepbuilder/robot/plan_cartesian', ro_plan_cartesian, plan_cartesian)
    srv_up_msh = rospy.Service('/deepbuilder/robot/update_state_mesh', ro_update_state_mesh, update_state_mesh)
    srv_up_c_msh = rospy.Service('/deepbuilder/robot/update_compressed_mesh', ro_update_compressed_mesh, update_compressed_mesh)

    rospy.Subscriber("/tf", TFMessage, draw_state_mesh)

    print "You can start planning via ROS service requests now"

    r = rospy.Rate(2)
    while not rospy.is_shutdown():
        r.sleep()
    #rospy.spin()

    moveit_commander.roscpp_shutdown()

if __name__ == '__main__': main()