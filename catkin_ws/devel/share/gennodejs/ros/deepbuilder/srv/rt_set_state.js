// Auto-generated. Do not edit!

// (in-package deepbuilder.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let my_msgs = _finder('my_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class rt_set_stateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.controller = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('controller')) {
        this.controller = initObj.controller
      }
      else {
        this.controller = '';
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new my_msgs.msg.state();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_set_stateRequest
    // Serialize message field [controller]
    bufferOffset = _serializer.string(obj.controller, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = my_msgs.msg.state.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_stateRequest
    let len;
    let data = new rt_set_stateRequest(null);
    // Deserialize message field [controller]
    data.controller = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = my_msgs.msg.state.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.controller.length;
    length += my_msgs.msg.state.getMessageSize(object.state);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_stateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '32b4089e124a4eaa45ecb040a983b2cd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string controller
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rt_set_stateRequest(null);
    if (msg.controller !== undefined) {
      resolved.controller = msg.controller;
    }
    else {
      resolved.controller = ''
    }

    if (msg.state !== undefined) {
      resolved.state = my_msgs.msg.state.Resolve(msg.state)
    }
    else {
      resolved.state = new my_msgs.msg.state()
    }

    return resolved;
    }
};

class rt_set_stateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_set_stateResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_stateResponse
    let len;
    let data = new rt_set_stateResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_stateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rt_set_stateResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: rt_set_stateRequest,
  Response: rt_set_stateResponse,
  md5sum() { return '32b4089e124a4eaa45ecb040a983b2cd'; },
  datatype() { return 'deepbuilder/rt_set_state'; }
};
