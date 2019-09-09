// Auto-generated. Do not edit!

// (in-package deepbuilder.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let my_msgs = _finder('my_msgs');

//-----------------------------------------------------------

class rt_status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gh_present = null;
      this.agent_present = null;
      this.ros_tick = null;
      this.current_controller = null;
      this.state = null;
      this.action = null;
    }
    else {
      if (initObj.hasOwnProperty('gh_present')) {
        this.gh_present = initObj.gh_present
      }
      else {
        this.gh_present = false;
      }
      if (initObj.hasOwnProperty('agent_present')) {
        this.agent_present = initObj.agent_present
      }
      else {
        this.agent_present = false;
      }
      if (initObj.hasOwnProperty('ros_tick')) {
        this.ros_tick = initObj.ros_tick
      }
      else {
        this.ros_tick = 0;
      }
      if (initObj.hasOwnProperty('current_controller')) {
        this.current_controller = initObj.current_controller
      }
      else {
        this.current_controller = '';
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new my_msgs.msg.state();
      }
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = new my_msgs.msg.action();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_status
    // Serialize message field [gh_present]
    bufferOffset = _serializer.bool(obj.gh_present, buffer, bufferOffset);
    // Serialize message field [agent_present]
    bufferOffset = _serializer.bool(obj.agent_present, buffer, bufferOffset);
    // Serialize message field [ros_tick]
    bufferOffset = _serializer.int64(obj.ros_tick, buffer, bufferOffset);
    // Serialize message field [current_controller]
    bufferOffset = _serializer.string(obj.current_controller, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = my_msgs.msg.state.serialize(obj.state, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = my_msgs.msg.action.serialize(obj.action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_status
    let len;
    let data = new rt_status(null);
    // Deserialize message field [gh_present]
    data.gh_present = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [agent_present]
    data.agent_present = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [ros_tick]
    data.ros_tick = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [current_controller]
    data.current_controller = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = my_msgs.msg.state.deserialize(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = my_msgs.msg.action.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.current_controller.length;
    length += my_msgs.msg.state.getMessageSize(object.state);
    length += my_msgs.msg.action.getMessageSize(object.action);
    return length + 14;
  }

  static datatype() {
    // Returns string type for a message object
    return 'deepbuilder/rt_status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '72a571d7c6714cec7e8e029ca7689a9e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #this should contain ALL information about the runtime
    bool gh_present
    bool agent_present
    int64 ros_tick
    string current_controller
    my_msgs/state state
    my_msgs/action action
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
    
    ================================================================================
    MSG: my_msgs/action
    string id
    float32 A0
    float32 A1
    float32 A2
    float32 A3
    float32 A4
    float32 A5
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rt_status(null);
    if (msg.gh_present !== undefined) {
      resolved.gh_present = msg.gh_present;
    }
    else {
      resolved.gh_present = false
    }

    if (msg.agent_present !== undefined) {
      resolved.agent_present = msg.agent_present;
    }
    else {
      resolved.agent_present = false
    }

    if (msg.ros_tick !== undefined) {
      resolved.ros_tick = msg.ros_tick;
    }
    else {
      resolved.ros_tick = 0
    }

    if (msg.current_controller !== undefined) {
      resolved.current_controller = msg.current_controller;
    }
    else {
      resolved.current_controller = ''
    }

    if (msg.state !== undefined) {
      resolved.state = my_msgs.msg.state.Resolve(msg.state)
    }
    else {
      resolved.state = new my_msgs.msg.state()
    }

    if (msg.action !== undefined) {
      resolved.action = my_msgs.msg.action.Resolve(msg.action)
    }
    else {
      resolved.action = new my_msgs.msg.action()
    }

    return resolved;
    }
};

module.exports = rt_status;
