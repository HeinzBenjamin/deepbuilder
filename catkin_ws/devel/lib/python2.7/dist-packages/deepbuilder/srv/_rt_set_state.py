# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from deepbuilder/rt_set_stateRequest.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import my_msgs.msg

class rt_set_stateRequest(genpy.Message):
  _md5sum = "32b4089e124a4eaa45ecb040a983b2cd"
  _type = "deepbuilder/rt_set_stateRequest"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string controller
my_msgs/state state

================================================================================
MSG: my_msgs/state
string action_id
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
  __slots__ = ['controller','state']
  _slot_types = ['string','my_msgs/state']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       controller,state

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(rt_set_stateRequest, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.controller is None:
        self.controller = ''
      if self.state is None:
        self.state = my_msgs.msg.state()
    else:
      self.controller = ''
      self.state = my_msgs.msg.state()

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
      _x = self.controller
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.state.action_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2B7d2if().pack(_x.state.out_of_reach, _x.state.self_collision, _x.state.last_tcp.position.x, _x.state.last_tcp.position.y, _x.state.last_tcp.position.z, _x.state.last_tcp.orientation.x, _x.state.last_tcp.orientation.y, _x.state.last_tcp.orientation.z, _x.state.last_tcp.orientation.w, _x.state.fastest_box, _x.state.highest_box, _x.state.current_height))
      length = len(self.state.box_poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.state.box_poses:
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
      if self.state is None:
        self.state = my_msgs.msg.state()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.controller = str[start:end].decode('utf-8')
      else:
        self.controller = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.state.action_id = str[start:end].decode('utf-8')
      else:
        self.state.action_id = str[start:end]
      _x = self
      start = end
      end += 70
      (_x.state.out_of_reach, _x.state.self_collision, _x.state.last_tcp.position.x, _x.state.last_tcp.position.y, _x.state.last_tcp.position.z, _x.state.last_tcp.orientation.x, _x.state.last_tcp.orientation.y, _x.state.last_tcp.orientation.z, _x.state.last_tcp.orientation.w, _x.state.fastest_box, _x.state.highest_box, _x.state.current_height,) = _get_struct_2B7d2if().unpack(str[start:end])
      self.state.out_of_reach = bool(self.state.out_of_reach)
      self.state.self_collision = bool(self.state.self_collision)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.state.box_poses = []
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
        self.state.box_poses.append(val1)
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
      _x = self.controller
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self.state.action_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_2B7d2if().pack(_x.state.out_of_reach, _x.state.self_collision, _x.state.last_tcp.position.x, _x.state.last_tcp.position.y, _x.state.last_tcp.position.z, _x.state.last_tcp.orientation.x, _x.state.last_tcp.orientation.y, _x.state.last_tcp.orientation.z, _x.state.last_tcp.orientation.w, _x.state.fastest_box, _x.state.highest_box, _x.state.current_height))
      length = len(self.state.box_poses)
      buff.write(_struct_I.pack(length))
      for val1 in self.state.box_poses:
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
      if self.state is None:
        self.state = my_msgs.msg.state()
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.controller = str[start:end].decode('utf-8')
      else:
        self.controller = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.state.action_id = str[start:end].decode('utf-8')
      else:
        self.state.action_id = str[start:end]
      _x = self
      start = end
      end += 70
      (_x.state.out_of_reach, _x.state.self_collision, _x.state.last_tcp.position.x, _x.state.last_tcp.position.y, _x.state.last_tcp.position.z, _x.state.last_tcp.orientation.x, _x.state.last_tcp.orientation.y, _x.state.last_tcp.orientation.z, _x.state.last_tcp.orientation.w, _x.state.fastest_box, _x.state.highest_box, _x.state.current_height,) = _get_struct_2B7d2if().unpack(str[start:end])
      self.state.out_of_reach = bool(self.state.out_of_reach)
      self.state.self_collision = bool(self.state.self_collision)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.state.box_poses = []
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
        self.state.box_poses.append(val1)
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
# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from deepbuilder/rt_set_stateResponse.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class rt_set_stateResponse(genpy.Message):
  _md5sum = "d41d8cd98f00b204e9800998ecf8427e"
  _type = "deepbuilder/rt_set_stateResponse"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """"""
  __slots__ = []
  _slot_types = []

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(rt_set_stateResponse, self).__init__(*args, **kwds)

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
      pass
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
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
      pass
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
class rt_set_state(object):
  _type          = 'deepbuilder/rt_set_state'
  _md5sum = '32b4089e124a4eaa45ecb040a983b2cd'
  _request_class  = rt_set_stateRequest
  _response_class = rt_set_stateResponse
