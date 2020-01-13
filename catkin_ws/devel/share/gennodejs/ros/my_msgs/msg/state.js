// Auto-generated. Do not edit!

// (in-package my_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class state {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action_id = null;
      this.is_printable = null;
      this.action_tcp = null;
      this.displaced_tcps = null;
      this.state_compressed = null;
      this.compression_loss = null;
      this.state_mesh_vertices = null;
      this.state_mesh_indices = null;
      this.current_height = null;
      this.current_tcp_displacements = null;
      this.current_smoothness = null;
      this.current_area = null;
    }
    else {
      if (initObj.hasOwnProperty('action_id')) {
        this.action_id = initObj.action_id
      }
      else {
        this.action_id = '';
      }
      if (initObj.hasOwnProperty('is_printable')) {
        this.is_printable = initObj.is_printable
      }
      else {
        this.is_printable = false;
      }
      if (initObj.hasOwnProperty('action_tcp')) {
        this.action_tcp = initObj.action_tcp
      }
      else {
        this.action_tcp = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('displaced_tcps')) {
        this.displaced_tcps = initObj.displaced_tcps
      }
      else {
        this.displaced_tcps = [];
      }
      if (initObj.hasOwnProperty('state_compressed')) {
        this.state_compressed = initObj.state_compressed
      }
      else {
        this.state_compressed = [];
      }
      if (initObj.hasOwnProperty('compression_loss')) {
        this.compression_loss = initObj.compression_loss
      }
      else {
        this.compression_loss = 0.0;
      }
      if (initObj.hasOwnProperty('state_mesh_vertices')) {
        this.state_mesh_vertices = initObj.state_mesh_vertices
      }
      else {
        this.state_mesh_vertices = [];
      }
      if (initObj.hasOwnProperty('state_mesh_indices')) {
        this.state_mesh_indices = initObj.state_mesh_indices
      }
      else {
        this.state_mesh_indices = [];
      }
      if (initObj.hasOwnProperty('current_height')) {
        this.current_height = initObj.current_height
      }
      else {
        this.current_height = 0.0;
      }
      if (initObj.hasOwnProperty('current_tcp_displacements')) {
        this.current_tcp_displacements = initObj.current_tcp_displacements
      }
      else {
        this.current_tcp_displacements = [];
      }
      if (initObj.hasOwnProperty('current_smoothness')) {
        this.current_smoothness = initObj.current_smoothness
      }
      else {
        this.current_smoothness = 0.0;
      }
      if (initObj.hasOwnProperty('current_area')) {
        this.current_area = initObj.current_area
      }
      else {
        this.current_area = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type state
    // Serialize message field [action_id]
    bufferOffset = _serializer.string(obj.action_id, buffer, bufferOffset);
    // Serialize message field [is_printable]
    bufferOffset = _serializer.bool(obj.is_printable, buffer, bufferOffset);
    // Serialize message field [action_tcp]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.action_tcp, buffer, bufferOffset);
    // Serialize message field [displaced_tcps]
    // Serialize the length for message field [displaced_tcps]
    bufferOffset = _serializer.uint32(obj.displaced_tcps.length, buffer, bufferOffset);
    obj.displaced_tcps.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [state_compressed]
    bufferOffset = _arraySerializer.float32(obj.state_compressed, buffer, bufferOffset, null);
    // Serialize message field [compression_loss]
    bufferOffset = _serializer.float32(obj.compression_loss, buffer, bufferOffset);
    // Serialize message field [state_mesh_vertices]
    bufferOffset = _arraySerializer.float32(obj.state_mesh_vertices, buffer, bufferOffset, null);
    // Serialize message field [state_mesh_indices]
    bufferOffset = _arraySerializer.int32(obj.state_mesh_indices, buffer, bufferOffset, null);
    // Serialize message field [current_height]
    bufferOffset = _serializer.float32(obj.current_height, buffer, bufferOffset);
    // Serialize message field [current_tcp_displacements]
    bufferOffset = _arraySerializer.float32(obj.current_tcp_displacements, buffer, bufferOffset, null);
    // Serialize message field [current_smoothness]
    bufferOffset = _serializer.float32(obj.current_smoothness, buffer, bufferOffset);
    // Serialize message field [current_area]
    bufferOffset = _serializer.float32(obj.current_area, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type state
    let len;
    let data = new state(null);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [is_printable]
    data.is_printable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [action_tcp]
    data.action_tcp = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [displaced_tcps]
    // Deserialize array length for message field [displaced_tcps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.displaced_tcps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.displaced_tcps[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [state_compressed]
    data.state_compressed = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [compression_loss]
    data.compression_loss = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [state_mesh_vertices]
    data.state_mesh_vertices = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [state_mesh_indices]
    data.state_mesh_indices = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [current_height]
    data.current_height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_tcp_displacements]
    data.current_tcp_displacements = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [current_smoothness]
    data.current_smoothness = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_area]
    data.current_area = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.action_id.length;
    length += 56 * object.displaced_tcps.length;
    length += 4 * object.state_compressed.length;
    length += 4 * object.state_mesh_vertices.length;
    length += 4 * object.state_mesh_indices.length;
    length += 4 * object.current_tcp_displacements.length;
    return length + 97;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_msgs/state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b716ae9e4e97f8d790d147cc9fc70235';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string action_id
    bool is_printable
    geometry_msgs/Pose action_tcp
    geometry_msgs/Pose[] displaced_tcps
    float32[] state_compressed
    float32 compression_loss
    float32[] state_mesh_vertices
    int32[] state_mesh_indices
    float32 current_height
    float32[] current_tcp_displacements
    float32 current_smoothness
    float32 current_area
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new state(null);
    if (msg.action_id !== undefined) {
      resolved.action_id = msg.action_id;
    }
    else {
      resolved.action_id = ''
    }

    if (msg.is_printable !== undefined) {
      resolved.is_printable = msg.is_printable;
    }
    else {
      resolved.is_printable = false
    }

    if (msg.action_tcp !== undefined) {
      resolved.action_tcp = geometry_msgs.msg.Pose.Resolve(msg.action_tcp)
    }
    else {
      resolved.action_tcp = new geometry_msgs.msg.Pose()
    }

    if (msg.displaced_tcps !== undefined) {
      resolved.displaced_tcps = new Array(msg.displaced_tcps.length);
      for (let i = 0; i < resolved.displaced_tcps.length; ++i) {
        resolved.displaced_tcps[i] = geometry_msgs.msg.Pose.Resolve(msg.displaced_tcps[i]);
      }
    }
    else {
      resolved.displaced_tcps = []
    }

    if (msg.state_compressed !== undefined) {
      resolved.state_compressed = msg.state_compressed;
    }
    else {
      resolved.state_compressed = []
    }

    if (msg.compression_loss !== undefined) {
      resolved.compression_loss = msg.compression_loss;
    }
    else {
      resolved.compression_loss = 0.0
    }

    if (msg.state_mesh_vertices !== undefined) {
      resolved.state_mesh_vertices = msg.state_mesh_vertices;
    }
    else {
      resolved.state_mesh_vertices = []
    }

    if (msg.state_mesh_indices !== undefined) {
      resolved.state_mesh_indices = msg.state_mesh_indices;
    }
    else {
      resolved.state_mesh_indices = []
    }

    if (msg.current_height !== undefined) {
      resolved.current_height = msg.current_height;
    }
    else {
      resolved.current_height = 0.0
    }

    if (msg.current_tcp_displacements !== undefined) {
      resolved.current_tcp_displacements = msg.current_tcp_displacements;
    }
    else {
      resolved.current_tcp_displacements = []
    }

    if (msg.current_smoothness !== undefined) {
      resolved.current_smoothness = msg.current_smoothness;
    }
    else {
      resolved.current_smoothness = 0.0
    }

    if (msg.current_area !== undefined) {
      resolved.current_area = msg.current_area;
    }
    else {
      resolved.current_area = 0.0
    }

    return resolved;
    }
};

module.exports = state;
