; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_get_block-request.msg.html

(cl:defclass <ro_get_block-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ro_get_block-request (<ro_get_block-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_block-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_block-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_block-request> is deprecated: use deepbuilder-srv:ro_get_block-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_get_block-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'tcp_mode-val :lambda-list '(m))
(cl:defmethod tcp_mode-val ((m <ro_get_block-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:tcp_mode-val is deprecated.  Use deepbuilder-srv:tcp_mode instead.")
  (tcp_mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_block-request>) ostream)
  "Serializes a message object of type '<ro_get_block-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'tcp_mode) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_block-request>) istream)
  "Deserializes a message object of type '<ro_get_block-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'tcp_mode) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_block-request>)))
  "Returns string type for a service object of type '<ro_get_block-request>"
  "deepbuilder/ro_get_blockRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_block-request)))
  "Returns string type for a service object of type 'ro_get_block-request"
  "deepbuilder/ro_get_blockRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_block-request>)))
  "Returns md5sum for a message object of type '<ro_get_block-request>"
  "65f9af88059b07caeeaf7e2d659e542b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_block-request)))
  "Returns md5sum for a message object of type 'ro_get_block-request"
  "65f9af88059b07caeeaf7e2d659e542b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_block-request>)))
  "Returns full string definition for message of type '<ro_get_block-request>"
  (cl:format cl:nil "float32 speed~%bool tcp_mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_block-request)))
  "Returns full string definition for message of type 'ro_get_block-request"
  (cl:format cl:nil "float32 speed~%bool tcp_mode~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_block-request>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_block-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_block-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':tcp_mode (tcp_mode msg))
))
;//! \htmlinclude ro_get_block-response.msg.html

(cl:defclass <ro_get_block-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_get_block-response (<ro_get_block-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_block-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_block-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_block-response> is deprecated: use deepbuilder-srv:ro_get_block-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_get_block-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_block-response>) ostream)
  "Serializes a message object of type '<ro_get_block-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_block-response>) istream)
  "Deserializes a message object of type '<ro_get_block-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_block-response>)))
  "Returns string type for a service object of type '<ro_get_block-response>"
  "deepbuilder/ro_get_blockResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_block-response)))
  "Returns string type for a service object of type 'ro_get_block-response"
  "deepbuilder/ro_get_blockResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_block-response>)))
  "Returns md5sum for a message object of type '<ro_get_block-response>"
  "65f9af88059b07caeeaf7e2d659e542b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_block-response)))
  "Returns md5sum for a message object of type 'ro_get_block-response"
  "65f9af88059b07caeeaf7e2d659e542b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_block-response>)))
  "Returns full string definition for message of type '<ro_get_block-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_block-response)))
  "Returns full string definition for message of type 'ro_get_block-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_block-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_block-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_block-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_get_block)))
  'ro_get_block-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_get_block)))
  'ro_get_block-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_block)))
  "Returns string type for a service object of type '<ro_get_block>"
  "deepbuilder/ro_get_block")