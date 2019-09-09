; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_get_state-request.msg.html

(cl:defclass <ro_get_state-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (tcp_mode
    :reader tcp_mode
    :initarg :tcp_mode
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ro_get_state-request (<ro_get_state-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_state-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_state-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_state-request> is deprecated: use deepbuilder-srv:ro_get_state-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_get_state-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'tcp_mode-val :lambda-list '(m))
(cl:defmethod tcp_mode-val ((m <ro_get_state-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:tcp_mode-val is deprecated.  Use deepbuilder-srv:tcp_mode instead.")
  (tcp_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_state-request>) ostream)
  "Serializes a message object of type '<ro_get_state-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tcp_mode) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_state-request>) istream)
  "Deserializes a message object of type '<ro_get_state-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'tcp_mode) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_state-request>)))
  "Returns string type for a service object of type '<ro_get_state-request>"
  "deepbuilder/ro_get_stateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_state-request)))
  "Returns string type for a service object of type 'ro_get_state-request"
  "deepbuilder/ro_get_stateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_state-request>)))
  "Returns md5sum for a message object of type '<ro_get_state-request>"
  "d02bed547f95931d877d3048b2328dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_state-request)))
  "Returns md5sum for a message object of type 'ro_get_state-request"
  "d02bed547f95931d877d3048b2328dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_state-request>)))
  "Returns full string definition for message of type '<ro_get_state-request>"
  (cl:format cl:nil "float32 speed~%bool tcp_mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_state-request)))
  "Returns full string definition for message of type 'ro_get_state-request"
  (cl:format cl:nil "float32 speed~%bool tcp_mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_state-request>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_state-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_state-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':tcp_mode (tcp_mode msg))
))
;//! \htmlinclude ro_get_state-response.msg.html

(cl:defclass <ro_get_state-response> (roslisp-msg-protocol:ros-message)
  ((boxes
    :reader boxes
    :initarg :boxes
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass ro_get_state-response (<ro_get_state-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_state-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_state-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_state-response> is deprecated: use deepbuilder-srv:ro_get_state-response instead.")))

(cl:ensure-generic-function 'boxes-val :lambda-list '(m))
(cl:defmethod boxes-val ((m <ro_get_state-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:boxes-val is deprecated.  Use deepbuilder-srv:boxes instead.")
  (boxes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_state-response>) ostream)
  "Serializes a message object of type '<ro_get_state-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'boxes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boxes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_state-response>) istream)
  "Deserializes a message object of type '<ro_get_state-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'boxes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'boxes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_state-response>)))
  "Returns string type for a service object of type '<ro_get_state-response>"
  "deepbuilder/ro_get_stateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_state-response)))
  "Returns string type for a service object of type 'ro_get_state-response"
  "deepbuilder/ro_get_stateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_state-response>)))
  "Returns md5sum for a message object of type '<ro_get_state-response>"
  "d02bed547f95931d877d3048b2328dcb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_state-response)))
  "Returns md5sum for a message object of type 'ro_get_state-response"
  "d02bed547f95931d877d3048b2328dcb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_state-response>)))
  "Returns full string definition for message of type '<ro_get_state-response>"
  (cl:format cl:nil "geometry_msgs/Pose[] boxes~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_state-response)))
  "Returns full string definition for message of type 'ro_get_state-response"
  (cl:format cl:nil "geometry_msgs/Pose[] boxes~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_state-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'boxes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_state-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_state-response
    (cl:cons ':boxes (boxes msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_get_state)))
  'ro_get_state-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_get_state)))
  'ro_get_state-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_state)))
  "Returns string type for a service object of type '<ro_get_state>"
  "deepbuilder/ro_get_state")