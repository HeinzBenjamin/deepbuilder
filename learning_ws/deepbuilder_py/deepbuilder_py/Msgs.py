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
        self.is_printable = False
        self.action_tcp = Pose()
        self.displaced_tcps = []
        self.state_compressed = []
        self.compression_loss = -1.0
        self.state_mesh_vertices = []
        self.state_mesh_indices = []
        self.current_height = -1.0
        self.current_tcp_displacements = []
        self.current_smoothness = -1.0
        self.current_area = -1.0

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
        self.A6 = 0.0