; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude se_get_values-request.msg.html

(cl:defclass <se_get_values-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass se_get_values-request (<se_get_values-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_get_values-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_get_values-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_get_values-request> is deprecated: use deepbuilder-srv:se_get_values-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_get_values-request>) ostream)
  "Serializes a message object of type '<se_get_values-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_get_values-request>) istream)
  "Deserializes a message object of type '<se_get_values-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_get_values-request>)))
  "Returns string type for a service object of type '<se_get_values-request>"
  "deepbuilder/se_get_valuesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_values-request)))
  "Returns string type for a service object of type 'se_get_values-request"
  "deepbuilder/se_get_valuesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_get_values-request>)))
  "Returns md5sum for a message object of type '<se_get_values-request>"
  "afc255e103ebf1fda6e279c644d870f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_get_values-request)))
  "Returns md5sum for a message object of type 'se_get_values-request"
  "afc255e103ebf1fda6e279c644d870f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_get_values-request>)))
  "Returns full string definition for message of type '<se_get_values-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_get_values-request)))
  "Returns full string definition for message of type 'se_get_values-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_get_values-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_get_values-request>))
  "Converts a ROS message object to a list"
  (cl:list 'se_get_values-request
))
;//! \htmlinclude se_get_values-response.msg.html

(cl:defclass <se_get_values-response> (roslisp-msg-protocol:ros-message)
  ((values
    :reader values
    :initarg :values
    :type my_msgs-msg:float_array
    :initform (cl:make-instance 'my_msgs-msg:float_array)))
)

(cl:defclass se_get_values-response (<se_get_values-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_get_values-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_get_values-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_get_values-response> is deprecated: use deepbuilder-srv:se_get_values-response instead.")))

(cl:ensure-generic-function 'values-val :lambda-list '(m))
(cl:defmethod values-val ((m <se_get_values-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:values-val is deprecated.  Use deepbuilder-srv:values instead.")
  (values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_get_values-response>) ostream)
  "Serializes a message object of type '<se_get_values-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'values) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_get_values-response>) istream)
  "Deserializes a message object of type '<se_get_values-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'values) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_get_values-response>)))
  "Returns string type for a service object of type '<se_get_values-response>"
  "deepbuilder/se_get_valuesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_values-response)))
  "Returns string type for a service object of type 'se_get_values-response"
  "deepbuilder/se_get_valuesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_get_values-response>)))
  "Returns md5sum for a message object of type '<se_get_values-response>"
  "afc255e103ebf1fda6e279c644d870f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_get_values-response)))
  "Returns md5sum for a message object of type 'se_get_values-response"
  "afc255e103ebf1fda6e279c644d870f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_get_values-response>)))
  "Returns full string definition for message of type '<se_get_values-response>"
  (cl:format cl:nil "my_msgs/float_array values~%~%================================================================================~%MSG: my_msgs/float_array~%float32[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_get_values-response)))
  "Returns full string definition for message of type 'se_get_values-response"
  (cl:format cl:nil "my_msgs/float_array values~%~%================================================================================~%MSG: my_msgs/float_array~%float32[] values~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_get_values-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'values))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_get_values-response>))
  "Converts a ROS message object to a list"
  (cl:list 'se_get_values-response
    (cl:cons ':values (values msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'se_get_values)))
  'se_get_values-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'se_get_values)))
  'se_get_values-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_values)))
  "Returns string type for a service object of type '<se_get_values>"
  "deepbuilder/se_get_values")