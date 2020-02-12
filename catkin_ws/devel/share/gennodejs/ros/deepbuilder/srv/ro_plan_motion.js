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

let trajectory_msgs = _finder('trajectory_msgs');

//-----------------------------------------------------------

class ro_plan_motionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.first_point_joint_states = null;
      this.way_points = null;
      this.speed = null;
    }
    else {
      if (initObj.hasOwnProperty('first_point_joint_states')) {
        this.first_point_joint_states = initObj.first_point_joint_states
      }
      else {
        this.first_point_joint_states = [];
      }
      if (initObj.hasOwnProperty('way_points')) {
        this.way_points = initObj.way_points
      }
      else {
        this.way_points = [];
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ro_plan_motionRequest
    // Serialize message field [first_point_joint_states]
    bufferOffset = _arraySerializer.float32(obj.first_point_joint_states, buffer, bufferOffset, null);
    // Serialize message field [way_points]
    bufferOffset = _arraySerializer.float32(obj.way_points, buffer, bufferOffset, null);
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_plan_motionRequest
    let len;
    let data = new ro_plan_motionRequest(null);
    // Deserialize message field [first_point_joint_states]
    data.first_point_joint_states = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [way_points]
    data.way_points = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.first_point_joint_states.length;
    length += 4 * object.way_points.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_plan_motionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a5e1103996b2665386a0e743d1712fe5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] first_point_joint_states
    float32[] way_points
    float32 speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_plan_motionRequest(null);
    if (msg.first_point_joint_states !== undefined) {
      resolved.first_point_joint_states = msg.first_point_joint_states;
    }
    else {
      resolved.first_point_joint_states = []
    }

    if (msg.way_points !== undefined) {
      resolved.way_points = msg.way_points;
    }
    else {
      resolved.way_points = []
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    return resolved;
    }
};

class ro_plan_motionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motion_plan = null;
      this.collisions = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('motion_plan')) {
        this.motion_plan = initObj.motion_plan
      }
      else {
        this.motion_plan = new trajectory_msgs.msg.JointTrajectory();
      }
      if (initObj.hasOwnProperty('collisions')) {
        this.collisions = initObj.collisions
      }
      else {
        this.collisions = [];
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
    // Serializes a message object of type ro_plan_motionResponse
    // Serialize message field [motion_plan]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.motion_plan, buffer, bufferOffset);
    // Serialize message field [collisions]
    bufferOffset = _arraySerializer.bool(obj.collisions, buffer, bufferOffset, null);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_plan_motionResponse
    let len;
    let data = new ro_plan_motionResponse(null);
    // Deserialize message field [motion_plan]
    data.motion_plan = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [collisions]
    data.collisions = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.motion_plan);
    length += object.collisions.length;
    length += object.message.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_plan_motionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5eacc727a54fe39f63d68b3d3f9a475e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    trajectory_msgs/JointTrajectory motion_plan
    
    bool[] collisions
    string message
    
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
    const resolved = new ro_plan_motionResponse(null);
    if (msg.motion_plan !== undefined) {
      resolved.motion_plan = trajectory_msgs.msg.JointTrajectory.Resolve(msg.motion_plan)
    }
    else {
      resolved.motion_plan = new trajectory_msgs.msg.JointTrajectory()
    }

    if (msg.collisions !== undefined) {
      resolved.collisions = msg.collisions;
    }
    else {
      resolved.collisions = []
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
  Request: ro_plan_motionRequest,
  Response: ro_plan_motionResponse,
  md5sum() { return '79a5a45e866664a192667e3d0dcdaa5f'; },
  datatype() { return 'deepbuilder/ro_plan_motion'; }
};
