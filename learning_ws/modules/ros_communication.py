import roslibpy, time, math
from . import settings
#HOME_POSE = [1.1334346532821655,-1.7553976217852991,0.8690872192382812,-0.6843889395343226,-1.5728209654437464,-0.424158]

class Connection():
    def __init__(self):
        self.client = roslibpy.Ros(host='localhost', port=9090)
        self.client.run()
        self.srv_status = roslibpy.Service(self.client, '/rosout/get_loggers', 'roscpp/GetLoggers')
        self.srv_path = roslibpy.Service(self.client, '/deepbuilder/robot/check_path', '/deepbuilder/ro_check_path')
        self.srv_gripper_open = roslibpy.Service(self.client, '/deepbuilder/gripper/open', '/deepbuilder/ro_gripper_open')
        self.srv_get_sensor_vals = roslibpy.Service(self.client, '/deepbuilder/sensing/get_values', '/deepbuilder/se_get_values')
        self.srv_get_block = roslibpy.Service(self.client, '/deepbuilder/robot/get_block', '/deepbuilder/ro_get_block')
        self.srv_get_joint_states = roslibpy.Service(self.client, '/deepbuilder/robot/get_robot_state', '/deepbuilder/ro_get_robot_state')
        self.srv_move_path = roslibpy.Service(self.client, '/deepbuilder/robot/move_path', '/deepbuilder/ro_move_path')

    def ROS_status(self):
        request = roslibpy.ServiceRequest()
        print('Calling service...')
        result = self.srv_status.call(request)
        print('Service response: {}'.format(result['loggers']))

    def move_path(self, path, speed, double_check = True):
        if double_check:
            _in = input("Goal pose is valid, continue at speed "+str(speed)+"? [y, n or enter number to overwrite speed]")
            if _in != 'y':
                if math.isnan(float(_in)):
                    return False
                else:
                    speed = speed if float(_in) == 'Nan' else min([0.6, float(_in)])

        vals = {}
        vals["speed"] = speed
        vals["path"] = [item for sublist in path for item in sublist]
        request = roslibpy.ServiceRequest(values=vals)
        self.srv_move_path.call(request)
        return True


    def move_home(self, keep_asking = True):
        is_home, _, _ = self.is_robot_in_position(settings.HOME_POSE, 0.01)
        if is_home:
            return
        can_go, path, _ = self.test_pose(settings.HOME_POSE)
        while not can_go and keep_asking:
            input("Robot can not reach home position from current location. Move it manually so HOME can be reached.")
            can_go, path, _ = self.test_pose(settings.HOME_POSE)

        if len(path) > 0:
            return self.move_path(path, settings.ROBOT_SPEED_AUTO)


    #return is_valid [bool], path [][]
    def test_pose(self, pose):
        value = {}
        value['goal'] = pose
        request = roslibpy.ServiceRequest(value)
        path = []
        result = None
        while result == None:
            try:
                result = self.srv_path.call(request)
            except:
                print('ROS Service could not be reached. Make sure it is running. Retrying...')
                result = None
                time.sleep(1)
        if result['message'] == 'HOME_ERR':
            input("Moveit threw home error. Is robot state being published and is robot in home position? Press Enter to retry.")
            result = self.srv_path.call(request)
        elif result['message'] == 'INVALID':
            return False, path, {}
        elif result['message'] == 'SUCCESS':
            for point in result['path']['points']:
                path.append([point['positions'][0], point['positions'][1], point['positions'][2], point['positions'][3], point['positions'][4], point['positions'][5]])
            return True, path, result

    def is_robot_in_position(self, point, sq_tolerance = 0.01):
        result = self.srv_get_joint_states.call(roslibpy.ServiceRequest())
        sq_dist = 0.0
        for i in range(6):
            sq_dist += point[i] - result["joint_states"][i]
        
        return sq_dist < sq_tolerance, result["joint_states"], sq_dist


    def get_sensor_values(self):
        res = self.srv_get_sensor_vals.call(roslibpy.ServiceRequest())
        return [i * 1000.0 for i in res["values"]]

    def get_block(self):
        is_home, _, sq_dist = self.is_robot_in_position(settings.HOME_POSE)
        if not is_home:
            self.move_home()

        vals = {}
        vals["speed"] = settings.ROBOT_GET_BLOCK_SPEED
        request = roslibpy.ServiceRequest(values=vals)
        self.srv_get_block.call(request)

    #returns was_succesful and [sensor_values]
    def drop_block(self, goal, double_check = True):
        #test if robot is in home position
        is_home, _, sq_dist = self.is_robot_in_position(settings.HOME_POSE)
        i = 0
        while not is_home:
            print("Robot is not in home pose. Square joint distance: " +sq_dist)
            if i > 10:
                return
            time.sleep(0.5)
            is_home, _, sq_dist = self.is_robot_in_position(settings.HOME_POSE)
            i+=1

        
        #check if position can be reached
        valid_pose, path, _ = self.test_pose(goal)
        if not valid_pose:
            print("Goal pose invalid")
            return False, {}
            
        #move to goal position
        self.move_path(path, settings.ROBOT_SPEED_AUTO, double_check = double_check)
        time.sleep(0.2)

        #release block
        self.srv_gripper_open.call(roslibpy.ServiceRequest())
        time.sleep(0.2)

        #return home
        path.reverse()
        self.move_path(path, settings.ROBOT_SPEED_AUTO, double_check = False)
        
        #get sensor values
        sensor_vals = self.get_sensor_values()

        self.get_block()

        result = {}
        result["height_field"] = sensor_vals
        result["current_height"] = max(sensor_vals)
        result["angle_tcp2box"] = 3.141
        result["dist_tcp2box"] = 1400.0
        result["box_poses"] = [] #todo


        return True, result
        

    def __del__(self):
        self.client.terminate()

