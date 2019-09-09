# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from my_msgs/state.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg

class state(genpy.Message):
  _md5sum = "72cea1bd08eaaeaa5fb310c31bb88005"
  _type = "my_msgs/state"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string action_id
bool out_of_reach
bool self_collision
geometry_msgs/Pose last_tcp
int32 fastest_box
int32 highest_box
float32 current_height
geometry_msgs/Pose[] box_poses
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
"""
  __slots__ = ['action_id','out_of_reach','self_collision','last_tcp','fastest_box','highest_box','current_height','box_poses']
  _slot_types = ['string','bool','bool','geometry_msgs/Pose','int32','int32','float32','geometry_msgs/Pose[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       action_id,out_of_reach,self_collision,last_tcp,fastest_box,highest_box,current_height,box_poses

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(state, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.action_id is None:
        self.action_id = ''
      if self.out_of_reach is None:
        self.out_of_reach = False
      if self.self_collision is None:
        self.self_collision = False
      if self.last_tcp is None:
        self.last_tcp = geometry_msgs.msg.Pose()
      if self.fastest_box is None:
        self.fastest_box = 0
      if self.highest_box is None:
        self.highest_box = 0
      if self.current_height is None:
        self.current_height = 0.
      if self.box_poses is None:
        self.box_poses = []
    else:
      self.action_id = ''
      self.out_of_reach = False
      self.self_collision = False
      self.last_tcp = geometry_msgs.msg.Pose()
      self.fastest_box = 0
      self.highest_box = 0
      self.current_height = 0.
      self.box_poses = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self.action_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2B7d2if().pack(_x.out_of_reach, _x.self_collision, _x.last_tcp.position.x, _x.last_tcp.position.y, _x.last_tcp.position.z, _x.last_tcp.orientation.x, _x.last_tcp.orientation.y, _x.last_tcp.orientation.z, _x.last_tcp.orientation.w, _x.fastest_box, _x.highest_box, _x.current_height))
      length = len(self.box_poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.box_poses:
        _v1 = val1.position
        _x = _v1
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v2 = val1.orientation
        _x = _v2
        buff.write(_get_struct_4d().pack(_x.x, _x.y, _x.z, _x.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.last_tcp is None:
        self.last_tcp = geometry_msgs.msg.Pose()
      if self.box_poses is None:
        self.box_poses = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_id = str[start:end].decode('utf-8')
      else:
        self.action_id = str[start:end]
      _x = self
      start = end
      end += 70
      (_x.out_of_reach, _x.self_collision, _x.last_tcp.position.x, _x.last_tcp.position.y, _x.last_tcp.position.z, _x.last_tcp.orientation.x, _x.last_tcp.orientation.y, _x.last_tcp.orientation.z, _x.last_tcp.orientation.w, _x.fastest_box, _x.highest_box, _x.current_height,) = _get_struct_2B7d2if().unpack(str[start:end])
      self.out_of_reach = bool(self.out_of_reach)
      self.self_collision = bool(self.self_collision)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.box_poses = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Pose()
        _v3 = val1.position
        _x = _v3
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v4 = val1.orientation
        _x = _v4
        start = end
        end += 32
        (_x.x, _x.y, _x.z, _x.w,) = _get_struct_4d().unpack(str[start:end])
        self.box_poses.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self.action_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2B7d2if().pack(_x.out_of_reach, _x.self_collision, _x.last_tcp.position.x, _x.last_tcp.position.y, _x.last_tcp.position.z, _x.last_tcp.orientation.x, _x.last_tcp.orientation.y, _x.last_tcp.orientation.z, _x.last_tcp.orientation.w, _x.fastest_box, _x.highest_box, _x.current_height))
      length = len(self.box_poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.box_poses:
        _v5 = val1.position
        _x = _v5
        buff.write(_get_struct_3d().pack(_x.x, _x.y, _x.z))
        _v6 = val1.orientation
        _x = _v6
        buff.write(_get_struct_4d().pack(_x.x, _x.y, _x.z, _x.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.last_tcp is None:
        self.last_tcp = geometry_msgs.msg.Pose()
      if self.box_poses is None:
        self.box_poses = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.action_id = str[start:end].decode('utf-8')
      else:
        self.action_id = str[start:end]
      _x = self
      start = end
      end += 70
      (_x.out_of_reach, _x.self_collision, _x.last_tcp.position.x, _x.last_tcp.position.y, _x.last_tcp.position.z, _x.last_tcp.orientation.x, _x.last_tcp.orientation.y, _x.last_tcp.orientation.z, _x.last_tcp.orientation.w, _x.fastest_box, _x.highest_box, _x.current_height,) = _get_struct_2B7d2if().unpack(str[start:end])
      self.out_of_reach = bool(self.out_of_reach)
      self.self_collision = bool(self.self_collision)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.box_poses = []
      for i in range(0, length):
        val1 = geometry_msgs.msg.Pose()
        _v7 = val1.position
        _x = _v7
        start = end
        end += 24
        (_x.x, _x.y, _x.z,) = _get_struct_3d().unpack(str[start:end])
        _v8 = val1.orientation
        _x = _v8
        start = end
        end += 32
        (_x.x, _x.y, _x.z, _x.w,) = _get_struct_4d().unpack(str[start:end])
        self.box_poses.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4d = None
def _get_struct_4d():
    global _struct_4d
    if _struct_4d is None:
        _struct_4d = struct.Struct("<4d")
    return _struct_4d
_struct_2B7d2if = None
def _get_struct_2B7d2if():
    global _struct_2B7d2if
    if _struct_2B7d2if is None:
        _struct_2B7d2if = struct.Struct("<2B7d2if")
    return _struct_2B7d2if
_struct_3d = None
def _get_struct_3d():
    global _struct_3d
    if _struct_3d is None:
        _struct_3d = struct.Struct("<3d")
    return _struct_3d
