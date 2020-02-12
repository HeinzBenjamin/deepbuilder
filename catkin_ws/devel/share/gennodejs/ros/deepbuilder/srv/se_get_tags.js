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

class se_get_tagsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type se_get_tagsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_get_tagsRequest
    let len;
    let data = new se_get_tagsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_get_tagsRequest';
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
    const resolved = new se_get_tagsRequest(null);
    return resolved;
    }
};

class se_get_tagsResponse {
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
    // Serializes a message object of type se_get_tagsResponse
    // Serialize message field [tag_poses]
    bufferOffset = _arraySerializer.float32(obj.tag_poses, buffer, bufferOffset, null);
    // Serialize message field [types]
    bufferOffset = _arraySerializer.int8(obj.types, buffer, bufferOffset, null);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.int8(obj.ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_get_tagsResponse
    let len;
    let data = new se_get_tagsResponse(null);
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
    return 'deepbuilder/se_get_tagsResponse';
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
    const resolved = new se_get_tagsResponse(null);
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
  Request: se_get_tagsRequest,
  Response: se_get_tagsResponse,
  md5sum() { return 'ed7bb1e8d94ce303317cf11ef2ce623d'; },
  datatype() { return 'deepbuilder/se_get_tags'; }
};
