; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_plan_motion-request.msg.html

(cl:defclass <ro_plan_motion-request> (roslisp-msg-protocol:ros-message)
  ((first_point_joint_states
    :reader first_point_joint_states
    :initarg :first_point_joint_states
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (way_points
    :reader way_points
    :initarg :way_points
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass ro_plan_motion-request (<ro_plan_motion-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_plan_motion-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_plan_motion-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_plan_motion-request> is deprecated: use deepbuilder-srv:ro_plan_motion-request instead.")))

(cl:ensure-generic-function 'first_point_joint_states-val :lambda-list '(m))
(cl:defmethod first_point_joint_states-val ((m <ro_plan_motion-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:first_point_joint_states-val is deprecated.  Use deepbuilder-srv:first_point_joint_states instead.")
  (first_point_joint_states m))

(cl:ensure-generic-function 'way_points-val :lambda-list '(m))
(cl:defmethod way_points-val ((m <ro_plan_motion-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:way_points-val is deprecated.  Use deepbuilder-srv:way_points instead.")
  (way_points m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_plan_motion-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_plan_motion-request>) ostream)
  "Serializes a message object of type '<ro_plan_motion-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'first_point_joint_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'first_point_joint_states))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'way_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'way_points))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_plan_motion-request>) istream)
  "Deserializes a message object of type '<ro_plan_motion-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'first_point_joint_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'first_point_joint_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'way_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'way_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_plan_motion-request>)))
  "Returns string type for a service object of type '<ro_plan_motion-request>"
  "deepbuilder/ro_plan_motionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_plan_motion-request)))
  "Returns string type for a service object of type 'ro_plan_motion-request"
  "deepbuilder/ro_plan_motionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_plan_motion-request>)))
  "Returns md5sum for a message object of type '<ro_plan_motion-request>"
  "79a5a45e866664a192667e3d0dcdaa5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_plan_motion-request)))
  "Returns md5sum for a message object of type 'ro_plan_motion-request"
  "79a5a45e866664a192667e3d0dcdaa5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_plan_motion-request>)))
  "Returns full string definition for message of type '<ro_plan_motion-request>"
  (cl:format cl:nil "float32[] first_point_joint_states~%float32[] way_points~%float32 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_plan_motion-request)))
  "Returns full string definition for message of type 'ro_plan_motion-request"
  (cl:format cl:nil "float32[] first_point_joint_states~%float32[] way_points~%float32 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_plan_motion-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'first_point_joint_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'way_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_plan_motion-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_plan_motion-request
    (cl:cons ':first_point_joint_states (first_point_joint_states msg))
    (cl:cons ':way_points (way_points msg))
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude ro_plan_motion-response.msg.html

(cl:defclass <ro_plan_motion-response> (roslisp-msg-protocol:ros-message)
  ((motion_plan
    :reader motion_plan
    :initarg :motion_plan
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (collisions
    :reader collisions
    :initarg :collisions
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil))
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_plan_motion-response (<ro_plan_motion-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_plan_motion-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_plan_motion-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_plan_motion-response> is deprecated: use deepbuilder-srv:ro_plan_motion-response instead.")))

(cl:ensure-generic-function 'motion_plan-val :lambda-list '(m))
(cl:defmethod motion_plan-val ((m <ro_plan_motion-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:motion_plan-val is deprecated.  Use deepbuilder-srv:motion_plan instead.")
  (motion_plan m))

(cl:ensure-generic-function 'collisions-val :lambda-list '(m))
(cl:defmethod collisions-val ((m <ro_plan_motion-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:collisions-val is deprecated.  Use deepbuilder-srv:collisions instead.")
  (collisions m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_plan_motion-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_plan_motion-response>) ostream)
  "Serializes a message object of type '<ro_plan_motion-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'motion_plan) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'collisions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'collisions))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_plan_motion-response>) istream)
  "Deserializes a message object of type '<ro_plan_motion-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'motion_plan) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'collisions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'collisions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_plan_motion-response>)))
  "Returns string type for a service object of type '<ro_plan_motion-response>"
  "deepbuilder/ro_plan_motionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_plan_motion-response)))
  "Returns string type for a service object of type 'ro_plan_motion-response"
  "deepbuilder/ro_plan_motionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_plan_motion-response>)))
  "Returns md5sum for a message object of type '<ro_plan_motion-response>"
  "79a5a45e866664a192667e3d0dcdaa5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_plan_motion-response)))
  "Returns md5sum for a message object of type 'ro_plan_motion-response"
  "79a5a45e866664a192667e3d0dcdaa5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_plan_motion-response>)))
  "Returns full string definition for message of type '<ro_plan_motion-response>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory motion_plan~%~%bool[] collisions~%string message~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_plan_motion-response)))
  "Returns full string definition for message of type 'ro_plan_motion-response"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory motion_plan~%~%bool[] collisions~%string message~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_plan_motion-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'motion_plan))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'collisions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_plan_motion-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_plan_motion-response
    (cl:cons ':motion_plan (motion_plan msg))
    (cl:cons ':collisions (collisions msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_plan_motion)))
  'ro_plan_motion-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_plan_motion)))
  'ro_plan_motion-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_plan_motion)))
  "Returns string type for a service object of type '<ro_plan_motion>"
  "deepbuilder/ro_plan_motion")