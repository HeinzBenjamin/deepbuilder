; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_get_robot_state-request.msg.html

(cl:defclass <ro_get_robot_state-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ro_get_robot_state-request (<ro_get_robot_state-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_robot_state-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_robot_state-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_robot_state-request> is deprecated: use deepbuilder-srv:ro_get_robot_state-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_robot_state-request>) ostream)
  "Serializes a message object of type '<ro_get_robot_state-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_robot_state-request>) istream)
  "Deserializes a message object of type '<ro_get_robot_state-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_robot_state-request>)))
  "Returns string type for a service object of type '<ro_get_robot_state-request>"
  "deepbuilder/ro_get_robot_stateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_robot_state-request)))
  "Returns string type for a service object of type 'ro_get_robot_state-request"
  "deepbuilder/ro_get_robot_stateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_robot_state-request>)))
  "Returns md5sum for a message object of type '<ro_get_robot_state-request>"
  "4fa113d228950451cb528101719c77a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_robot_state-request)))
  "Returns md5sum for a message object of type 'ro_get_robot_state-request"
  "4fa113d228950451cb528101719c77a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_robot_state-request>)))
  "Returns full string definition for message of type '<ro_get_robot_state-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_robot_state-request)))
  "Returns full string definition for message of type 'ro_get_robot_state-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_robot_state-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_robot_state-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_robot_state-request
))
;//! \htmlinclude ro_get_robot_state-response.msg.html

(cl:defclass <ro_get_robot_state-response> (roslisp-msg-protocol:ros-message)
  ((joint_states
    :reader joint_states
    :initarg :joint_states
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ro_get_robot_state-response (<ro_get_robot_state-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_get_robot_state-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_get_robot_state-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_get_robot_state-response> is deprecated: use deepbuilder-srv:ro_get_robot_state-response instead.")))

(cl:ensure-generic-function 'joint_states-val :lambda-list '(m))
(cl:defmethod joint_states-val ((m <ro_get_robot_state-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:joint_states-val is deprecated.  Use deepbuilder-srv:joint_states instead.")
  (joint_states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_get_robot_state-response>) ostream)
  "Serializes a message object of type '<ro_get_robot_state-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'joint_states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_get_robot_state-response>) istream)
  "Deserializes a message object of type '<ro_get_robot_state-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_get_robot_state-response>)))
  "Returns string type for a service object of type '<ro_get_robot_state-response>"
  "deepbuilder/ro_get_robot_stateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_robot_state-response)))
  "Returns string type for a service object of type 'ro_get_robot_state-response"
  "deepbuilder/ro_get_robot_stateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_get_robot_state-response>)))
  "Returns md5sum for a message object of type '<ro_get_robot_state-response>"
  "4fa113d228950451cb528101719c77a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_get_robot_state-response)))
  "Returns md5sum for a message object of type 'ro_get_robot_state-response"
  "4fa113d228950451cb528101719c77a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_get_robot_state-response>)))
  "Returns full string definition for message of type '<ro_get_robot_state-response>"
  (cl:format cl:nil "float32[] joint_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_get_robot_state-response)))
  "Returns full string definition for message of type 'ro_get_robot_state-response"
  (cl:format cl:nil "float32[] joint_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_get_robot_state-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_get_robot_state-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_get_robot_state-response
    (cl:cons ':joint_states (joint_states msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_get_robot_state)))
  'ro_get_robot_state-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_get_robot_state)))
  'ro_get_robot_state-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_get_robot_state)))
  "Returns string type for a service object of type '<ro_get_robot_state>"
  "deepbuilder/ro_get_robot_state")