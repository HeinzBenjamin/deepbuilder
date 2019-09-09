; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_is_ready-request.msg.html

(cl:defclass <rt_is_ready-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rt_is_ready-request (<rt_is_ready-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_is_ready-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_is_ready-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_is_ready-request> is deprecated: use deepbuilder-srv:rt_is_ready-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_is_ready-request>) ostream)
  "Serializes a message object of type '<rt_is_ready-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_is_ready-request>) istream)
  "Deserializes a message object of type '<rt_is_ready-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_is_ready-request>)))
  "Returns string type for a service object of type '<rt_is_ready-request>"
  "deepbuilder/rt_is_readyRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_is_ready-request)))
  "Returns string type for a service object of type 'rt_is_ready-request"
  "deepbuilder/rt_is_readyRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_is_ready-request>)))
  "Returns md5sum for a message object of type '<rt_is_ready-request>"
  "6f378c6311f9e6ccd2cd8c5b327003f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_is_ready-request)))
  "Returns md5sum for a message object of type 'rt_is_ready-request"
  "6f378c6311f9e6ccd2cd8c5b327003f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_is_ready-request>)))
  "Returns full string definition for message of type '<rt_is_ready-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_is_ready-request)))
  "Returns full string definition for message of type 'rt_is_ready-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_is_ready-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_is_ready-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_is_ready-request
))
;//! \htmlinclude rt_is_ready-response.msg.html

(cl:defclass <rt_is_ready-response> (roslisp-msg-protocol:ros-message)
  ((ready
    :reader ready
    :initarg :ready
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass rt_is_ready-response (<rt_is_ready-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_is_ready-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_is_ready-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_is_ready-response> is deprecated: use deepbuilder-srv:rt_is_ready-response instead.")))

(cl:ensure-generic-function 'ready-val :lambda-list '(m))
(cl:defmethod ready-val ((m <rt_is_ready-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:ready-val is deprecated.  Use deepbuilder-srv:ready instead.")
  (ready m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_is_ready-response>) ostream)
  "Serializes a message object of type '<rt_is_ready-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'ready) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_is_ready-response>) istream)
  "Deserializes a message object of type '<rt_is_ready-response>"
    (cl:setf (cl:slot-value msg 'ready) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_is_ready-response>)))
  "Returns string type for a service object of type '<rt_is_ready-response>"
  "deepbuilder/rt_is_readyResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_is_ready-response)))
  "Returns string type for a service object of type 'rt_is_ready-response"
  "deepbuilder/rt_is_readyResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_is_ready-response>)))
  "Returns md5sum for a message object of type '<rt_is_ready-response>"
  "6f378c6311f9e6ccd2cd8c5b327003f1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_is_ready-response)))
  "Returns md5sum for a message object of type 'rt_is_ready-response"
  "6f378c6311f9e6ccd2cd8c5b327003f1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_is_ready-response>)))
  "Returns full string definition for message of type '<rt_is_ready-response>"
  (cl:format cl:nil "bool ready~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_is_ready-response)))
  "Returns full string definition for message of type 'rt_is_ready-response"
  (cl:format cl:nil "bool ready~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_is_ready-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_is_ready-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_is_ready-response
    (cl:cons ':ready (ready msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_is_ready)))
  'rt_is_ready-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_is_ready)))
  'rt_is_ready-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_is_ready)))
  "Returns string type for a service object of type '<rt_is_ready>"
  "deepbuilder/rt_is_ready")