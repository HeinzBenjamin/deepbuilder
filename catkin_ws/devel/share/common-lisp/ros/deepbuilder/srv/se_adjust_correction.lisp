; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude se_adjust_correction-request.msg.html

(cl:defclass <se_adjust_correction-request> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass se_adjust_correction-request (<se_adjust_correction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_adjust_correction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_adjust_correction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_adjust_correction-request> is deprecated: use deepbuilder-srv:se_adjust_correction-request instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <se_adjust_correction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:value-val is deprecated.  Use deepbuilder-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_adjust_correction-request>) ostream)
  "Serializes a message object of type '<se_adjust_correction-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_adjust_correction-request>) istream)
  "Deserializes a message object of type '<se_adjust_correction-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_adjust_correction-request>)))
  "Returns string type for a service object of type '<se_adjust_correction-request>"
  "deepbuilder/se_adjust_correctionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_correction-request)))
  "Returns string type for a service object of type 'se_adjust_correction-request"
  "deepbuilder/se_adjust_correctionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_adjust_correction-request>)))
  "Returns md5sum for a message object of type '<se_adjust_correction-request>"
  "cd2ed50a53af7332f044c9ff74dcb9ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_adjust_correction-request)))
  "Returns md5sum for a message object of type 'se_adjust_correction-request"
  "cd2ed50a53af7332f044c9ff74dcb9ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_adjust_correction-request>)))
  "Returns full string definition for message of type '<se_adjust_correction-request>"
  (cl:format cl:nil "float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_adjust_correction-request)))
  "Returns full string definition for message of type 'se_adjust_correction-request"
  (cl:format cl:nil "float32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_adjust_correction-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_adjust_correction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'se_adjust_correction-request
    (cl:cons ':value (value msg))
))
;//! \htmlinclude se_adjust_correction-response.msg.html

(cl:defclass <se_adjust_correction-response> (roslisp-msg-protocol:ros-message)
  ((oldValue
    :reader oldValue
    :initarg :oldValue
    :type cl:float
    :initform 0.0)
   (newValue
    :reader newValue
    :initarg :newValue
    :type cl:float
    :initform 0.0))
)

(cl:defclass se_adjust_correction-response (<se_adjust_correction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_adjust_correction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_adjust_correction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_adjust_correction-response> is deprecated: use deepbuilder-srv:se_adjust_correction-response instead.")))

(cl:ensure-generic-function 'oldValue-val :lambda-list '(m))
(cl:defmethod oldValue-val ((m <se_adjust_correction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:oldValue-val is deprecated.  Use deepbuilder-srv:oldValue instead.")
  (oldValue m))

(cl:ensure-generic-function 'newValue-val :lambda-list '(m))
(cl:defmethod newValue-val ((m <se_adjust_correction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:newValue-val is deprecated.  Use deepbuilder-srv:newValue instead.")
  (newValue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_adjust_correction-response>) ostream)
  "Serializes a message object of type '<se_adjust_correction-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'oldValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'newValue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_adjust_correction-response>) istream)
  "Deserializes a message object of type '<se_adjust_correction-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'oldValue) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'newValue) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_adjust_correction-response>)))
  "Returns string type for a service object of type '<se_adjust_correction-response>"
  "deepbuilder/se_adjust_correctionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_correction-response)))
  "Returns string type for a service object of type 'se_adjust_correction-response"
  "deepbuilder/se_adjust_correctionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_adjust_correction-response>)))
  "Returns md5sum for a message object of type '<se_adjust_correction-response>"
  "cd2ed50a53af7332f044c9ff74dcb9ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_adjust_correction-response)))
  "Returns md5sum for a message object of type 'se_adjust_correction-response"
  "cd2ed50a53af7332f044c9ff74dcb9ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_adjust_correction-response>)))
  "Returns full string definition for message of type '<se_adjust_correction-response>"
  (cl:format cl:nil "float32 oldValue~%float32 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_adjust_correction-response)))
  "Returns full string definition for message of type 'se_adjust_correction-response"
  (cl:format cl:nil "float32 oldValue~%float32 newValue~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_adjust_correction-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_adjust_correction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'se_adjust_correction-response
    (cl:cons ':oldValue (oldValue msg))
    (cl:cons ':newValue (newValue msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'se_adjust_correction)))
  'se_adjust_correction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'se_adjust_correction)))
  'se_adjust_correction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_adjust_correction)))
  "Returns string type for a service object of type '<se_adjust_correction>"
  "deepbuilder/se_adjust_correction")