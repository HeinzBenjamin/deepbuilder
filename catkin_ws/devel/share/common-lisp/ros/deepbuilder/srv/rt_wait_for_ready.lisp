; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_wait_for_ready-request.msg.html

(cl:defclass <rt_wait_for_ready-request> (roslisp-msg-protocol:ros-message)
  ((timeout_ms
    :reader timeout_ms
    :initarg :timeout_ms
    :type cl:integer
    :initform 0))
)

(cl:defclass rt_wait_for_ready-request (<rt_wait_for_ready-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_wait_for_ready-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_wait_for_ready-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_wait_for_ready-request> is deprecated: use deepbuilder-srv:rt_wait_for_ready-request instead.")))

(cl:ensure-generic-function 'timeout_ms-val :lambda-list '(m))
(cl:defmethod timeout_ms-val ((m <rt_wait_for_ready-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:timeout_ms-val is deprecated.  Use deepbuilder-srv:timeout_ms instead.")
  (timeout_ms m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_wait_for_ready-request>) ostream)
  "Serializes a message object of type '<rt_wait_for_ready-request>"
  (cl:let* ((signed (cl:slot-value msg 'timeout_ms)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_wait_for_ready-request>) istream)
  "Deserializes a message object of type '<rt_wait_for_ready-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'timeout_ms) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_wait_for_ready-request>)))
  "Returns string type for a service object of type '<rt_wait_for_ready-request>"
  "deepbuilder/rt_wait_for_readyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_wait_for_ready-request)))
  "Returns string type for a service object of type 'rt_wait_for_ready-request"
  "deepbuilder/rt_wait_for_readyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_wait_for_ready-request>)))
  "Returns md5sum for a message object of type '<rt_wait_for_ready-request>"
  "985b321a02883643c59c6d43bcb5063f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_wait_for_ready-request)))
  "Returns md5sum for a message object of type 'rt_wait_for_ready-request"
  "985b321a02883643c59c6d43bcb5063f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_wait_for_ready-request>)))
  "Returns full string definition for message of type '<rt_wait_for_ready-request>"
  (cl:format cl:nil "int64 timeout_ms~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_wait_for_ready-request)))
  "Returns full string definition for message of type 'rt_wait_for_ready-request"
  (cl:format cl:nil "int64 timeout_ms~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_wait_for_ready-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_wait_for_ready-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_wait_for_ready-request
    (cl:cons ':timeout_ms (timeout_ms msg))
))
;//! \htmlinclude rt_wait_for_ready-response.msg.html

(cl:defclass <rt_wait_for_ready-response> (roslisp-msg-protocol:ros-message)
  ((ready
    :reader ready
    :initarg :ready
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass rt_wait_for_ready-response (<rt_wait_for_ready-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_wait_for_ready-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_wait_for_ready-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_wait_for_ready-response> is deprecated: use deepbuilder-srv:rt_wait_for_ready-response instead.")))

(cl:ensure-generic-function 'ready-val :lambda-list '(m))
(cl:defmethod ready-val ((m <rt_wait_for_ready-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:ready-val is deprecated.  Use deepbuilder-srv:ready instead.")
  (ready m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_wait_for_ready-response>) ostream)
  "Serializes a message object of type '<rt_wait_for_ready-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ready) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_wait_for_ready-response>) istream)
  "Deserializes a message object of type '<rt_wait_for_ready-response>"
    (cl:setf (cl:slot-value msg 'ready) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_wait_for_ready-response>)))
  "Returns string type for a service object of type '<rt_wait_for_ready-response>"
  "deepbuilder/rt_wait_for_readyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_wait_for_ready-response)))
  "Returns string type for a service object of type 'rt_wait_for_ready-response"
  "deepbuilder/rt_wait_for_readyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_wait_for_ready-response>)))
  "Returns md5sum for a message object of type '<rt_wait_for_ready-response>"
  "985b321a02883643c59c6d43bcb5063f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_wait_for_ready-response)))
  "Returns md5sum for a message object of type 'rt_wait_for_ready-response"
  "985b321a02883643c59c6d43bcb5063f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_wait_for_ready-response>)))
  "Returns full string definition for message of type '<rt_wait_for_ready-response>"
  (cl:format cl:nil "bool ready~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_wait_for_ready-response)))
  "Returns full string definition for message of type 'rt_wait_for_ready-response"
  (cl:format cl:nil "bool ready~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_wait_for_ready-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_wait_for_ready-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_wait_for_ready-response
    (cl:cons ':ready (ready msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_wait_for_ready)))
  'rt_wait_for_ready-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_wait_for_ready)))
  'rt_wait_for_ready-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_wait_for_ready)))
  "Returns string type for a service object of type '<rt_wait_for_ready>"
  "deepbuilder/rt_wait_for_ready")