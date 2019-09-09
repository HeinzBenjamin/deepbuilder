; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_set_agent_presence-request.msg.html

(cl:defclass <rt_set_agent_presence-request> (roslisp-msg-protocol:ros-message)
  ((agent_present
    :reader agent_present
    :initarg :agent_present
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass rt_set_agent_presence-request (<rt_set_agent_presence-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_agent_presence-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_agent_presence-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_agent_presence-request> is deprecated: use deepbuilder-srv:rt_set_agent_presence-request instead.")))

(cl:ensure-generic-function 'agent_present-val :lambda-list '(m))
(cl:defmethod agent_present-val ((m <rt_set_agent_presence-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:agent_present-val is deprecated.  Use deepbuilder-srv:agent_present instead.")
  (agent_present m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_agent_presence-request>) ostream)
  "Serializes a message object of type '<rt_set_agent_presence-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'agent_present) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_agent_presence-request>) istream)
  "Deserializes a message object of type '<rt_set_agent_presence-request>"
    (cl:setf (cl:slot-value msg 'agent_present) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_agent_presence-request>)))
  "Returns string type for a service object of type '<rt_set_agent_presence-request>"
  "deepbuilder/rt_set_agent_presenceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_agent_presence-request)))
  "Returns string type for a service object of type 'rt_set_agent_presence-request"
  "deepbuilder/rt_set_agent_presenceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_agent_presence-request>)))
  "Returns md5sum for a message object of type '<rt_set_agent_presence-request>"
  "8d81a8d38b2cf9545ac2bc74275099bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_agent_presence-request)))
  "Returns md5sum for a message object of type 'rt_set_agent_presence-request"
  "8d81a8d38b2cf9545ac2bc74275099bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_agent_presence-request>)))
  "Returns full string definition for message of type '<rt_set_agent_presence-request>"
  (cl:format cl:nil "bool agent_present~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_agent_presence-request)))
  "Returns full string definition for message of type 'rt_set_agent_presence-request"
  (cl:format cl:nil "bool agent_present~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_agent_presence-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_agent_presence-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_agent_presence-request
    (cl:cons ':agent_present (agent_present msg))
))
;//! \htmlinclude rt_set_agent_presence-response.msg.html

(cl:defclass <rt_set_agent_presence-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rt_set_agent_presence-response (<rt_set_agent_presence-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_agent_presence-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_agent_presence-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_agent_presence-response> is deprecated: use deepbuilder-srv:rt_set_agent_presence-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_agent_presence-response>) ostream)
  "Serializes a message object of type '<rt_set_agent_presence-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_agent_presence-response>) istream)
  "Deserializes a message object of type '<rt_set_agent_presence-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_agent_presence-response>)))
  "Returns string type for a service object of type '<rt_set_agent_presence-response>"
  "deepbuilder/rt_set_agent_presenceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_agent_presence-response)))
  "Returns string type for a service object of type 'rt_set_agent_presence-response"
  "deepbuilder/rt_set_agent_presenceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_agent_presence-response>)))
  "Returns md5sum for a message object of type '<rt_set_agent_presence-response>"
  "8d81a8d38b2cf9545ac2bc74275099bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_agent_presence-response)))
  "Returns md5sum for a message object of type 'rt_set_agent_presence-response"
  "8d81a8d38b2cf9545ac2bc74275099bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_agent_presence-response>)))
  "Returns full string definition for message of type '<rt_set_agent_presence-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_agent_presence-response)))
  "Returns full string definition for message of type 'rt_set_agent_presence-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_agent_presence-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_agent_presence-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_agent_presence-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_set_agent_presence)))
  'rt_set_agent_presence-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_set_agent_presence)))
  'rt_set_agent_presence-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_agent_presence)))
  "Returns string type for a service object of type '<rt_set_agent_presence>"
  "deepbuilder/rt_set_agent_presence")