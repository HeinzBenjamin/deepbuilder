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

class ro_update_compressed_meshRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vertices = null;
      this.indices = null;
      this.session = null;
    }
    else {
      if (initObj.hasOwnProperty('vertices')) {
        this.vertices = initObj.vertices
      }
      else {
        this.vertices = [];
      }
      if (initObj.hasOwnProperty('indices')) {
        this.indices = initObj.indices
      }
      else {
        this.indices = [];
      }
      if (initObj.hasOwnProperty('session')) {
        this.session = initObj.session
      }
      else {
        this.session = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_update_compressed_meshRequest
    // Serialize message field [vertices]
    bufferOffset = _arraySerializer.float32(obj.vertices, buffer, bufferOffset, null);
    // Serialize message field [indices]
    bufferOffset = _arraySerializer.int32(obj.indices, buffer, bufferOffset, null);
    // Serialize message field [session]
    bufferOffset = _serializer.string(obj.session, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_update_compressed_meshRequest
    let len;
    let data = new ro_update_compressed_meshRequest(null);
    // Deserialize message field [vertices]
    data.vertices = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [indices]
    data.indices = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [session]
    data.session = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.vertices.length;
    length += 4 * object.indices.length;
    length += object.session.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_update_compressed_meshRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d613adb849ca8d48a02e1057248cd10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] vertices
    int32[] indices
    string session
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_update_compressed_meshRequest(null);
    if (msg.vertices !== undefined) {
      resolved.vertices = msg.vertices;
    }
    else {
      resolved.vertices = []
    }

    if (msg.indices !== undefined) {
      resolved.indices = msg.indices;
    }
    else {
      resolved.indices = []
    }

    if (msg.session !== undefined) {
      resolved.session = msg.session;
    }
    else {
      resolved.session = ''
    }

    return resolved;
    }
};

class ro_update_compressed_meshResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_update_compressed_meshResponse
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_update_compressed_meshResponse
    let len;
    let data = new ro_update_compressed_meshResponse(null);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_update_compressed_meshResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5f003d6bcc824cbd51361d66d8e4f76c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_update_compressed_meshResponse(null);
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
  Request: ro_update_compressed_meshRequest,
  Response: ro_update_compressed_meshResponse,
  md5sum() { return '230cfe3cf22bf1c93dac2ac217ea4d24'; },
  datatype() { return 'deepbuilder/ro_update_compressed_mesh'; }
};
