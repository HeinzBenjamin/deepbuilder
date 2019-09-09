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

class rt_set_actionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.controller = null;
      this.action = null;
    }
    else {
      if (initObj.hasOwnProperty('controller')) {
        this.controller = initObj.controller
      }
      else {
        this.controller = '';
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
    // Serializes a message object of type rt_set_actionRequest
    // Serialize message field [controller]
    bufferOffset = _serializer.string(obj.controller, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = my_msgs.msg.action.serialize(obj.action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_actionRequest
    let len;
    let data = new rt_set_actionRequest(null);
    // Deserialize message field [controller]
    data.controller = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = my_msgs.msg.action.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.controller.length;
    length += my_msgs.msg.action.getMessageSize(object.action);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_actionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d06ec287625f49b9001c48a2d24b856';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string controller
    my_msgs/action action
    
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
    const resolved = new rt_set_actionRequest(null);
    if (msg.controller !== undefined) {
      resolved.controller = msg.controller;
    }
    else {
      resolved.controller = ''
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

class rt_set_actionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rt_set_actionResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rt_set_actionResponse
    let len;
    let data = new rt_set_actionResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/rt_set_actionResponse';
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
    const resolved = new rt_set_actionResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: rt_set_actionRequest,
  Response: rt_set_actionResponse,
  md5sum() { return '5d06ec287625f49b9001c48a2d24b856'; },
  datatype() { return 'deepbuilder/rt_set_action'; }
};
