import math

axis_weights = [1.0,1.0,1.0,1.0,1.0,1.0]

class path_segment:
    def __init__(self, points, parent, i_in_parent):
        self.points = points #points as []
        self.parent = parent #id of parent
        self.i_in_parent = i_in_parent #i-th point in parent is the connecting node to zero-th point in this
        

def P2P(pointA, pointB, steps):
    points=[]
    invS = 1.0/steps
    t = invS
    for s in range(steps):
        points.append([])
        for a in range(len(pointA)):
            points[-1].append(pointA[a]+t*(pointB[a]-pointA[a]))
        t+=invS

    return points

def angular_distance(pointA, pointB, use_weights=False, continuous_axes=False):
    return math.sqrt(sq_angular_distance(pointA, pointB, use_weights, continuous_axes))

def sq_angular_distance(pointA, pointB, use_weights=False, continuous_axes=False):
    dist = 0.0
    if continuous_axes:
        for i in range(0,len(pointA)):
            optA = abs(pointA[i]-pointB[i])
            optB = abs(2.0*math.pi-pointA[i]+pointB[i])
            optC = abs(2.0*math.pi-pointB[i]+pointA[i])
            i_dist = min(optA, min(optB, optC))
            dist += i_dist*i_dist * (1.0 if not use_weights else axis_weights[i])
    else:
        for i in range(0, len(pointA)):
            i_dist = abs(pointA[i]-pointB[i])
            dist += i_dist*i_dist * (1.0 if not use_weights else axis_weights[i])
    return dist

def find_closest(point, path, use_weights=False, continuous_axes=False):
    min_dist = float("inf")
    I = 0
    i = 0
    P = []
    for p in path:
        d = sq_angular_distance(p, point, use_weights=False, continuous_axes=False)
        if d < min_dist:
            min_dist = d
            I = i
            P = p
        i += 1
    return I, P, min_dist

def find_closest_from_many(point, path_segments, use_weights = False, continuous_axes = False):
    dist = float("inf")
    parent_id = -1
    i_in_parent = -1    
    connector = []
    i = 0
    for seg in path_segments:
        I, ppp, min_dist = find_closest(point, seg.points, use_weights, continuous_axes)
        if min_dist < dist:
            dist = min_dist
            parent_id = i
            i_in_parent = I
            connector = ppp
        i += 1

    return parent_id, i_in_parent, connector, dist

#only tries segment_limit number of hops upward in the tree
def assemble_path(segment, all_segments, max_hops = 4):
    i = 0
    path = segment.points
    cur_seg = segment
    while cur_seg.parent != 0:
        parent_seg = all_segments[cur_seg.parent]
        new_path = parent_seg.points[0:(cur_seg.i_in_parent+1)]
        new_path.extend(path)
        path = new_path
        cur_seg = parent_seg
        i += 1
        if i >= max_hops:
            return "fail"

    return path
