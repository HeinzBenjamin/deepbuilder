; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ex_reset_motor-request.msg.html

(cl:defclass <ex_reset_motor-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ex_reset_motor-request (<ex_reset_motor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ex_reset_motor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ex_reset_motor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ex_reset_motor-request> is deprecated: use deepbuilder-srv:ex_reset_motor-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ex_reset_motor-request>) ostream)
  "Serializes a message object of type '<ex_reset_motor-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ex_reset_motor-request>) istream)
  "Deserializes a message object of type '<ex_reset_motor-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ex_reset_motor-request>)))
  "Returns string type for a service object of type '<ex_reset_motor-request>"
  "deepbuilder/ex_reset_motorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_reset_motor-request)))
  "Returns string type for a service object of type 'ex_reset_motor-request"
  "deepbuilder/ex_reset_motorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ex_reset_motor-request>)))
  "Returns md5sum for a message object of type '<ex_reset_motor-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ex_reset_motor-request)))
  "Returns md5sum for a message object of type 'ex_reset_motor-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ex_reset_motor-request>)))
  "Returns full string definition for message of type '<ex_reset_motor-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ex_reset_motor-request)))
  "Returns full string definition for message of type 'ex_reset_motor-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ex_reset_motor-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ex_reset_motor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ex_reset_motor-request
))
;//! \htmlinclude ex_reset_motor-response.msg.html

(cl:defclass <ex_reset_motor-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ex_reset_motor-response (<ex_reset_motor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ex_reset_motor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ex_reset_motor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ex_reset_motor-response> is deprecated: use deepbuilder-srv:ex_reset_motor-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ex_reset_motor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ex_reset_motor-response>) ostream)
  "Serializes a message object of type '<ex_reset_motor-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ex_reset_motor-response>) istream)
  "Deserializes a message object of type '<ex_reset_motor-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ex_reset_motor-response>)))
  "Returns string type for a service object of type '<ex_reset_motor-response>"
  "deepbuilder/ex_reset_motorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_reset_motor-response)))
  "Returns string type for a service object of type 'ex_reset_motor-response"
  "deepbuilder/ex_reset_motorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ex_reset_motor-response>)))
  "Returns md5sum for a message object of type '<ex_reset_motor-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ex_reset_motor-response)))
  "Returns md5sum for a message object of type 'ex_reset_motor-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ex_reset_motor-response>)))
  "Returns full string definition for message of type '<ex_reset_motor-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ex_reset_motor-response)))
  "Returns full string definition for message of type 'ex_reset_motor-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ex_reset_motor-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ex_reset_motor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ex_reset_motor-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ex_reset_motor)))
  'ex_reset_motor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ex_reset_motor)))
  'ex_reset_motor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_reset_motor)))
  "Returns string type for a service object of type '<ex_reset_motor>"
  "deepbuilder/ex_reset_motor")