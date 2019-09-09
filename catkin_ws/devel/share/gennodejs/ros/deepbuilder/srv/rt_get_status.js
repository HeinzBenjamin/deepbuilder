// Auto-generated. Do not edit!

// (in-package deepbuilder.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let rt_status = require('../msg/rt_status.js');

//-----------------------------------------------------------

class rt_get_statusRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_get_statusRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_get_statusRequest
    let len;
    let data = new rt_get_statusRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_get_statusRequest';
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
    const resolved = new rt_get_statusRequest(null);
    return resolved;
    }
};

class rt_get_statusResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = new rt_status();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_get_statusResponse
    // Serialize message field [status]
    bufferOffset = rt_status.serialize(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_get_statusResponse
    let len;
    let data = new rt_get_statusResponse(null);
    // Deserialize message field [status]
    data.status = rt_status.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += rt_status.getMessageSize(object.status);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_get_statusResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c414cc48f9560ab2032cf04710ece6ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    rt_status status
    
    ================================================================================
    MSG: deepbuilder/rt_status
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
    const resolved = new rt_get_statusResponse(null);
    if (msg.status !== undefined) {
      resolved.status = rt_status.Resolve(msg.status)
    }
    else {
      resolved.status = new rt_status()
    }

    return resolved;
    }
};

module.exports = {
  Request: rt_get_statusRequest,
  Response: rt_get_statusResponse,
  md5sum() { return 'c414cc48f9560ab2032cf04710ece6ce'; },
  datatype() { return 'deepbuilder/rt_get_status'; }
};
