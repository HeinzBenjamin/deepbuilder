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

class se_collect_stateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.poses = null;
      this.pairs = null;
      this.pair_lengths = null;
    }
    else {
      if (initObj.hasOwnProperty('poses')) {
        this.poses = initObj.poses
      }
      else {
        this.poses = [];
      }
      if (initObj.hasOwnProperty('pairs')) {
        this.pairs = initObj.pairs
      }
      else {
        this.pairs = [];
      }
      if (initObj.hasOwnProperty('pair_lengths')) {
        this.pair_lengths = initObj.pair_lengths
      }
      else {
        this.pair_lengths = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_collect_stateRequest
    // Serialize message field [poses]
    bufferOffset = _arraySerializer.float32(obj.poses, buffer, bufferOffset, null);
    // Serialize message field [pairs]
    bufferOffset = _arraySerializer.int32(obj.pairs, buffer, bufferOffset, null);
    // Serialize message field [pair_lengths]
    bufferOffset = _arraySerializer.int32(obj.pair_lengths, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_collect_stateRequest
    let len;
    let data = new se_collect_stateRequest(null);
    // Deserialize message field [poses]
    data.poses = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [pairs]
    data.pairs = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [pair_lengths]
    data.pair_lengths = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.poses.length;
    length += 4 * object.pairs.length;
    length += 4 * object.pair_lengths.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_collect_stateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0a2d8bbcfc4f9ed8bd886393d1b75193';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] poses
    int32[] pairs
    int32[] pair_lengths
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_collect_stateRequest(null);
    if (msg.poses !== undefined) {
      resolved.poses = msg.poses;
    }
    else {
      resolved.poses = []
    }

    if (msg.pairs !== undefined) {
      resolved.pairs = msg.pairs;
    }
    else {
      resolved.pairs = []
    }

    if (msg.pair_lengths !== undefined) {
      resolved.pair_lengths = msg.pair_lengths;
    }
    else {
      resolved.pair_lengths = []
    }

    return resolved;
    }
};

class se_collect_stateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tag_poses = null;
      this.types = null;
      this.ids = null;
    }
    else {
      if (initObj.hasOwnProperty('tag_poses')) {
        this.tag_poses = initObj.tag_poses
      }
      else {
        this.tag_poses = [];
      }
      if (initObj.hasOwnProperty('types')) {
        this.types = initObj.types
      }
      else {
        this.types = [];
      }
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_collect_stateResponse
    // Serialize message field [tag_poses]
    bufferOffset = _arraySerializer.float32(obj.tag_poses, buffer, bufferOffset, null);
    // Serialize message field [types]
    bufferOffset = _arraySerializer.int8(obj.types, buffer, bufferOffset, null);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.int8(obj.ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_collect_stateResponse
    let len;
    let data = new se_collect_stateResponse(null);
    // Deserialize message field [tag_poses]
    data.tag_poses = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [types]
    data.types = _arrayDeserializer.int8(buffer, bufferOffset, null)
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.int8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.tag_poses.length;
    length += object.types.length;
    length += object.ids.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_collect_stateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed7bb1e8d94ce303317cf11ef2ce623d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] tag_poses
    int8[] types
    int8[] ids
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_collect_stateResponse(null);
    if (msg.tag_poses !== undefined) {
      resolved.tag_poses = msg.tag_poses;
    }
    else {
      resolved.tag_poses = []
    }

    if (msg.types !== undefined) {
      resolved.types = msg.types;
    }
    else {
      resolved.types = []
    }

    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    return resolved;
    }
};

module.exports = {
  Request: se_collect_stateRequest,
  Response: se_collect_stateResponse,
  md5sum() { return '83f15a0a65a3dcd57be2f47c0135c2de'; },
  datatype() { return 'deepbuilder/se_collect_state'; }
};
