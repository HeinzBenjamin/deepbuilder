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
      this.out_of_reach = null;
      this.self_collision = null;
      this.last_tcp = null;
      this.fastest_box = null;
      this.highest_box = null;
      this.current_height = null;
      this.box_poses = null;
    }
    else {
      if (initObj.hasOwnProperty('action_id')) {
        this.action_id = initObj.action_id
      }
      else {
        this.action_id = '';
      }
      if (initObj.hasOwnProperty('out_of_reach')) {
        this.out_of_reach = initObj.out_of_reach
      }
      else {
        this.out_of_reach = false;
      }
      if (initObj.hasOwnProperty('self_collision')) {
        this.self_collision = initObj.self_collision
      }
      else {
        this.self_collision = false;
      }
      if (initObj.hasOwnProperty('last_tcp')) {
        this.last_tcp = initObj.last_tcp
      }
      else {
        this.last_tcp = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('fastest_box')) {
        this.fastest_box = initObj.fastest_box
      }
      else {
        this.fastest_box = 0;
      }
      if (initObj.hasOwnProperty('highest_box')) {
        this.highest_box = initObj.highest_box
      }
      else {
        this.highest_box = 0;
      }
      if (initObj.hasOwnProperty('current_height')) {
        this.current_height = initObj.current_height
      }
      else {
        this.current_height = 0.0;
      }
      if (initObj.hasOwnProperty('box_poses')) {
        this.box_poses = initObj.box_poses
      }
      else {
        this.box_poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type state
    // Serialize message field [action_id]
    bufferOffset = _serializer.string(obj.action_id, buffer, bufferOffset);
    // Serialize message field [out_of_reach]
    bufferOffset = _serializer.bool(obj.out_of_reach, buffer, bufferOffset);
    // Serialize message field [self_collision]
    bufferOffset = _serializer.bool(obj.self_collision, buffer, bufferOffset);
    // Serialize message field [last_tcp]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.last_tcp, buffer, bufferOffset);
    // Serialize message field [fastest_box]
    bufferOffset = _serializer.int32(obj.fastest_box, buffer, bufferOffset);
    // Serialize message field [highest_box]
    bufferOffset = _serializer.int32(obj.highest_box, buffer, bufferOffset);
    // Serialize message field [current_height]
    bufferOffset = _serializer.float32(obj.current_height, buffer, bufferOffset);
    // Serialize message field [box_poses]
    // Serialize the length for message field [box_poses]
    bufferOffset = _serializer.uint32(obj.box_poses.length, buffer, bufferOffset);
    obj.box_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type state
    let len;
    let data = new state(null);
    // Deserialize message field [action_id]
    data.action_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [out_of_reach]
    data.out_of_reach = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [self_collision]
    data.self_collision = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [last_tcp]
    data.last_tcp = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [fastest_box]
    data.fastest_box = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [highest_box]
    data.highest_box = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [current_height]
    data.current_height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [box_poses]
    // Deserialize array length for message field [box_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.box_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.box_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.action_id.length;
    length += 56 * object.box_poses.length;
    return length + 78;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_msgs/state';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72cea1bd08eaaeaa5fb310c31bb88005';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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

    if (msg.out_of_reach !== undefined) {
      resolved.out_of_reach = msg.out_of_reach;
    }
    else {
      resolved.out_of_reach = false
    }

    if (msg.self_collision !== undefined) {
      resolved.self_collision = msg.self_collision;
    }
    else {
      resolved.self_collision = false
    }

    if (msg.last_tcp !== undefined) {
      resolved.last_tcp = geometry_msgs.msg.Pose.Resolve(msg.last_tcp)
    }
    else {
      resolved.last_tcp = new geometry_msgs.msg.Pose()
    }

    if (msg.fastest_box !== undefined) {
      resolved.fastest_box = msg.fastest_box;
    }
    else {
      resolved.fastest_box = 0
    }

    if (msg.highest_box !== undefined) {
      resolved.highest_box = msg.highest_box;
    }
    else {
      resolved.highest_box = 0
    }

    if (msg.current_height !== undefined) {
      resolved.current_height = msg.current_height;
    }
    else {
      resolved.current_height = 0.0
    }

    if (msg.box_poses !== undefined) {
      resolved.box_poses = new Array(msg.box_poses.length);
      for (let i = 0; i < resolved.box_poses.length; ++i) {
        resolved.box_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.box_poses[i]);
      }
    }
    else {
      resolved.box_poses = []
    }

    return resolved;
    }
};

module.exports = state;
