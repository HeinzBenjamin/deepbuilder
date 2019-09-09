; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_set_state-request.msg.html

(cl:defclass <rt_set_state-request> (roslisp-msg-protocol:ros-message)
  ((controller
    :reader controller
    :initarg :controller
    :type cl:string
    :initform "")
   (state
    :reader state
    :initarg :state
    :type my_msgs-msg:state
    :initform (cl:make-instance 'my_msgs-msg:state)))
)

(cl:defclass rt_set_state-request (<rt_set_state-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_state-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_state-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_state-request> is deprecated: use deepbuilder-srv:rt_set_state-request instead.")))

(cl:ensure-generic-function 'controller-val :lambda-list '(m))
(cl:defmethod controller-val ((m <rt_set_state-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:controller-val is deprecated.  Use deepbuilder-srv:controller instead.")
  (controller m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <rt_set_state-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:state-val is deprecated.  Use deepbuilder-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_state-request>) ostream)
  "Serializes a message object of type '<rt_set_state-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'controller))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'controller))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_state-request>) istream)
  "Deserializes a message object of type '<rt_set_state-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'controller) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'controller) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_state-request>)))
  "Returns string type for a service object of type '<rt_set_state-request>"
  "deepbuilder/rt_set_stateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_state-request)))
  "Returns string type for a service object of type 'rt_set_state-request"
  "deepbuilder/rt_set_stateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_state-request>)))
  "Returns md5sum for a message object of type '<rt_set_state-request>"
  "32b4089e124a4eaa45ecb040a983b2cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_state-request)))
  "Returns md5sum for a message object of type 'rt_set_state-request"
  "32b4089e124a4eaa45ecb040a983b2cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_state-request>)))
  "Returns full string definition for message of type '<rt_set_state-request>"
  (cl:format cl:nil "string controller~%my_msgs/state state~%~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_state-request)))
  "Returns full string definition for message of type 'rt_set_state-request"
  (cl:format cl:nil "string controller~%my_msgs/state state~%~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_state-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'controller))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_state-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_state-request
    (cl:cons ':controller (controller msg))
    (cl:cons ':state (state msg))
))
;//! \htmlinclude rt_set_state-response.msg.html

(cl:defclass <rt_set_state-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rt_set_state-response (<rt_set_state-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_state-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_state-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_state-response> is deprecated: use deepbuilder-srv:rt_set_state-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_state-response>) ostream)
  "Serializes a message object of type '<rt_set_state-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_state-response>) istream)
  "Deserializes a message object of type '<rt_set_state-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_state-response>)))
  "Returns string type for a service object of type '<rt_set_state-response>"
  "deepbuilder/rt_set_stateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_state-response)))
  "Returns string type for a service object of type 'rt_set_state-response"
  "deepbuilder/rt_set_stateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_state-response>)))
  "Returns md5sum for a message object of type '<rt_set_state-response>"
  "32b4089e124a4eaa45ecb040a983b2cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_state-response)))
  "Returns md5sum for a message object of type 'rt_set_state-response"
  "32b4089e124a4eaa45ecb040a983b2cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_state-response>)))
  "Returns full string definition for message of type '<rt_set_state-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_state-response)))
  "Returns full string definition for message of type 'rt_set_state-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_state-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_state-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_state-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_set_state)))
  'rt_set_state-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_set_state)))
  'rt_set_state-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_state)))
  "Returns string type for a service object of type '<rt_set_state>"
  "deepbuilder/rt_set_state")