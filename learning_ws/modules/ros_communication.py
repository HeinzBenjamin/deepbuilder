import roslibpy, time, math
import settings
#HOME_POSE = [1.1334346532821655,-1.7553976217852991,0.8690872192382812,-0.6843889395343226,-1.5728209654437464,-0.424158]

class Connection():
    def __init__(self, session_name = ''):
        self.client = roslibpy.Ros(host='localhost', port=9090)
        self.client.run()
        self.session_name = session_name
        self.srv_status = roslibpy.Service(self.client, '/rosout/get_loggers', 'roscpp/GetLoggers')
        self.srv_path = roslibpy.Service(self.client, '/deepbuilder/robot/plan_path', '/deepbuilder/ro_plan_path')
        self.srv_update_msh = roslibpy.Service(self.client, '/deepbuilder/robot/update_state_mesh', '/deepbuilder/ro_update_state_mesh')

        self.srv_get_sensor_vals = roslibpy.Service(self.client, '/deepbuilder/sensing/get_values', '/deepbuilder/se_get_values')
        self.srv_get_joint_states = roslibpy.Service(self.client, '/deepbuilder/robot/get_robot_state', '/deepbuilder/ro_get_robot_state')
        self.srv_move_path = roslibpy.Service(self.client, '/deepbuilder/robot/move_path', '/deepbuilder/ro_move_path')

    def ROS_status(self):
        request = roslibpy.ServiceRequest()
        print('Calling service...')
        result = self.srv_status.call(request)
        print('Service response: {}'.format(result['loggers']))


    '''NEEDS REVISION
    def move_path(self, path, speed, double_check = True):
        if double_check:
            _in = input("Goal pose is valid, continue at speed "+str(speed)+"? [y, n or enter number to overwrite speed]")
            if _in != 'y':
                if _in == 'n':
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

    def is_robot_in_position(self, point, sq_tolerance = 0.01):
        result = self.srv_get_joint_states.call(roslibpy.ServiceRequest())
        sq_dist = 0.0
        for i in range(6):
            sq_dist += point[i] - result["joint_states"][i]
        
        return sq_dist < sq_tolerance, result["joint_states"], sq_dist


    def get_sensor_values(self):
        res = self.srv_get_sensor_vals.call(roslibpy.ServiceRequest())
        return [i * 1000.0 for i in res.data['values']['values']]

    '''

    #test if a goal pose can be reached, optionally supply different starting pose. if a state_mesh might cause collisions, suplly it here too
    def test_pose(self, goal_pose: "6d_pose", 
                        state_pose : "optional 6d_pose if starting axes state is different from current axes state" = [], 
                        state_mesh : "optional dict of vertices float32[] and indices int32[]" = {}):
        value = {}
                
        value['session'] = self.session_name if self.session_name != '' else 'anonymous'
        value['goal_pose'] = goal_pose
        value['state_pose'] = state_pose
        request = roslibpy.ServiceRequest(value)
        path = []
        result = None
        if state_mesh != {}:
            state_mesh['session'] = self.session_name
            srv_response = self.srv_update_msh.call(state_mesh)
            print(srv_response['message'])
        while result == None:
            try:
                result = self.srv_path.call(request)
            except:
                print('ROS Service could not be reached. Make sure it is running. Retrying in 5 sec...')
                time.sleep(5)
                result = None
        return result

    def reset_state_mesh(self):
        return self.srv_update_msh.call({'session': self.session_name, 'vertices':[], 'indices':[]})

    


    def __del__(self):
        self.client.terminate()


if __name__ == '__main__':
    goal = [1.93344, -0.9212, 1.023, 0.5129, -0.80699, 2.1416]
    state = []
    
    state_msh = {}
    state_msh['vertices']=[-113.831853, -920.663114, 190.342466, -66.036089, -919.055641, 208.04877, -71.657299, -906.430331, 194.088083, -93.600182, -898.627461, 179.337498, -123.483301, -898.627461, 169.431239, -149.892321, -906.430331, 168.15316, -162.739894, -919.055641, 175.991442, -157.118683, -931.680952, 189.95213, -135.175801, -939.483822, 204.702714, -105.292682, -939.483822, 214.608973, -78.883661, -931.680952, 215.887053, -24.031182, -914.390575, 227.377138, -34.72336, -890.375808, 200.822332, -76.461203, -875.533865, 172.765053, -133.302274, -875.533865, 153.922229, -183.535215, -890.375808, 151.491177, -207.972751, -914.390575, 166.400477, -197.280573, -938.405342, 192.955282, -155.54273, -953.247284, 221.012561, -98.701659, -953.247284, 239.855386, -48.468718, -938.405342, 242.286437, 8.071133, -907.124562, 246.435573, -6.645387, -874.071071, 209.886019, -64.092599, -853.64289, 171.268488, -142.327622, -853.64289, 145.333565, -211.467334, -874.071071, 141.987509, -245.102716, -907.124562, 162.508399, -230.386196, -940.178054, 199.057954, -172.938984, -960.606235, 237.675485, -94.703962, -960.606235, 263.610408, -25.564249, -940.178054, 266.956464, 27.128459, -897.968853, 263.358505, 9.828152, -859.112144, 220.391926, -57.705097, -835.097377, 174.994296, -149.675881, -835.097377, 144.505965, -230.954488, -859.112144, 140.572441, -270.495251, -897.968853, 164.696195, -253.194944, -936.825562, 207.662773, -185.661696, -960.840329, 253.060404, -93.690911, -960.840329, 283.548734, -12.412305, -936.825562, 287.482259, 31.275331, -887.819671, 276.489398, 13.084712, -846.963309, 231.311664, -57.923948, -821.712689, 183.57777, -154.627753, -821.712689, 151.520442, -240.089138, -846.963309, 147.38449, -281.664757, -887.819671, 172.749706, -263.474138, -928.676033, 217.92744, -192.465478, -953.926653, 265.661333, -95.761672, -953.926653, 297.718661, -10.300288, -928.676033, 301.854614, 20.105825, -877.670489, 284.542909, 2.805518, -838.81378, 241.57633, -64.72773, -814.799013, 196.1787, -156.698515, -814.799013, 165.690369, -237.977121, -838.81378, 161.756845, -277.517885, -877.670489, 185.880598, -260.217578, -916.527198, 228.847177, -192.684329, -940.541965, 274.244807, -100.713545, -940.541965, 304.733138, -19.434938, -916.527198, 308.666663, -5.286709, -868.51478, 286.730704, -20.00323, -835.461288, 250.181149, -77.450442, -815.033107, 211.563618, -155.685464, -815.033107, 185.628695, -224.825177, -835.461288, 182.282639, -258.460559, -868.51478, 202.80353, -243.744039, -901.568271, 239.353085, -186.296826, -921.996452, 277.970616, -108.061804, -921.996452, 303.905539, -38.922092, -901.568271, 307.251595, -42.416675, -861.248767, 282.838627, -53.108853, -837.234, 256.283821, -94.846696, -822.392058, 228.226542, -151.687767, -822.392058, 209.383718, -201.920708, -837.234, 206.952666, -226.358244, -861.248767, 221.861966, -215.666066, -885.263534, 248.416772, -173.928223, -900.105477, 276.47405, -117.087152, -900.105477, 295.316875, -66.854211, -885.263534, 297.747927, -87.649532, -856.5837, 273.247661, -93.270742, -843.95839, 259.286973, -115.213625, -836.155519, 244.536389, -145.096744, -836.155519, 234.63013, -171.505764, -843.95839, 233.35205, -184.353337, -856.5837, 241.190333, -178.732127, -869.209011, 255.151021, -156.789244, -877.011881, 269.901605, -126.906125, -877.011881, 279.807864, -100.497105, -869.209011, 281.085944, -136.557573, -854.976228, 258.896637]
    state_msh['indices']=[0, 2, 1, 0, 3, 2, 0, 4, 3, 0, 5, 4, 0, 6, 5, 0, 7, 6, 0, 8, 7, 0, 9, 8, 0, 10, 9, 0, 1, 10, 1, 2, 12, 2, 3, 13, 3, 4, 14, 4, 5, 14, 5, 6, 15, 6, 7, 17, 7, 8, 18, 8, 9, 18, 9, 10, 19, 10, 1, 20, 11, 12, 22, 12, 13, 23, 13, 14, 23, 14, 15, 24, 15, 16, 25, 16, 17, 27, 17, 18, 28, 18, 19, 29, 19, 20, 29, 20, 11, 30, 21, 22, 32, 22, 23, 33, 23, 24, 34, 24, 25, 34, 25, 26, 35, 26, 27, 37, 27, 28, 38, 28, 29, 39, 29, 30, 39, 30, 21, 40, 31, 32, 42, 32, 33, 43, 33, 34, 43, 34, 35, 44, 35, 36, 45, 36, 37, 47, 37, 38, 48, 38, 39, 48, 39, 40, 49, 40, 31, 50, 41, 42, 51, 42, 43, 52, 43, 44, 54, 44, 45, 55, 45, 46, 56, 46, 47, 56, 47, 48, 57, 48, 49, 59, 49, 50, 60, 50, 41, 51, 51, 52, 61, 52, 53, 62, 53, 54, 63, 54, 55, 65, 55, 56, 66, 56, 57, 66, 57, 58, 67, 58, 59, 68, 59, 60, 70, 60, 51, 61, 61, 62, 71, 62, 63, 72, 63, 64, 74, 64, 65, 75, 65, 66, 76, 66, 67, 76, 67, 68, 77, 68, 69, 78, 69, 70, 80, 70, 61, 71, 71, 72, 81, 72, 73, 82, 73, 74, 83, 74, 75, 85, 75, 76, 86, 76, 77, 86, 77, 78, 87, 78, 79, 89, 79, 80, 90, 80, 71, 81, 81, 82, 91, 82, 83, 91, 83, 84, 91, 84, 85, 91, 85, 86, 91, 86, 87, 91, 87, 88, 91, 88, 89, 91, 89, 90, 91, 90, 81, 91, 1, 12, 11, 2, 13, 12, 3, 14, 13, 5, 15, 14, 6, 16, 15, 6, 17, 16, 7, 18, 17, 9, 19, 18, 10, 20, 19, 1, 11, 20, 11, 22, 21, 12, 23, 22, 14, 24, 23, 15, 25, 24, 16, 26, 25, 16, 27, 26, 17, 28, 27, 18, 29, 28, 20, 30, 29, 11, 21, 30, 21, 32, 31, 22, 33, 32, 23, 34, 33, 25, 35, 34, 26, 36, 35, 26, 37, 36, 27, 38, 37, 28, 39, 38, 30, 40, 39, 21, 31, 40, 31, 42, 41, 32, 43, 42, 34, 44, 43, 35, 45, 44, 36, 46, 45, 36, 47, 46, 37, 48, 47, 39, 49, 48, 40, 50, 49, 31, 41, 50, 42, 52, 51, 43, 53, 52, 43, 54, 53, 44, 55, 54, 45, 56, 55, 47, 57, 56, 48, 58, 57, 48, 59, 58, 49, 60, 59, 50, 51, 60, 52, 62, 61, 53, 63, 62, 54, 64, 63, 54, 65, 64, 55, 66, 65, 57, 67, 66, 58, 68, 67, 59, 69, 68, 59, 70, 69, 60, 61, 70, 62, 72, 71, 63, 73, 72, 63, 74, 73, 64, 75, 74, 65, 76, 75, 67, 77, 76, 68, 78, 77, 69, 79, 78, 69, 80, 79, 70, 71, 80, 72, 82, 81, 73, 83, 82, 74, 84, 83, 74, 85, 84, 75, 86, 85, 77, 87, 86, 78, 88, 87, 78, 89, 88, 79, 90, 89, 80, 81, 90]
    
    con = Connection('bla')
    res = con.test_pose(goal, state_pose=state, state_mesh=state_msh)
    
    print(res['collisions'])
