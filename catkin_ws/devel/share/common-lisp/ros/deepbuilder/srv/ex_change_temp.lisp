; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ex_change_temp-request.msg.html

(cl:defclass <ex_change_temp-request> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0)
   (wait
    :reader wait
    :initarg :wait
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ex_change_temp-request (<ex_change_temp-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ex_change_temp-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ex_change_temp-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ex_change_temp-request> is deprecated: use deepbuilder-srv:ex_change_temp-request instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <ex_change_temp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:value-val is deprecated.  Use deepbuilder-srv:value instead.")
  (value m))

(cl:ensure-generic-function 'wait-val :lambda-list '(m))
(cl:defmethod wait-val ((m <ex_change_temp-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:wait-val is deprecated.  Use deepbuilder-srv:wait instead.")
  (wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ex_change_temp-request>) ostream)
  "Serializes a message object of type '<ex_change_temp-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ex_change_temp-request>) istream)
  "Deserializes a message object of type '<ex_change_temp-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'wait) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ex_change_temp-request>)))
  "Returns string type for a service object of type '<ex_change_temp-request>"
  "deepbuilder/ex_change_tempRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_change_temp-request)))
  "Returns string type for a service object of type 'ex_change_temp-request"
  "deepbuilder/ex_change_tempRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ex_change_temp-request>)))
  "Returns md5sum for a message object of type '<ex_change_temp-request>"
  "ccd6eb84971df341c36707104795ebb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ex_change_temp-request)))
  "Returns md5sum for a message object of type 'ex_change_temp-request"
  "ccd6eb84971df341c36707104795ebb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ex_change_temp-request>)))
  "Returns full string definition for message of type '<ex_change_temp-request>"
  (cl:format cl:nil "float32 value~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ex_change_temp-request)))
  "Returns full string definition for message of type 'ex_change_temp-request"
  (cl:format cl:nil "float32 value~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ex_change_temp-request>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ex_change_temp-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ex_change_temp-request
    (cl:cons ':value (value msg))
    (cl:cons ':wait (wait msg))
))
;//! \htmlinclude ex_change_temp-response.msg.html

(cl:defclass <ex_change_temp-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ex_change_temp-response (<ex_change_temp-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ex_change_temp-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ex_change_temp-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ex_change_temp-response> is deprecated: use deepbuilder-srv:ex_change_temp-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ex_change_temp-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ex_change_temp-response>) ostream)
  "Serializes a message object of type '<ex_change_temp-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ex_change_temp-response>) istream)
  "Deserializes a message object of type '<ex_change_temp-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ex_change_temp-response>)))
  "Returns string type for a service object of type '<ex_change_temp-response>"
  "deepbuilder/ex_change_tempResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_change_temp-response)))
  "Returns string type for a service object of type 'ex_change_temp-response"
  "deepbuilder/ex_change_tempResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ex_change_temp-response>)))
  "Returns md5sum for a message object of type '<ex_change_temp-response>"
  "ccd6eb84971df341c36707104795ebb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ex_change_temp-response)))
  "Returns md5sum for a message object of type 'ex_change_temp-response"
  "ccd6eb84971df341c36707104795ebb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ex_change_temp-response>)))
  "Returns full string definition for message of type '<ex_change_temp-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ex_change_temp-response)))
  "Returns full string definition for message of type 'ex_change_temp-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ex_change_temp-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ex_change_temp-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ex_change_temp-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ex_change_temp)))
  'ex_change_temp-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ex_change_temp)))
  'ex_change_temp-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ex_change_temp)))
  "Returns string type for a service object of type '<ex_change_temp>"
  "deepbuilder/ex_change_temp")