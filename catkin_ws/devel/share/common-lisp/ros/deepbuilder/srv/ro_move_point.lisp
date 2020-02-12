; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_move_point-request.msg.html

(cl:defclass <ro_move_point-request> (roslisp-msg-protocol:ros-message)
  ((goal_pose
    :reader goal_pose
    :initarg :goal_pose
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (speed
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

(cl:defclass ro_move_point-request (<ro_move_point-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_point-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_point-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_point-request> is deprecated: use deepbuilder-srv:ro_move_point-request instead.")))

(cl:ensure-generic-function 'goal_pose-val :lambda-list '(m))
(cl:defmethod goal_pose-val ((m <ro_move_point-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:goal_pose-val is deprecated.  Use deepbuilder-srv:goal_pose instead.")
  (goal_pose m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ro_move_point-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:speed-val is deprecated.  Use deepbuilder-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'wait-val :lambda-list '(m))
(cl:defmethod wait-val ((m <ro_move_point-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:wait-val is deprecated.  Use deepbuilder-srv:wait instead.")
  (wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_point-request>) ostream)
  "Serializes a message object of type '<ro_move_point-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'goal_pose))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_point-request>) istream)
  "Deserializes a message object of type '<ro_move_point-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal_pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal_pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'wait) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_point-request>)))
  "Returns string type for a service object of type '<ro_move_point-request>"
  "deepbuilder/ro_move_pointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_point-request)))
  "Returns string type for a service object of type 'ro_move_point-request"
  "deepbuilder/ro_move_pointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_point-request>)))
  "Returns md5sum for a message object of type '<ro_move_point-request>"
  "63f6e48d493920111c122f8ee202a5d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_point-request)))
  "Returns md5sum for a message object of type 'ro_move_point-request"
  "63f6e48d493920111c122f8ee202a5d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_point-request>)))
  "Returns full string definition for message of type '<ro_move_point-request>"
  (cl:format cl:nil "float32[] goal_pose~%float32 speed~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_point-request)))
  "Returns full string definition for message of type 'ro_move_point-request"
  (cl:format cl:nil "float32[] goal_pose~%float32 speed~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_point-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal_pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_point-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_point-request
    (cl:cons ':goal_pose (goal_pose msg))
    (cl:cons ':speed (speed msg))
    (cl:cons ':wait (wait msg))
))
;//! \htmlinclude ro_move_point-response.msg.html

(cl:defclass <ro_move_point-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_move_point-response (<ro_move_point-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_move_point-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_move_point-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_move_point-response> is deprecated: use deepbuilder-srv:ro_move_point-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_move_point-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_move_point-response>) ostream)
  "Serializes a message object of type '<ro_move_point-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_move_point-response>) istream)
  "Deserializes a message object of type '<ro_move_point-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_move_point-response>)))
  "Returns string type for a service object of type '<ro_move_point-response>"
  "deepbuilder/ro_move_pointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_point-response)))
  "Returns string type for a service object of type 'ro_move_point-response"
  "deepbuilder/ro_move_pointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_move_point-response>)))
  "Returns md5sum for a message object of type '<ro_move_point-response>"
  "63f6e48d493920111c122f8ee202a5d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_move_point-response)))
  "Returns md5sum for a message object of type 'ro_move_point-response"
  "63f6e48d493920111c122f8ee202a5d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_move_point-response>)))
  "Returns full string definition for message of type '<ro_move_point-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_move_point-response)))
  "Returns full string definition for message of type 'ro_move_point-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_move_point-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_move_point-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_move_point-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_move_point)))
  'ro_move_point-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_move_point)))
  'ro_move_point-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_move_point)))
  "Returns string type for a service object of type '<ro_move_point>"
  "deepbuilder/ro_move_point")