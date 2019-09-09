; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_gripper_setspeed-request.msg.html

(cl:defclass <ro_gripper_setspeed-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0))
)

(cl:defclass ro_gripper_setspeed-request (<ro_gripper_setspeed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_setspeed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_setspeed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_setspeed-request> is deprecated: use deepbuilder-srv:ro_gripper_setspeed-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_gripper_setspeed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_setspeed-request>) ostream)
  "Serializes a message object of type '<ro_gripper_setspeed-request>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_setspeed-request>) istream)
  "Deserializes a message object of type '<ro_gripper_setspeed-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_setspeed-request>)))
  "Returns string type for a service object of type '<ro_gripper_setspeed-request>"
  "deepbuilder/ro_gripper_setspeedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_setspeed-request)))
  "Returns string type for a service object of type 'ro_gripper_setspeed-request"
  "deepbuilder/ro_gripper_setspeedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_setspeed-request>)))
  "Returns md5sum for a message object of type '<ro_gripper_setspeed-request>"
  "53122cc92cfbc917935bb064451b2b06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_setspeed-request)))
  "Returns md5sum for a message object of type 'ro_gripper_setspeed-request"
  "53122cc92cfbc917935bb064451b2b06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_setspeed-request>)))
  "Returns full string definition for message of type '<ro_gripper_setspeed-request>"
  (cl:format cl:nil "int32 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_setspeed-request)))
  "Returns full string definition for message of type 'ro_gripper_setspeed-request"
  (cl:format cl:nil "int32 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_setspeed-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_setspeed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_setspeed-request
    (cl:cons ':speed (speed msg))
))
;//! \htmlinclude ro_gripper_setspeed-response.msg.html

(cl:defclass <ro_gripper_setspeed-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_gripper_setspeed-response (<ro_gripper_setspeed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_setspeed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_setspeed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_setspeed-response> is deprecated: use deepbuilder-srv:ro_gripper_setspeed-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_gripper_setspeed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_setspeed-response>) ostream)
  "Serializes a message object of type '<ro_gripper_setspeed-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_setspeed-response>) istream)
  "Deserializes a message object of type '<ro_gripper_setspeed-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_setspeed-response>)))
  "Returns string type for a service object of type '<ro_gripper_setspeed-response>"
  "deepbuilder/ro_gripper_setspeedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_setspeed-response)))
  "Returns string type for a service object of type 'ro_gripper_setspeed-response"
  "deepbuilder/ro_gripper_setspeedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_setspeed-response>)))
  "Returns md5sum for a message object of type '<ro_gripper_setspeed-response>"
  "53122cc92cfbc917935bb064451b2b06")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_setspeed-response)))
  "Returns md5sum for a message object of type 'ro_gripper_setspeed-response"
  "53122cc92cfbc917935bb064451b2b06")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_setspeed-response>)))
  "Returns full string definition for message of type '<ro_gripper_setspeed-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_setspeed-response)))
  "Returns full string definition for message of type 'ro_gripper_setspeed-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_setspeed-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_setspeed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_setspeed-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_gripper_setspeed)))
  'ro_gripper_setspeed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_gripper_setspeed)))
  'ro_gripper_setspeed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_setspeed)))
  "Returns string type for a service object of type '<ro_gripper_setspeed>"
  "deepbuilder/ro_gripper_setspeed")