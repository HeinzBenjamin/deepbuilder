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

class ro_plan_pathRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_pose = null;
      this.state_pose = null;
      this.session = null;
      this.speed = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_pose')) {
        this.goal_pose = initObj.goal_pose
      }
      else {
        this.goal_pose = [];
      }
      if (initObj.hasOwnProperty('state_pose')) {
        this.state_pose = initObj.state_pose
      }
      else {
        this.state_pose = [];
      }
      if (initObj.hasOwnProperty('session')) {
        this.session = initObj.session
      }
      else {
        this.session = '';
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
    // Serializes a message object of type ro_plan_pathRequest
    // Serialize message field [goal_pose]
    bufferOffset = _arraySerializer.float32(obj.goal_pose, buffer, bufferOffset, null);
    // Serialize message field [state_pose]
    bufferOffset = _arraySerializer.float32(obj.state_pose, buffer, bufferOffset, null);
    // Serialize message field [session]
    bufferOffset = _serializer.string(obj.session, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float32(obj.speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_plan_pathRequest
    let len;
    let data = new ro_plan_pathRequest(null);
    // Deserialize message field [goal_pose]
    data.goal_pose = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [state_pose]
    data.state_pose = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [session]
    data.session = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.goal_pose.length;
    length += 4 * object.state_pose.length;
    length += object.session.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_plan_pathRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aa87f6dd8f0618d14c9e8d2e5bd2c91c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] goal_pose
    float32[] state_pose
    string session
    float32 speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ro_plan_pathRequest(null);
    if (msg.goal_pose !== undefined) {
      resolved.goal_pose = msg.goal_pose;
    }
    else {
      resolved.goal_pose = []
    }

    if (msg.state_pose !== undefined) {
      resolved.state_pose = msg.state_pose;
    }
    else {
      resolved.state_pose = []
    }

    if (msg.session !== undefined) {
      resolved.session = msg.session;
    }
    else {
      resolved.session = ''
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

class ro_plan_pathResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.collisions = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = new trajectory_msgs.msg.JointTrajectory();
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
    // Serializes a message object of type ro_plan_pathResponse
    // Serialize message field [path]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.path, buffer, bufferOffset);
    // Serialize message field [collisions]
    bufferOffset = _arraySerializer.bool(obj.collisions, buffer, bufferOffset, null);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ro_plan_pathResponse
    let len;
    let data = new ro_plan_pathResponse(null);
    // Deserialize message field [path]
    data.path = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [collisions]
    data.collisions = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.path);
    length += object.collisions.length;
    length += object.message.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'deepbuilder/ro_plan_pathResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e8ee0855aadc4b6691c3e96847c5833b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    trajectory_msgs/JointTrajectory path
    
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
    const resolved = new ro_plan_pathResponse(null);
    if (msg.path !== undefined) {
      resolved.path = trajectory_msgs.msg.JointTrajectory.Resolve(msg.path)
    }
    else {
      resolved.path = new trajectory_msgs.msg.JointTrajectory()
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
  Request: ro_plan_pathRequest,
  Response: ro_plan_pathResponse,
  md5sum() { return '6bb18060add6f8092d505a812c13f49f'; },
  datatype() { return 'deepbuilder/ro_plan_path'; }
};
