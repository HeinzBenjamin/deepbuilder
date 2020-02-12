; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_get_joint_states-request.msg.html

(cl:defclass <ro_get_joint_states-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ro_get_joint_states-request (<ro_get_joint_states-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_joint_states-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_joint_states-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_joint_states-request> is deprecated: use deepbuilder-srv:ro_get_joint_states-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_joint_states-request>) ostream)
  "Serializes a message object of type '<ro_get_joint_states-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_joint_states-request>) istream)
  "Deserializes a message object of type '<ro_get_joint_states-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_joint_states-request>)))
  "Returns string type for a service object of type '<ro_get_joint_states-request>"
  "deepbuilder/ro_get_joint_statesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_joint_states-request)))
  "Returns string type for a service object of type 'ro_get_joint_states-request"
  "deepbuilder/ro_get_joint_statesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_joint_states-request>)))
  "Returns md5sum for a message object of type '<ro_get_joint_states-request>"
  "482cc7b23f4d6ca5e5aac26ecce1ce01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_joint_states-request)))
  "Returns md5sum for a message object of type 'ro_get_joint_states-request"
  "482cc7b23f4d6ca5e5aac26ecce1ce01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_joint_states-request>)))
  "Returns full string definition for message of type '<ro_get_joint_states-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_joint_states-request)))
  "Returns full string definition for message of type 'ro_get_joint_states-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_joint_states-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_joint_states-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_joint_states-request
))
;//! \htmlinclude ro_get_joint_states-response.msg.html

(cl:defclass <ro_get_joint_states-response> (roslisp-msg-protocol:ros-message)
  ((joint_states
    :reader joint_states
    :initarg :joint_states
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass ro_get_joint_states-response (<ro_get_joint_states-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_joint_states-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_joint_states-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_joint_states-response> is deprecated: use deepbuilder-srv:ro_get_joint_states-response instead.")))

(cl:ensure-generic-function 'joint_states-val :lambda-list '(m))
(cl:defmethod joint_states-val ((m <ro_get_joint_states-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:joint_states-val is deprecated.  Use deepbuilder-srv:joint_states instead.")
  (joint_states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_joint_states-response>) ostream)
  "Serializes a message object of type '<ro_get_joint_states-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_states) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_joint_states-response>) istream)
  "Deserializes a message object of type '<ro_get_joint_states-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_states) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_joint_states-response>)))
  "Returns string type for a service object of type '<ro_get_joint_states-response>"
  "deepbuilder/ro_get_joint_statesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_joint_states-response)))
  "Returns string type for a service object of type 'ro_get_joint_states-response"
  "deepbuilder/ro_get_joint_statesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_joint_states-response>)))
  "Returns md5sum for a message object of type '<ro_get_joint_states-response>"
  "482cc7b23f4d6ca5e5aac26ecce1ce01")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_joint_states-response)))
  "Returns md5sum for a message object of type 'ro_get_joint_states-response"
  "482cc7b23f4d6ca5e5aac26ecce1ce01")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_joint_states-response>)))
  "Returns full string definition for message of type '<ro_get_joint_states-response>"
  (cl:format cl:nil "sensor_msgs/JointState joint_states~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_joint_states-response)))
  "Returns full string definition for message of type 'ro_get_joint_states-response"
  (cl:format cl:nil "sensor_msgs/JointState joint_states~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_joint_states-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_states))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_joint_states-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_joint_states-response
    (cl:cons ':joint_states (joint_states msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_get_joint_states)))
  'ro_get_joint_states-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_get_joint_states)))
  'ro_get_joint_states-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_joint_states)))
  "Returns string type for a service object of type '<ro_get_joint_states>"
  "deepbuilder/ro_get_joint_states")