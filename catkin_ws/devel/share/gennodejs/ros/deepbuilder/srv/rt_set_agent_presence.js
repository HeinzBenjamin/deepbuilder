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

class rt_set_agent_presenceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.agent_present = null;
    }
    else {
      if (initObj.hasOwnProperty('agent_present')) {
        this.agent_present = initObj.agent_present
      }
      else {
        this.agent_present = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_set_agent_presenceRequest
    // Serialize message field [agent_present]
    bufferOffset = _serializer.bool(obj.agent_present, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_agent_presenceRequest
    let len;
    let data = new rt_set_agent_presenceRequest(null);
    // Deserialize message field [agent_present]
    data.agent_present = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_agent_presenceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8d81a8d38b2cf9545ac2bc74275099bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool agent_present
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rt_set_agent_presenceRequest(null);
    if (msg.agent_present !== undefined) {
      resolved.agent_present = msg.agent_present;
    }
    else {
      resolved.agent_present = false
    }

    return resolved;
    }
};

class rt_set_agent_presenceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_set_agent_presenceResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_agent_presenceResponse
    let len;
    let data = new rt_set_agent_presenceResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_agent_presenceResponse';
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
    const resolved = new rt_set_agent_presenceResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: rt_set_agent_presenceRequest,
  Response: rt_set_agent_presenceResponse,
  md5sum() { return '8d81a8d38b2cf9545ac2bc74275099bf'; },
  datatype() { return 'deepbuilder/rt_set_agent_presence'; }
};
