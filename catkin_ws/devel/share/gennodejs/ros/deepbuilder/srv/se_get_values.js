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

let my_msgs = _finder('my_msgs');

//-----------------------------------------------------------

class se_get_valuesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_get_valuesRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_get_valuesRequest
    let len;
    let data = new se_get_valuesRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_get_valuesRequest';
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
    const resolved = new se_get_valuesRequest(null);
    return resolved;
    }
};

class se_get_valuesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.values = null;
    }
    else {
      if (initObj.hasOwnProperty('values')) {
        this.values = initObj.values
      }
      else {
        this.values = new my_msgs.msg.float_array();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_get_valuesResponse
    // Serialize message field [values]
    bufferOffset = my_msgs.msg.float_array.serialize(obj.values, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_get_valuesResponse
    let len;
    let data = new se_get_valuesResponse(null);
    // Deserialize message field [values]
    data.values = my_msgs.msg.float_array.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += my_msgs.msg.float_array.getMessageSize(object.values);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_get_valuesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'afc255e103ebf1fda6e279c644d870f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    my_msgs/float_array values
    
    ================================================================================
    MSG: my_msgs/float_array
    float32[] values
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_get_valuesResponse(null);
    if (msg.values !== undefined) {
      resolved.values = my_msgs.msg.float_array.Resolve(msg.values)
    }
    else {
      resolved.values = new my_msgs.msg.float_array()
    }

    return resolved;
    }
};

module.exports = {
  Request: se_get_valuesRequest,
  Response: se_get_valuesResponse,
  md5sum() { return 'afc255e103ebf1fda6e279c644d870f5'; },
  datatype() { return 'deepbuilder/se_get_values'; }
};
