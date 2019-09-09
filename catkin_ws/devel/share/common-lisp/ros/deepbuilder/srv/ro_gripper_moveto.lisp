; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_gripper_moveto-request.msg.html

(cl:defclass <ro_gripper_moveto-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass ro_gripper_moveto-request (<ro_gripper_moveto-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_moveto-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_moveto-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_moveto-request> is deprecated: use deepbuilder-srv:ro_gripper_moveto-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <ro_gripper_moveto-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:goal-val is deprecated.  Use deepbuilder-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_moveto-request>) ostream)
  "Serializes a message object of type '<ro_gripper_moveto-request>"
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_moveto-request>) istream)
  "Deserializes a message object of type '<ro_gripper_moveto-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_moveto-request>)))
  "Returns string type for a service object of type '<ro_gripper_moveto-request>"
  "deepbuilder/ro_gripper_movetoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_moveto-request)))
  "Returns string type for a service object of type 'ro_gripper_moveto-request"
  "deepbuilder/ro_gripper_movetoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_moveto-request>)))
  "Returns md5sum for a message object of type '<ro_gripper_moveto-request>"
  "9a72e9df09a389879daf01f6fbd13491")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_moveto-request)))
  "Returns md5sum for a message object of type 'ro_gripper_moveto-request"
  "9a72e9df09a389879daf01f6fbd13491")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_moveto-request>)))
  "Returns full string definition for message of type '<ro_gripper_moveto-request>"
  (cl:format cl:nil "int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_moveto-request)))
  "Returns full string definition for message of type 'ro_gripper_moveto-request"
  (cl:format cl:nil "int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_moveto-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_moveto-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_moveto-request
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude ro_gripper_moveto-response.msg.html

(cl:defclass <ro_gripper_moveto-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_gripper_moveto-response (<ro_gripper_moveto-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_moveto-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_moveto-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_moveto-response> is deprecated: use deepbuilder-srv:ro_gripper_moveto-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_gripper_moveto-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_moveto-response>) ostream)
  "Serializes a message object of type '<ro_gripper_moveto-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_moveto-response>) istream)
  "Deserializes a message object of type '<ro_gripper_moveto-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_moveto-response>)))
  "Returns string type for a service object of type '<ro_gripper_moveto-response>"
  "deepbuilder/ro_gripper_movetoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_moveto-response)))
  "Returns string type for a service object of type 'ro_gripper_moveto-response"
  "deepbuilder/ro_gripper_movetoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_moveto-response>)))
  "Returns md5sum for a message object of type '<ro_gripper_moveto-response>"
  "9a72e9df09a389879daf01f6fbd13491")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_moveto-response)))
  "Returns md5sum for a message object of type 'ro_gripper_moveto-response"
  "9a72e9df09a389879daf01f6fbd13491")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_moveto-response>)))
  "Returns full string definition for message of type '<ro_gripper_moveto-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_moveto-response)))
  "Returns full string definition for message of type 'ro_gripper_moveto-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_moveto-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_moveto-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_moveto-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_gripper_moveto)))
  'ro_gripper_moveto-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_gripper_moveto)))
  'ro_gripper_moveto-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_moveto)))
  "Returns string type for a service object of type '<ro_gripper_moveto>"
  "deepbuilder/ro_gripper_moveto")