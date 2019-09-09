class Point(object):
    def __init__(self):
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0

class Quaternion(object):
    def __init__(self):
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
        self.w = 0.0

class Pose(object):
    def __init__(self):
        self.position = Point()
        self.orientation = Quaternion()

class state(object):
    def __init__(self):
        self.action_id = '00000000'
        self.fastest_box = 0
        self.highest_box = 0
        self.current_height = 0.0
        self.box_poses = []
        self.last_tcp = Pose()

class action(object):
    def __init__(self):
        self.reset = False
        self.id = '00000000'
        self.A0 = 0.0
        self.A1 = 0.0
        self.A2 = 0.0
        self.A3 = 0.0
        self.A4 = 0.0
        self.A5 = 0.0