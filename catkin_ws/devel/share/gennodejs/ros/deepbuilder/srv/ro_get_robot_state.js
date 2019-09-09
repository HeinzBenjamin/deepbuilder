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


//-----------------------------------------------------------

class ro_get_robot_stateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_get_robot_stateRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_get_robot_stateRequest
    let len;
    let data = new ro_get_robot_stateRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_get_robot_stateRequest';
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
    const resolved = new ro_get_robot_stateRequest(null);
    return resolved;
    }
};

class ro_get_robot_stateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_states = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_states')) {
        this.joint_states = initObj.joint_states
      }
      else {
        this.joint_states = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_get_robot_stateResponse
    // Serialize message field [joint_states]
    bufferOffset = _arraySerializer.float32(obj.joint_states, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_get_robot_stateResponse
    let len;
    let data = new ro_get_robot_stateResponse(null);
    // Deserialize message field [joint_states]
    data.joint_states = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.joint_states.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_get_robot_stateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4fa113d228950451cb528101719c77a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] joint_states
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_get_robot_stateResponse(null);
    if (msg.joint_states !== undefined) {
      resolved.joint_states = msg.joint_states;
    }
    else {
      resolved.joint_states = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ro_get_robot_stateRequest,
  Response: ro_get_robot_stateResponse,
  md5sum() { return '4fa113d228950451cb528101719c77a1'; },
  datatype() { return 'deepbuilder/ro_get_robot_state'; }
};
