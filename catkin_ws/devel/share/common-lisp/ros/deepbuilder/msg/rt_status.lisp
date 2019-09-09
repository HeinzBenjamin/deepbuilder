; Auto-generated. Do not edit!


(cl:in-package deepbuilder-msg)


;//! \htmlinclude rt_status.msg.html

(cl:defclass <rt_status> (roslisp-msg-protocol:ros-message)
  ((gh_present
    :reader gh_present
    :initarg :gh_present
    :type cl:boolean
    :initform cl:nil)
   (agent_present
    :reader agent_present
    :initarg :agent_present
    :type cl:boolean
    :initform cl:nil)
   (ros_tick
    :reader ros_tick
    :initarg :ros_tick
    :type cl:integer
    :initform 0)
   (current_controller
    :reader current_controller
    :initarg :current_controller
    :type cl:string
    :initform "")
   (state
    :reader state
    :initarg :state
    :type my_msgs-msg:state
    :initform (cl:make-instance 'my_msgs-msg:state))
   (action
    :reader action
    :initarg :action
    :type my_msgs-msg:action
    :initform (cl:make-instance 'my_msgs-msg:action)))
)

(cl:defclass rt_status (<rt_status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-msg:<rt_status> is deprecated: use deepbuilder-msg:rt_status instead.")))

(cl:ensure-generic-function 'gh_present-val :lambda-list '(m))
(cl:defmethod gh_present-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:gh_present-val is deprecated.  Use deepbuilder-msg:gh_present instead.")
  (gh_present m))

(cl:ensure-generic-function 'agent_present-val :lambda-list '(m))
(cl:defmethod agent_present-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:agent_present-val is deprecated.  Use deepbuilder-msg:agent_present instead.")
  (agent_present m))

(cl:ensure-generic-function 'ros_tick-val :lambda-list '(m))
(cl:defmethod ros_tick-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:ros_tick-val is deprecated.  Use deepbuilder-msg:ros_tick instead.")
  (ros_tick m))

(cl:ensure-generic-function 'current_controller-val :lambda-list '(m))
(cl:defmethod current_controller-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:current_controller-val is deprecated.  Use deepbuilder-msg:current_controller instead.")
  (current_controller m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:state-val is deprecated.  Use deepbuilder-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <rt_status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-msg:action-val is deprecated.  Use deepbuilder-msg:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_status>) ostream)
  "Serializes a message object of type '<rt_status>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gh_present) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'agent_present) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'ros_tick)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'current_controller))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'current_controller))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_status>) istream)
  "Deserializes a message object of type '<rt_status>"
    (cl:setf (cl:slot-value msg 'gh_present) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'agent_present) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ros_tick) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'current_controller) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'current_controller) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_status>)))
  "Returns string type for a message object of type '<rt_status>"
  "deepbuilder/rt_status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_status)))
  "Returns string type for a message object of type 'rt_status"
  "deepbuilder/rt_status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_status>)))
  "Returns md5sum for a message object of type '<rt_status>"
  "72a571d7c6714cec7e8e029ca7689a9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_status)))
  "Returns md5sum for a message object of type 'rt_status"
  "72a571d7c6714cec7e8e029ca7689a9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_status>)))
  "Returns full string definition for message of type '<rt_status>"
  (cl:format cl:nil "#this should contain ALL information about the runtime~%bool gh_present~%bool agent_present~%int64 ros_tick~%string current_controller~%my_msgs/state state~%my_msgs/action action~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_status)))
  "Returns full string definition for message of type 'rt_status"
  (cl:format cl:nil "#this should contain ALL information about the runtime~%bool gh_present~%bool agent_present~%int64 ros_tick~%string current_controller~%my_msgs/state state~%my_msgs/action action~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_status>))
  (cl:+ 0
     1
     1
     8
     4 (cl:length (cl:slot-value msg 'current_controller))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_status>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_status
    (cl:cons ':gh_present (gh_present msg))
    (cl:cons ':agent_present (agent_present msg))
    (cl:cons ':ros_tick (ros_tick msg))
    (cl:cons ':current_controller (current_controller msg))
    (cl:cons ':state (state msg))
    (cl:cons ':action (action msg))
))
