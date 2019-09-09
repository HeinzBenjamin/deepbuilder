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

class se_adjust_correctionRequest {
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
        this.value = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_adjust_correctionRequest
    // Serialize message field [value]
    bufferOffset = _serializer.float32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_adjust_correctionRequest
    let len;
    let data = new se_adjust_correctionRequest(null);
    // Deserialize message field [value]
    data.value = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_adjust_correctionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0aca93dcf6d857f0e5a0dc6be1eaa9fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_adjust_correctionRequest(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0.0
    }

    return resolved;
    }
};

class se_adjust_correctionResponse {
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
        this.oldValue = 0.0;
      }
      if (initObj.hasOwnProperty('newValue')) {
        this.newValue = initObj.newValue
      }
      else {
        this.newValue = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_adjust_correctionResponse
    // Serialize message field [oldValue]
    bufferOffset = _serializer.float32(obj.oldValue, buffer, bufferOffset);
    // Serialize message field [newValue]
    bufferOffset = _serializer.float32(obj.newValue, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_adjust_correctionResponse
    let len;
    let data = new se_adjust_correctionResponse(null);
    // Deserialize message field [oldValue]
    data.oldValue = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [newValue]
    data.newValue = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_adjust_correctionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e13eef18f307d4feb1d75adc9353151a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 oldValue
    float32 newValue
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_adjust_correctionResponse(null);
    if (msg.oldValue !== undefined) {
      resolved.oldValue = msg.oldValue;
    }
    else {
      resolved.oldValue = 0.0
    }

    if (msg.newValue !== undefined) {
      resolved.newValue = msg.newValue;
    }
    else {
      resolved.newValue = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: se_adjust_correctionRequest,
  Response: se_adjust_correctionResponse,
  md5sum() { return 'cd2ed50a53af7332f044c9ff74dcb9ee'; },
  datatype() { return 'deepbuilder/se_adjust_correction'; }
};
