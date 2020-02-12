; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_move_home-request.msg.html

(cl:defclass <ro_move_home-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (wait
    :reader wait
    :initarg :wait
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ro_move_home-request (<ro_move_home-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_home-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_home-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_home-request> is deprecated: use deepbuilder-srv:ro_move_home-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_move_home-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'wait-val :lambda-list '(m))
(cl:defmethod wait-val ((m <ro_move_home-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:wait-val is deprecated.  Use deepbuilder-srv:wait instead.")
  (wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_home-request>) ostream)
  "Serializes a message object of type '<ro_move_home-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_home-request>) istream)
  "Deserializes a message object of type '<ro_move_home-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'wait) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_home-request>)))
  "Returns string type for a service object of type '<ro_move_home-request>"
  "deepbuilder/ro_move_homeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_home-request)))
  "Returns string type for a service object of type 'ro_move_home-request"
  "deepbuilder/ro_move_homeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_home-request>)))
  "Returns md5sum for a message object of type '<ro_move_home-request>"
  "c30317d3d3699e0839f659b2d971bd95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_home-request)))
  "Returns md5sum for a message object of type 'ro_move_home-request"
  "c30317d3d3699e0839f659b2d971bd95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_home-request>)))
  "Returns full string definition for message of type '<ro_move_home-request>"
  (cl:format cl:nil "float32 speed~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_home-request)))
  "Returns full string definition for message of type 'ro_move_home-request"
  (cl:format cl:nil "float32 speed~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_home-request>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_home-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_home-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':wait (wait msg))
))
;//! \htmlinclude ro_move_home-response.msg.html

(cl:defclass <ro_move_home-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_move_home-response (<ro_move_home-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_home-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_home-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_home-response> is deprecated: use deepbuilder-srv:ro_move_home-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_move_home-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_home-response>) ostream)
  "Serializes a message object of type '<ro_move_home-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_home-response>) istream)
  "Deserializes a message object of type '<ro_move_home-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_home-response>)))
  "Returns string type for a service object of type '<ro_move_home-response>"
  "deepbuilder/ro_move_homeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_home-response)))
  "Returns string type for a service object of type 'ro_move_home-response"
  "deepbuilder/ro_move_homeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_home-response>)))
  "Returns md5sum for a message object of type '<ro_move_home-response>"
  "c30317d3d3699e0839f659b2d971bd95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_home-response)))
  "Returns md5sum for a message object of type 'ro_move_home-response"
  "c30317d3d3699e0839f659b2d971bd95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_home-response>)))
  "Returns full string definition for message of type '<ro_move_home-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_home-response)))
  "Returns full string definition for message of type 'ro_move_home-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_home-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_home-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_home-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_move_home)))
  'ro_move_home-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_move_home)))
  'ro_move_home-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_home)))
  "Returns string type for a service object of type '<ro_move_home>"
  "deepbuilder/ro_move_home")