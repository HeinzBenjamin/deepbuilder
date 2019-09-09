; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_gripper_close-request.msg.html

(cl:defclass <ro_gripper_close-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ro_gripper_close-request (<ro_gripper_close-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_close-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_close-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_close-request> is deprecated: use deepbuilder-srv:ro_gripper_close-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_close-request>) ostream)
  "Serializes a message object of type '<ro_gripper_close-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_close-request>) istream)
  "Deserializes a message object of type '<ro_gripper_close-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_close-request>)))
  "Returns string type for a service object of type '<ro_gripper_close-request>"
  "deepbuilder/ro_gripper_closeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_close-request)))
  "Returns string type for a service object of type 'ro_gripper_close-request"
  "deepbuilder/ro_gripper_closeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_close-request>)))
  "Returns md5sum for a message object of type '<ro_gripper_close-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_close-request)))
  "Returns md5sum for a message object of type 'ro_gripper_close-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_close-request>)))
  "Returns full string definition for message of type '<ro_gripper_close-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_close-request)))
  "Returns full string definition for message of type 'ro_gripper_close-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_close-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_close-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_close-request
))
;//! \htmlinclude ro_gripper_close-response.msg.html

(cl:defclass <ro_gripper_close-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_gripper_close-response (<ro_gripper_close-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_close-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_close-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_close-response> is deprecated: use deepbuilder-srv:ro_gripper_close-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_gripper_close-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_close-response>) ostream)
  "Serializes a message object of type '<ro_gripper_close-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_close-response>) istream)
  "Deserializes a message object of type '<ro_gripper_close-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_close-response>)))
  "Returns string type for a service object of type '<ro_gripper_close-response>"
  "deepbuilder/ro_gripper_closeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_close-response)))
  "Returns string type for a service object of type 'ro_gripper_close-response"
  "deepbuilder/ro_gripper_closeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_close-response>)))
  "Returns md5sum for a message object of type '<ro_gripper_close-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_close-response)))
  "Returns md5sum for a message object of type 'ro_gripper_close-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_close-response>)))
  "Returns full string definition for message of type '<ro_gripper_close-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_close-response)))
  "Returns full string definition for message of type 'ro_gripper_close-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_close-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_close-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_close-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_gripper_close)))
  'ro_gripper_close-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_gripper_close)))
  'ro_gripper_close-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_close)))
  "Returns string type for a service object of type '<ro_gripper_close>"
  "deepbuilder/ro_gripper_close")