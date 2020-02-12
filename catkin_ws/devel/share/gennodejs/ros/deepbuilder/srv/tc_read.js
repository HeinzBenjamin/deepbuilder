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

class tc_readRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.var_names = null;
      this.types = null;
    }
    else {
      if (initObj.hasOwnProperty('var_names')) {
        this.var_names = initObj.var_names
      }
      else {
        this.var_names = [];
      }
      if (initObj.hasOwnProperty('types')) {
        this.types = initObj.types
      }
      else {
        this.types = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tc_readRequest
    // Serialize message field [var_names]
    bufferOffset = _arraySerializer.string(obj.var_names, buffer, bufferOffset, null);
    // Serialize message field [types]
    bufferOffset = _arraySerializer.string(obj.types, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tc_readRequest
    let len;
    let data = new tc_readRequest(null);
    // Deserialize message field [var_names]
    data.var_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [types]
    data.types = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.var_names.forEach((val) => {
      length += 4 + val.length;
    });
    object.types.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/tc_readRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd9ba12d2cc3fe473cf2d6f2f45e4da70';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] var_names
    string[] types
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tc_readRequest(null);
    if (msg.var_names !== undefined) {
      resolved.var_names = msg.var_names;
    }
    else {
      resolved.var_names = []
    }

    if (msg.types !== undefined) {
      resolved.types = msg.types;
    }
    else {
      resolved.types = []
    }

    return resolved;
    }
};

class tc_readResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.values = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('values')) {
        this.values = initObj.values
      }
      else {
        this.values = [];
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type tc_readResponse
    // Serialize message field [values]
    bufferOffset = _arraySerializer.string(obj.values, buffer, bufferOffset, null);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type tc_readResponse
    let len;
    let data = new tc_readResponse(null);
    // Deserialize message field [values]
    data.values = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.values.forEach((val) => {
      length += 4 + val.length;
    });
    length += object.message.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/tc_readResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a840b59ae86ad53486abde4339cc2135';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] values
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new tc_readResponse(null);
    if (msg.values !== undefined) {
      resolved.values = msg.values;
    }
    else {
      resolved.values = []
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: tc_readRequest,
  Response: tc_readResponse,
  md5sum() { return '7848c669d219de11243ab460d9130d88'; },
  datatype() { return 'deepbuilder/tc_read'; }
};
