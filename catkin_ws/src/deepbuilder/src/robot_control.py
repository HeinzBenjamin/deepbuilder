#!/usr/bin/env python

# offers all robot controls necessary in deepbuilder project
# also works with simulated robot for learning
import rospy, actionlib, time, copy
from control_msgs.msg import *
from sensor_msgs.msg import *
from visualization_msgs.msg import *
from tf2_msgs.msg import TFMessage
from termcolor import colored
from deepbuilder.srv import *
import path_planning as pp
import settings
import extruder_control as ex

client = None
env_ma = MarkerArray()
env_marker_pub = rospy.Publisher('/deepbuilder/robot/environment', MarkerArray ,queue_size=5)
srv_proxy_path = rospy.ServiceProxy('/deepbuilder/robot/plan_path', ro_plan_path)
srv_proxy_cartesian = rospy.ServiceProxy('/deepbuilder/robot/plan_cartesian', ro_plan_cartesian)
srv_proxy_tcread = rospy.ServiceProxy('/deepbuilder/twincat/read', tc_read)
srv_proxy_tcwrite = rospy.ServiceProxy('/deepbuilder/twincat/write', tc_write)
srv_proxy_change_motor_speed = rospy.ServiceProxy('/deepbuilder/extruder/change_motor_speed', ex_change_motor_speed)
srv_proxy_reset_motor = rospy.ServiceProxy('/deepbuilder/extruder/reset_motor', ex_reset_motor)
srv_proxy_start_motor = rospy.ServiceProxy('/deepbuilder/extruder/start_motor', ex_start_motor)
srv_proxy_change_temp = rospy.ServiceProxy('/deepbuilder/extruder/change_temp', ex_change_temp)


def make_env_markers():
    env_markers = []
    arena = pp.arena_objects()
    for name in dir(arena):
        if name.startswith('pln'):
            obj = getattr(arena, name)

            marker = Marker()
            marker.header.frame_id=settings.BASE_FRAME_ID_KINEMATICS
            marker.header.stamp = rospy.Time.now()
            marker.ns = name
            marker.id = 0
            marker.type = Marker.CUBE
            marker.action = Marker.ADD
            marker.pose = obj.pose
            marker.scale.x = 0.1
            marker.scale.y = 0.1
            marker.scale.z = 0.001
            marker.color.r = 0.3
            marker.color.g = 0.3
            marker.color.b = 0.3
            marker.color.a = 1.0
            marker.lifetime = rospy.Duration()

            env_markers.append(marker)

        elif name.startswith('box'):
            obj = getattr(arena, name)

            marker = Marker()
            marker.header.frame_id=settings.BASE_FRAME_ID_KINEMATICS
            marker.header.stamp = rospy.Time.now()
            marker.ns = name
            marker.id = 0
            marker.type = Marker.CUBE
            marker.action = Marker.ADD
            marker.pose = obj['pose'].pose
            marker.scale.x = obj['size'][0]
            marker.scale.y = obj['size'][1]
            marker.scale.z = obj['size'][2]
            marker.color.r = 0.2
            marker.color.g = 0.2
            marker.color.b = 0.2
            marker.color.a = 0.8
            marker.lifetime = rospy.Duration()
            env_markers.append(marker)

    return env_markers



#draw everything belonging to environment into the rviz canvas
def draw_environment(data):
    global env_marker_pub
    global env_ma
    env_marker_pub.publish(env_ma)

def move_home(req):
    print "Moving home..."
    reqq = ro_move_pointRequest()
    reqq.goal_pose = settings.HOME_POSE
    reqq.speed = req.speed
    reqq.wait = req.wait
    res = ro_move_homeResponse()
    res.message = move_point(reqq).message
    return res

def move_point(req):
    print "Moving to point..."
    res = ro_move_pointResponse()
    pp_req = ro_plan_pathRequest()
    pp_req.goal_pose = req.goal_pose
    pp_req.speed=req.speed
    pp_req.session = "move_point"    
    pp_res = srv_proxy_path.call(pp_req)
    if pp_res.message != "SUCCESS":
        msg = "No path found: " + res.message
        print colored(msg, 'red')
        res.message = msg
        return res

    mo_req = ro_move_pathRequest()    
    mo_req.path = pp_res.path
    mo_req.wait = req.wait

    res.message = move_path(mo_req).message
    return res

DISABLE_USER_QUERY_MOVE = True #dangerous!! needs to be explicitly set to true before every call

def move_path(req):
    global DISABLE_USER_QUERY_MOVE
    global client
    res = ro_move_pathResponse()
    try:
        if not DISABLE_USER_QUERY_MOVE:
            inp = raw_input("Move path on robot?[y,n]")
        if DISABLE_USER_QUERY_MOVE or inp == 'y':
            joint_states = rospy.wait_for_message("joint_states", JointState).position
            if not pp.state_equals(copy.deepcopy(joint_states), copy.deepcopy(req.path.points[0].positions), tolerance = 0.05):
                inp = raw_input("move_path: first path point diverges a lot from current robot state.\npath[0]  : "+str(req.path.points[0].positions)+"\nstate now: "+str(joint_states)+"\nStill continue? [y/n]: ")
                if inp != 'y':
                    res.message = 'User interrupt'
                    return res
            if pp.state_equals(copy.deepcopy(joint_states), copy.deepcopy(req.path.points[-1].positions), tolerance = 0.01):
                inp = raw_input("move_path: robot is already in in final position of path.\npath[0]  : "+str(req.path.points[-1].positions)+"\nstate now: "+str(joint_states)+"\nStill continue? [y/n]: ")
                if inp != 'y':
                    res.message = 'User interrupt'
                    return res
            traj = FollowJointTrajectoryGoal()
            traj.trajectory = req.path
            client.send_goal(traj)
            if req.wait:
                client.wait_for_result()
            res.message = 'SUCCESS'
        else:
            res.message = 'User interrupt'
    except Exception as e:
        msg = "Couldn't move along path: " + e.message
        res.message = msg
        print colored(msg, 'red')  

    DISABLE_MOVE_USER_QUERY = True      
    return res

def print_path(req):
    global DISABLE_USER_QUERY_MOVE
    print colored("[print_path] Received print request. Start motion planning...", 'cyan')
    res = ro_print_pathResponse()
    robot_config = settings.ROBOT_CONFIG()

    first_way_points_in_layer = pp.partition_list(req.first_way_point_joint_states,partition_size=6)
    last_way_points_in_layer = pp.partition_list(req.last_way_point_joint_states,partition_size=6)
    way_point_layers = []
    
    top = 0
    for w in req.num_way_points:
        _from = top
        _to = w * 7 + top
        layer = req.way_points_cartesian[_from:_to]
        top += w * 7
        way_point_layers.append(layer)

    num_layers = len(way_point_layers)


    
    tol = 0.1 #threshold for which joint state transitions btw action and first and last way points are considered safe and free of axis flips
    if not pp.state_equals(req.action, req.first_way_point_joint_states, tolerance = tol) or not pp.state_equals(req.action, req.last_way_point_joint_states, tolerance = tol):
        _in = raw_input("Joint states of action, first way point and last way point diverge a lot. Double check for correct axis toggles. Continue?[y/n]")
        if _in != 'y':
            res.message = "User interrupt"
            return res
    
    #plan path from current to action
    current_to_action = srv_proxy_path.call(goal_pose = req.action, session = "print_planning")
    if current_to_action.message != 'SUCCESS' or not pp.state_equals(req.action, current_to_action.path.points[-1].positions, tolerance = 0.005):
        res.message = "Couldn't move from current state to action: " + (current_to_action.message if current_to_action.message != 'SUCCESS' else "Final state deviates too far")
        return res

    action_to_firsts = []
    print_paths = []
    last_to_actions = []

    #everything layer specific
    for i in range(num_layers):
        #plan path from action to first way point
        first_way_point_joint_states = first_way_points_in_layer[i]
        last_way_point_joint_states = last_way_points_in_layer[i]
        way_points_cartesian = way_point_layers[i]


        action_to_first = srv_proxy_path.call(state_pose = req.action, goal_pose = first_way_point_joint_states, session = "print_planning")
        if action_to_first.message != 'SUCCESS' or not pp.state_equals(req.action, action_to_first.path.points[0].positions, tolerance = 0.005):
            res.message = "Layer "+str(i)+": Couldn't move to from action to first way point: " + (action_to_first.message if action_to_first.message != 'SUCCESS' else "Jump between last path segment and this one")
            return res
        action_to_firsts.append(copy.deepcopy(action_to_first))

        #plan cartesian print path
        print_path = srv_proxy_cartesian.call(
                        first_way_point_joint_states = first_way_point_joint_states,
                        last_way_point_joint_states = last_way_point_joint_states,
                        way_points = way_points_cartesian)

        if print_path.message != "SUCCESS" or not pp.state_equals(print_path.motion_plan.points[0].positions, action_to_first.path.points[-1].positions, tolerance = 0.005):
            res.message = "Layer "+str(i)+": Couldn't find cartesian print path: " + (print_path.message if print_path.message != "SUCCESS" else "Jump between last path segment and this one")
            return res
        print_paths.append(copy.deepcopy(print_path))

        #plan from last way point back to action
        last_to_action = srv_proxy_path.call(state_pose = last_way_point_joint_states, goal_pose = req.action, session = "print_planning")
        if last_to_action.message != 'SUCCESS' or not pp.state_equals(last_to_action.path.points[0].positions, print_path.motion_plan.points[-1].positions, tolerance = 0.005):
            res.message = "Layer "+str(i)+": Couldn't move to from last way point to action: " + (last_to_action.message if last_to_action.message != "SUCCESS" else "Jump between last path segment and this one")
            return res
        last_to_actions.append(copy.deepcopy(last_to_action))

    #plan from action back to current
    action_to_current = srv_proxy_path.call(state_pose = req.action, goal_pose = current_to_action.path.points[0].positions, session = "print_planning")
    if action_to_current.message != 'SUCCESS' or not pp.state_equals(action_to_current.path.points[0].positions, last_to_action.path.points[-1].positions, tolerance = 0.005):
        res.message = "Layer "+str(i)+": Couldn't move from action to current: " + (action_to_current.message if action_to_current.message != "SUCCESS" else "Jump between last path segment and this one")
        return res


    
    print colored("[print_path] ...Motion planning success.", 'cyan')
    total_time = current_to_action.path.points[-1].time_from_start
    for i in range(num_layers):
        total_time += action_to_firsts[i].path.points[-1].time_from_start \
            + print_paths[i].motion_plan.points[-1].time_from_start \
            + last_to_actions[i].path.points[-1].time_from_start
    
    total_time += action_to_current.path.points[-1].time_from_start

    _in = raw_input("[print_path] Double check print path! It will take " + str(total_time / 1000000000) + " secs to finish. Start?[y/n]")[0]
    if _in == 'n':
        res.message +=". User interrupt"
        return res
    

    mo_req = ro_move_pathRequest()
    mo_req.wait = True

    #move to action
    DISABLE_USER_QUERY_MOVE = True
    mo_req.path = current_to_action.path
    mo_res = move_path(mo_req)
   
    #set motor to ready set via reset and start
    srv_proxy_reset_motor.call()
    srv_proxy_start_motor.call()

    #start heating nozzle, wait for it to reach temp
    srv_proxy_change_temp.call(value = robot_config['print_temp'], wait = True) 

    #speed up motor, wait a bit
    srv_proxy_change_motor_speed.call(value = robot_config["print_override"] / 3)
    time.sleep(5.0)
    srv_proxy_change_motor_speed.call(value = robot_config["print_override"] * 2 / 3)
    time.sleep(5.0)
    srv_proxy_change_motor_speed.call(value = robot_config["print_override"])
    
    _in = raw_input("Check good material flow press Enter")
    srv_proxy_change_motor_speed.call(value = 0.0)
    _in = raw_input("Press Enter to start print")
    
    for i in range(num_layers):
        try:
            robot_config = settings.ROBOT_CONFIG()           
            srv_proxy_change_temp.call(value = robot_config['print_temp'], wait = True)
            #move to layer start
            print colored("[print_path] Printing layer " + str(i) + " of " + str(num_layers), 'cyan')
            DISABLE_USER_QUERY_MOVE = True
            mo_req.path = action_to_firsts[i].path
            mo_res = move_path(mo_req)

            #speed up motor and wait a bit
            srv_proxy_change_motor_speed.call(value = robot_config["print_override"])
            time.sleep(1)
            #move along print path
            DISABLE_USER_QUERY_MOVE = True
            mo_req.path = print_paths[i].motion_plan    
            mo_res = move_path(mo_req)

            #slow motor down again and wait a bit
            srv_proxy_change_motor_speed.call(value = robot_config["default_override"])
            time.sleep(1)        

            #move to action
            DISABLE_USER_QUERY_MOVE = True
            mo_req.path = last_to_actions[i].path
            mo_res = move_path(mo_req)

        except KeyboardInterrupt:
            _in = raw_input("[print_path] Keyboard interrupt. Continue print?[y/n]")
            if _in == 'y':
                pass
            else:
                res.message = "User interrupt"
                return res

    #start cooling down
    srv_proxy_change_temp.call(value = robot_config['default_temp'], wait = False)

    #move back home
    DISABLE_USER_QUERY_MOVE = True
    mo_req.path = action_to_current.path
    mo_res = move_path(mo_req)

    move_path_msg = mo_res.message
    print colored("[print_path] ...Move path result: " + move_path_msg, 'cyan')
    res.message += ". move path msg: " + move_path_msg
    
    return res

def main():
    global client
    global table_marker_pub
    global table_marker
    global env_ma

    try:
        print colored("[deepbuilder] Robot Control STARTUP", 'cyan')
        rospy.init_node("deepbuilder_robot_control")
        client = actionlib.SimpleActionClient('follow_joint_trajectory', FollowJointTrajectoryAction)
        print colored("[deepbuilder] Waiting for Joint trajectory server....", 'cyan')
        client.wait_for_server()
        print colored("[deepbuilder] Found Joint Trajectory Server", 'cyan')

        #ascending in complexity. instructions of each service are a super set of its predecessor
        srv_home = rospy.Service('deepbuilder/robot/move_home',ro_move_home, move_home)
        srv_point = rospy.Service('deepbuilder/robot/move_point', ro_move_point, move_point)
        srv_path = rospy.Service('deepbuilder/robot/move_path', ro_move_path, move_path)
        srv_print = rospy.Service('deepbuilder/robot/print_path', ro_print_path, print_path)
        
        env_ma.markers.extend(make_env_markers())

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