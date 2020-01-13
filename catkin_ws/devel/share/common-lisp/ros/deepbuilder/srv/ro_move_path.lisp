; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_move_path-request.msg.html

(cl:defclass <ro_move_path-request> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory)))
)

(cl:defclass ro_move_path-request (<ro_move_path-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_path-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_path-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_path-request> is deprecated: use deepbuilder-srv:ro_move_path-request instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <ro_move_path-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:path-val is deprecated.  Use deepbuilder-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_path-request>) ostream)
  "Serializes a message object of type '<ro_move_path-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_path-request>) istream)
  "Deserializes a message object of type '<ro_move_path-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_path-request>)))
  "Returns string type for a service object of type '<ro_move_path-request>"
  "deepbuilder/ro_move_pathRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_path-request)))
  "Returns string type for a service object of type 'ro_move_path-request"
  "deepbuilder/ro_move_pathRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_path-request>)))
  "Returns md5sum for a message object of type '<ro_move_path-request>"
  "8c34125c1c77b9e671e5d9698ccd6432")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_path-request)))
  "Returns md5sum for a message object of type 'ro_move_path-request"
  "8c34125c1c77b9e671e5d9698ccd6432")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_path-request>)))
  "Returns full string definition for message of type '<ro_move_path-request>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory path~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_path-request)))
  "Returns full string definition for message of type 'ro_move_path-request"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory path~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_path-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_path-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_path-request
    (cl:cons ':path (path msg))
))
;//! \htmlinclude ro_move_path-response.msg.html

(cl:defclass <ro_move_path-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_move_path-response (<ro_move_path-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_path-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_path-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_path-response> is deprecated: use deepbuilder-srv:ro_move_path-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_move_path-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_path-response>) ostream)
  "Serializes a message object of type '<ro_move_path-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_path-response>) istream)
  "Deserializes a message object of type '<ro_move_path-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_path-response>)))
  "Returns string type for a service object of type '<ro_move_path-response>"
  "deepbuilder/ro_move_pathResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_path-response)))
  "Returns string type for a service object of type 'ro_move_path-response"
  "deepbuilder/ro_move_pathResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_path-response>)))
  "Returns md5sum for a message object of type '<ro_move_path-response>"
  "8c34125c1c77b9e671e5d9698ccd6432")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_path-response)))
  "Returns md5sum for a message object of type 'ro_move_path-response"
  "8c34125c1c77b9e671e5d9698ccd6432")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_path-response>)))
  "Returns full string definition for message of type '<ro_move_path-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_path-response)))
  "Returns full string definition for message of type 'ro_move_path-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_path-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_path-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_path-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_move_path)))
  'ro_move_path-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_move_path)))
  'ro_move_path-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_path)))
  "Returns string type for a service object of type '<ro_move_path>"
  "deepbuilder/ro_move_path")