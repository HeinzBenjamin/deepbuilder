; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_gripper_open-request.msg.html

(cl:defclass <ro_gripper_open-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ro_gripper_open-request (<ro_gripper_open-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_open-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_open-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_open-request> is deprecated: use deepbuilder-srv:ro_gripper_open-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_open-request>) ostream)
  "Serializes a message object of type '<ro_gripper_open-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_open-request>) istream)
  "Deserializes a message object of type '<ro_gripper_open-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_open-request>)))
  "Returns string type for a service object of type '<ro_gripper_open-request>"
  "deepbuilder/ro_gripper_openRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_open-request)))
  "Returns string type for a service object of type 'ro_gripper_open-request"
  "deepbuilder/ro_gripper_openRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_open-request>)))
  "Returns md5sum for a message object of type '<ro_gripper_open-request>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_open-request)))
  "Returns md5sum for a message object of type 'ro_gripper_open-request"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_open-request>)))
  "Returns full string definition for message of type '<ro_gripper_open-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_open-request)))
  "Returns full string definition for message of type 'ro_gripper_open-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_open-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_open-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_open-request
))
;//! \htmlinclude ro_gripper_open-response.msg.html

(cl:defclass <ro_gripper_open-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_gripper_open-response (<ro_gripper_open-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_gripper_open-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_gripper_open-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_gripper_open-response> is deprecated: use deepbuilder-srv:ro_gripper_open-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_gripper_open-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_gripper_open-response>) ostream)
  "Serializes a message object of type '<ro_gripper_open-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_gripper_open-response>) istream)
  "Deserializes a message object of type '<ro_gripper_open-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_gripper_open-response>)))
  "Returns string type for a service object of type '<ro_gripper_open-response>"
  "deepbuilder/ro_gripper_openResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_open-response)))
  "Returns string type for a service object of type 'ro_gripper_open-response"
  "deepbuilder/ro_gripper_openResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_gripper_open-response>)))
  "Returns md5sum for a message object of type '<ro_gripper_open-response>"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_gripper_open-response)))
  "Returns md5sum for a message object of type 'ro_gripper_open-response"
  "5f003d6bcc824cbd51361d66d8e4f76c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_gripper_open-response>)))
  "Returns full string definition for message of type '<ro_gripper_open-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_gripper_open-response)))
  "Returns full string definition for message of type 'ro_gripper_open-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_gripper_open-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_gripper_open-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_gripper_open-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_gripper_open)))
  'ro_gripper_open-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_gripper_open)))
  'ro_gripper_open-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_gripper_open)))
  "Returns string type for a service object of type '<ro_gripper_open>"
  "deepbuilder/ro_gripper_open")