// Auto-generated. Do not edit!

// (in-package my_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class action {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.A0 = null;
      this.A1 = null;
      this.A2 = null;
      this.A3 = null;
      this.A4 = null;
      this.A5 = null;
      this.A6 = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('A0')) {
        this.A0 = initObj.A0
      }
      else {
        this.A0 = 0.0;
      }
      if (initObj.hasOwnProperty('A1')) {
        this.A1 = initObj.A1
      }
      else {
        this.A1 = 0.0;
      }
      if (initObj.hasOwnProperty('A2')) {
        this.A2 = initObj.A2
      }
      else {
        this.A2 = 0.0;
      }
      if (initObj.hasOwnProperty('A3')) {
        this.A3 = initObj.A3
      }
      else {
        this.A3 = 0.0;
      }
      if (initObj.hasOwnProperty('A4')) {
        this.A4 = initObj.A4
      }
      else {
        this.A4 = 0.0;
      }
      if (initObj.hasOwnProperty('A5')) {
        this.A5 = initObj.A5
      }
      else {
        this.A5 = 0.0;
      }
      if (initObj.hasOwnProperty('A6')) {
        this.A6 = initObj.A6
      }
      else {
        this.A6 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type action
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [A0]
    bufferOffset = _serializer.float32(obj.A0, buffer, bufferOffset);
    // Serialize message field [A1]
    bufferOffset = _serializer.float32(obj.A1, buffer, bufferOffset);
    // Serialize message field [A2]
    bufferOffset = _serializer.float32(obj.A2, buffer, bufferOffset);
    // Serialize message field [A3]
    bufferOffset = _serializer.float32(obj.A3, buffer, bufferOffset);
    // Serialize message field [A4]
    bufferOffset = _serializer.float32(obj.A4, buffer, bufferOffset);
    // Serialize message field [A5]
    bufferOffset = _serializer.float32(obj.A5, buffer, bufferOffset);
    // Serialize message field [A6]
    bufferOffset = _serializer.float32(obj.A6, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type action
    let len;
    let data = new action(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [A0]
    data.A0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A1]
    data.A1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A2]
    data.A2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A3]
    data.A3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A4]
    data.A4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A5]
    data.A5 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [A6]
    data.A6 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.id.length;
    return length + 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_msgs/action';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c40b50724540a881a54a2f96dfd06062';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string id
    float32 A0
    float32 A1
    float32 A2
    float32 A3
    float32 A4
    float32 A5
    float32 A6
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new action(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.A0 !== undefined) {
      resolved.A0 = msg.A0;
    }
    else {
      resolved.A0 = 0.0
    }

    if (msg.A1 !== undefined) {
      resolved.A1 = msg.A1;
    }
    else {
      resolved.A1 = 0.0
    }

    if (msg.A2 !== undefined) {
      resolved.A2 = msg.A2;
    }
    else {
      resolved.A2 = 0.0
    }

    if (msg.A3 !== undefined) {
      resolved.A3 = msg.A3;
    }
    else {
      resolved.A3 = 0.0
    }

    if (msg.A4 !== undefined) {
      resolved.A4 = msg.A4;
    }
    else {
      resolved.A4 = 0.0
    }

    if (msg.A5 !== undefined) {
      resolved.A5 = msg.A5;
    }
    else {
      resolved.A5 = 0.0
    }

    if (msg.A6 !== undefined) {
      resolved.A6 = msg.A6;
    }
    else {
      resolved.A6 = 0.0
    }

    return resolved;
    }
};

module.exports = action;
