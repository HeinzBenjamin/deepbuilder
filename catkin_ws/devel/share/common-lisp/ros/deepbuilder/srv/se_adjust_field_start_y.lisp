; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude se_adjust_field_start_y-request.msg.html

(cl:defclass <se_adjust_field_start_y-request> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass se_adjust_field_start_y-request (<se_adjust_field_start_y-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_adjust_field_start_y-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_adjust_field_start_y-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_adjust_field_start_y-request> is deprecated: use deepbuilder-srv:se_adjust_field_start_y-request instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <se_adjust_field_start_y-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:value-val is deprecated.  Use deepbuilder-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_adjust_field_start_y-request>) ostream)
  "Serializes a message object of type '<se_adjust_field_start_y-request>"
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_adjust_field_start_y-request>) istream)
  "Deserializes a message object of type '<se_adjust_field_start_y-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_adjust_field_start_y-request>)))
  "Returns string type for a service object of type '<se_adjust_field_start_y-request>"
  "deepbuilder/se_adjust_field_start_yRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_field_start_y-request)))
  "Returns string type for a service object of type 'se_adjust_field_start_y-request"
  "deepbuilder/se_adjust_field_start_yRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_adjust_field_start_y-request>)))
  "Returns md5sum for a message object of type '<se_adjust_field_start_y-request>"
  "c347af19957c4bfd6fa7272ca95ca3d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_adjust_field_start_y-request)))
  "Returns md5sum for a message object of type 'se_adjust_field_start_y-request"
  "c347af19957c4bfd6fa7272ca95ca3d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_adjust_field_start_y-request>)))
  "Returns full string definition for message of type '<se_adjust_field_start_y-request>"
  (cl:format cl:nil "int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_adjust_field_start_y-request)))
  "Returns full string definition for message of type 'se_adjust_field_start_y-request"
  (cl:format cl:nil "int32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_adjust_field_start_y-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_adjust_field_start_y-request>))
  "Converts a ROS message object to a list"
  (cl:list 'se_adjust_field_start_y-request
    (cl:cons ':value (value msg))
))
;//! \htmlinclude se_adjust_field_start_y-response.msg.html

(cl:defclass <se_adjust_field_start_y-response> (roslisp-msg-protocol:ros-message)
  ((oldValue
    :reader oldValue
    :initarg :oldValue
    :type cl:integer
    :initform 0)
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:integer
    :initform 0))
)

(cl:defclass se_adjust_field_start_y-response (<se_adjust_field_start_y-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_adjust_field_start_y-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_adjust_field_start_y-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_adjust_field_start_y-response> is deprecated: use deepbuilder-srv:se_adjust_field_start_y-response instead.")))

(cl:ensure-generic-function 'oldValue-val :lambda-list '(m))
(cl:defmethod oldValue-val ((m <se_adjust_field_start_y-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:oldValue-val is deprecated.  Use deepbuilder-srv:oldValue instead.")
  (oldValue m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <se_adjust_field_start_y-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:newValue-val is deprecated.  Use deepbuilder-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_adjust_field_start_y-response>) ostream)
  "Serializes a message object of type '<se_adjust_field_start_y-response>"
  (cl:let* ((signed (cl:slot-value msg 'oldValue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'newValue)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_adjust_field_start_y-response>) istream)
  "Deserializes a message object of type '<se_adjust_field_start_y-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'oldValue) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'newValue) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_adjust_field_start_y-response>)))
  "Returns string type for a service object of type '<se_adjust_field_start_y-response>"
  "deepbuilder/se_adjust_field_start_yResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_field_start_y-response)))
  "Returns string type for a service object of type 'se_adjust_field_start_y-response"
  "deepbuilder/se_adjust_field_start_yResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_adjust_field_start_y-response>)))
  "Returns md5sum for a message object of type '<se_adjust_field_start_y-response>"
  "c347af19957c4bfd6fa7272ca95ca3d6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_adjust_field_start_y-response)))
  "Returns md5sum for a message object of type 'se_adjust_field_start_y-response"
  "c347af19957c4bfd6fa7272ca95ca3d6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_adjust_field_start_y-response>)))
  "Returns full string definition for message of type '<se_adjust_field_start_y-response>"
  (cl:format cl:nil "int32 oldValue~%int32 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_adjust_field_start_y-response)))
  "Returns full string definition for message of type 'se_adjust_field_start_y-response"
  (cl:format cl:nil "int32 oldValue~%int32 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_adjust_field_start_y-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_adjust_field_start_y-response>))
  "Converts a ROS message object to a list"
  (cl:list 'se_adjust_field_start_y-response
    (cl:cons ':oldValue (oldValue msg))
    (cl:cons ':newValue (newValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'se_adjust_field_start_y)))
  'se_adjust_field_start_y-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'se_adjust_field_start_y)))
  'se_adjust_field_start_y-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_field_start_y)))
  "Returns string type for a service object of type '<se_adjust_field_start_y>"
  "deepbuilder/se_adjust_field_start_y")