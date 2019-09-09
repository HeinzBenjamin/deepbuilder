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

class se_adjust_fieldsize_yRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_adjust_fieldsize_yRequest
    // Serialize message field [value]
    bufferOffset = _serializer.int32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_adjust_fieldsize_yRequest
    let len;
    let data = new se_adjust_fieldsize_yRequest(null);
    // Deserialize message field [value]
    data.value = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_adjust_fieldsize_yRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3087778e93fcd34cc8d65bc54e850d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_adjust_fieldsize_yRequest(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

class se_adjust_fieldsize_yResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.oldValue = null;
      this.newValue = null;
    }
    else {
      if (initObj.hasOwnProperty('oldValue')) {
        this.oldValue = initObj.oldValue
      }
      else {
        this.oldValue = 0;
      }
      if (initObj.hasOwnProperty('newValue')) {
        this.newValue = initObj.newValue
      }
      else {
        this.newValue = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_adjust_fieldsize_yResponse
    // Serialize message field [oldValue]
    bufferOffset = _serializer.int32(obj.oldValue, buffer, bufferOffset);
    // Serialize message field [newValue]
    bufferOffset = _serializer.int32(obj.newValue, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_adjust_fieldsize_yResponse
    let len;
    let data = new se_adjust_fieldsize_yResponse(null);
    // Deserialize message field [oldValue]
    data.oldValue = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [newValue]
    data.newValue = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_adjust_fieldsize_yResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dc7d7c2d117e09b4a630c3701718d7d0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 oldValue
    int32 newValue
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_adjust_fieldsize_yResponse(null);
    if (msg.oldValue !== undefined) {
      resolved.oldValue = msg.oldValue;
    }
    else {
      resolved.oldValue = 0
    }

    if (msg.newValue !== undefined) {
      resolved.newValue = msg.newValue;
    }
    else {
      resolved.newValue = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: se_adjust_fieldsize_yRequest,
  Response: se_adjust_fieldsize_yResponse,
  md5sum() { return 'c347af19957c4bfd6fa7272ca95ca3d6'; },
  datatype() { return 'deepbuilder/se_adjust_fieldsize_y'; }
};
