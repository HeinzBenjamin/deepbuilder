// Auto-generated. Do not edit!

// (in-package deepbuilder.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let trajectory_msgs = _finder('trajectory_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class se_collect_tagsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.pairs = null;
      this.pair_lengths = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = new trajectory_msgs.msg.JointTrajectory();
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
    // Serializes a message object of type se_collect_tagsRequest
    // Serialize message field [path]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.path, buffer, bufferOffset);
    // Serialize message field [pairs]
    bufferOffset = _arraySerializer.int32(obj.pairs, buffer, bufferOffset, null);
    // Serialize message field [pair_lengths]
    bufferOffset = _arraySerializer.int32(obj.pair_lengths, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_collect_tagsRequest
    let len;
    let data = new se_collect_tagsRequest(null);
    // Deserialize message field [path]
    data.path = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [pairs]
    data.pairs = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [pair_lengths]
    data.pair_lengths = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.path);
    length += 4 * object.pairs.length;
    length += 4 * object.pair_lengths.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/se_collect_tagsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7e2f19fd4fa10637e10872463c286957';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    trajectory_msgs/JointTrajectory path
    int32[] pairs
    int32[] pair_lengths
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectoryPoint
    # Each trajectory point specifies either positions[, velocities[, accelerations]]
    # or positions[, effort] for the trajectory to be executed.
    # All specified values are in the same order as the joint names in JointTrajectory.msg
    
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] effort
    duration time_from_start
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new se_collect_tagsRequest(null);
    if (msg.path !== undefined) {
      resolved.path = trajectory_msgs.msg.JointTrajectory.Resolve(msg.path)
    }
    else {
      resolved.path = new trajectory_msgs.msg.JointTrajectory()
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

class se_collect_tagsResponse {
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
    // Serializes a message object of type se_collect_tagsResponse
    // Serialize message field [tag_poses]
    bufferOffset = _arraySerializer.float32(obj.tag_poses, buffer, bufferOffset, null);
    // Serialize message field [types]
    bufferOffset = _arraySerializer.int8(obj.types, buffer, bufferOffset, null);
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.int8(obj.ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type se_collect_tagsResponse
    let len;
    let data = new se_collect_tagsResponse(null);
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
    return 'deepbuilder/se_collect_tagsResponse';
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
    const resolved = new se_collect_tagsResponse(null);
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
  Request: se_collect_tagsRequest,
  Response: se_collect_tagsResponse,
  md5sum() { return '6a3bb97297abf73607870ea61a5466bd'; },
  datatype() { return 'deepbuilder/se_collect_tags'; }
};
