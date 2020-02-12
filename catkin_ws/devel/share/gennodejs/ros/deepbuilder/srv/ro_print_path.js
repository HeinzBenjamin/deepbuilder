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

class ro_print_pathRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action = null;
      this.first_way_point_joint_states = null;
      this.last_way_point_joint_states = null;
      this.way_points_cartesian = null;
      this.num_way_points = null;
    }
    else {
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = [];
      }
      if (initObj.hasOwnProperty('first_way_point_joint_states')) {
        this.first_way_point_joint_states = initObj.first_way_point_joint_states
      }
      else {
        this.first_way_point_joint_states = [];
      }
      if (initObj.hasOwnProperty('last_way_point_joint_states')) {
        this.last_way_point_joint_states = initObj.last_way_point_joint_states
      }
      else {
        this.last_way_point_joint_states = [];
      }
      if (initObj.hasOwnProperty('way_points_cartesian')) {
        this.way_points_cartesian = initObj.way_points_cartesian
      }
      else {
        this.way_points_cartesian = [];
      }
      if (initObj.hasOwnProperty('num_way_points')) {
        this.num_way_points = initObj.num_way_points
      }
      else {
        this.num_way_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_print_pathRequest
    // Serialize message field [action]
    bufferOffset = _arraySerializer.float32(obj.action, buffer, bufferOffset, null);
    // Serialize message field [first_way_point_joint_states]
    bufferOffset = _arraySerializer.float32(obj.first_way_point_joint_states, buffer, bufferOffset, null);
    // Serialize message field [last_way_point_joint_states]
    bufferOffset = _arraySerializer.float32(obj.last_way_point_joint_states, buffer, bufferOffset, null);
    // Serialize message field [way_points_cartesian]
    bufferOffset = _arraySerializer.float32(obj.way_points_cartesian, buffer, bufferOffset, null);
    // Serialize message field [num_way_points]
    bufferOffset = _arraySerializer.int32(obj.num_way_points, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_print_pathRequest
    let len;
    let data = new ro_print_pathRequest(null);
    // Deserialize message field [action]
    data.action = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [first_way_point_joint_states]
    data.first_way_point_joint_states = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [last_way_point_joint_states]
    data.last_way_point_joint_states = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [way_points_cartesian]
    data.way_points_cartesian = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [num_way_points]
    data.num_way_points = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.action.length;
    length += 4 * object.first_way_point_joint_states.length;
    length += 4 * object.last_way_point_joint_states.length;
    length += 4 * object.way_points_cartesian.length;
    length += 4 * object.num_way_points.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_print_pathRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '16cb147f05ae29049d654390e66585d9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] action
    float32[] first_way_point_joint_states
    float32[] last_way_point_joint_states
    float32[] way_points_cartesian
    int32[] num_way_points
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_print_pathRequest(null);
    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = []
    }

    if (msg.first_way_point_joint_states !== undefined) {
      resolved.first_way_point_joint_states = msg.first_way_point_joint_states;
    }
    else {
      resolved.first_way_point_joint_states = []
    }

    if (msg.last_way_point_joint_states !== undefined) {
      resolved.last_way_point_joint_states = msg.last_way_point_joint_states;
    }
    else {
      resolved.last_way_point_joint_states = []
    }

    if (msg.way_points_cartesian !== undefined) {
      resolved.way_points_cartesian = msg.way_points_cartesian;
    }
    else {
      resolved.way_points_cartesian = []
    }

    if (msg.num_way_points !== undefined) {
      resolved.num_way_points = msg.num_way_points;
    }
    else {
      resolved.num_way_points = []
    }

    return resolved;
    }
};

class ro_print_pathResponse {
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
    // Serializes a message object of type ro_print_pathResponse
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_print_pathResponse
    let len;
    let data = new ro_print_pathResponse(null);
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
    return 'deepbuilder/ro_print_pathResponse';
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
    const resolved = new ro_print_pathResponse(null);
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
  Request: ro_print_pathRequest,
  Response: ro_print_pathResponse,
  md5sum() { return 'ed58a50dbb7811f85489d43aa932223a'; },
  datatype() { return 'deepbuilder/ro_print_path'; }
};
