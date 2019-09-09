; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_set_action-request.msg.html

(cl:defclass <rt_set_action-request> (roslisp-msg-protocol:ros-message)
  ((controller
    :reader controller
    :initarg :controller
    :type cl:string
    :initform "")
   (action
    :reader action
    :initarg :action
    :type my_msgs-msg:action
    :initform (cl:make-instance 'my_msgs-msg:action)))
)

(cl:defclass rt_set_action-request (<rt_set_action-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_action-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_action-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_action-request> is deprecated: use deepbuilder-srv:rt_set_action-request instead.")))

(cl:ensure-generic-function 'controller-val :lambda-list '(m))
(cl:defmethod controller-val ((m <rt_set_action-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:controller-val is deprecated.  Use deepbuilder-srv:controller instead.")
  (controller m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <rt_set_action-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:action-val is deprecated.  Use deepbuilder-srv:action instead.")
  (action m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_action-request>) ostream)
  "Serializes a message object of type '<rt_set_action-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'controller))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'controller))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_action-request>) istream)
  "Deserializes a message object of type '<rt_set_action-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'controller) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'controller) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_action-request>)))
  "Returns string type for a service object of type '<rt_set_action-request>"
  "deepbuilder/rt_set_actionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_action-request)))
  "Returns string type for a service object of type 'rt_set_action-request"
  "deepbuilder/rt_set_actionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_action-request>)))
  "Returns md5sum for a message object of type '<rt_set_action-request>"
  "5d06ec287625f49b9001c48a2d24b856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_action-request)))
  "Returns md5sum for a message object of type 'rt_set_action-request"
  "5d06ec287625f49b9001c48a2d24b856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_action-request>)))
  "Returns full string definition for message of type '<rt_set_action-request>"
  (cl:format cl:nil "string controller~%my_msgs/action action~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_action-request)))
  "Returns full string definition for message of type 'rt_set_action-request"
  (cl:format cl:nil "string controller~%my_msgs/action action~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_action-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'controller))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_action-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_action-request
    (cl:cons ':controller (controller msg))
    (cl:cons ':action (action msg))
))
;//! \htmlinclude rt_set_action-response.msg.html

(cl:defclass <rt_set_action-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rt_set_action-response (<rt_set_action-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_set_action-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_set_action-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_set_action-response> is deprecated: use deepbuilder-srv:rt_set_action-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_set_action-response>) ostream)
  "Serializes a message object of type '<rt_set_action-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_set_action-response>) istream)
  "Deserializes a message object of type '<rt_set_action-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_set_action-response>)))
  "Returns string type for a service object of type '<rt_set_action-response>"
  "deepbuilder/rt_set_actionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_action-response)))
  "Returns string type for a service object of type 'rt_set_action-response"
  "deepbuilder/rt_set_actionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_set_action-response>)))
  "Returns md5sum for a message object of type '<rt_set_action-response>"
  "5d06ec287625f49b9001c48a2d24b856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_set_action-response)))
  "Returns md5sum for a message object of type 'rt_set_action-response"
  "5d06ec287625f49b9001c48a2d24b856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_set_action-response>)))
  "Returns full string definition for message of type '<rt_set_action-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_set_action-response)))
  "Returns full string definition for message of type 'rt_set_action-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_set_action-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_set_action-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_set_action-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_set_action)))
  'rt_set_action-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_set_action)))
  'rt_set_action-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_set_action)))
  "Returns string type for a service object of type '<rt_set_action>"
  "deepbuilder/rt_set_action")