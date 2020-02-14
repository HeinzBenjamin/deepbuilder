; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude ro_update_compressed_mesh-request.msg.html

(cl:defclass <ro_update_compressed_mesh-request> (roslisp-msg-protocol:ros-message)
  ((vertices
    :reader vertices
    :initarg :vertices
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (indices
    :reader indices
    :initarg :indices
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (session
    :reader session
    :initarg :session
    :type cl:string
    :initform ""))
)

(cl:defclass ro_update_compressed_mesh-request (<ro_update_compressed_mesh-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_update_compressed_mesh-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_update_compressed_mesh-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_update_compressed_mesh-request> is deprecated: use deepbuilder-srv:ro_update_compressed_mesh-request instead.")))

(cl:ensure-generic-function 'vertices-val :lambda-list '(m))
(cl:defmethod vertices-val ((m <ro_update_compressed_mesh-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:vertices-val is deprecated.  Use deepbuilder-srv:vertices instead.")
  (vertices m))

(cl:ensure-generic-function 'indices-val :lambda-list '(m))
(cl:defmethod indices-val ((m <ro_update_compressed_mesh-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:indices-val is deprecated.  Use deepbuilder-srv:indices instead.")
  (indices m))

(cl:ensure-generic-function 'session-val :lambda-list '(m))
(cl:defmethod session-val ((m <ro_update_compressed_mesh-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:session-val is deprecated.  Use deepbuilder-srv:session instead.")
  (session m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_update_compressed_mesh-request>) ostream)
  "Serializes a message object of type '<ro_update_compressed_mesh-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vertices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'vertices))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'indices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'indices))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'session))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'session))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_update_compressed_mesh-request>) istream)
  "Deserializes a message object of type '<ro_update_compressed_mesh-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vertices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vertices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'indices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'indices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'session) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'session) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_update_compressed_mesh-request>)))
  "Returns string type for a service object of type '<ro_update_compressed_mesh-request>"
  "deepbuilder/ro_update_compressed_meshRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_update_compressed_mesh-request)))
  "Returns string type for a service object of type 'ro_update_compressed_mesh-request"
  "deepbuilder/ro_update_compressed_meshRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_update_compressed_mesh-request>)))
  "Returns md5sum for a message object of type '<ro_update_compressed_mesh-request>"
  "230cfe3cf22bf1c93dac2ac217ea4d24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_update_compressed_mesh-request)))
  "Returns md5sum for a message object of type 'ro_update_compressed_mesh-request"
  "230cfe3cf22bf1c93dac2ac217ea4d24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_update_compressed_mesh-request>)))
  "Returns full string definition for message of type '<ro_update_compressed_mesh-request>"
  (cl:format cl:nil "float32[] vertices~%int32[] indices~%string session~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_update_compressed_mesh-request)))
  "Returns full string definition for message of type 'ro_update_compressed_mesh-request"
  (cl:format cl:nil "float32[] vertices~%int32[] indices~%string session~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_update_compressed_mesh-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vertices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'indices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'session))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_update_compressed_mesh-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_update_compressed_mesh-request
    (cl:cons ':vertices (vertices msg))
    (cl:cons ':indices (indices msg))
    (cl:cons ':session (session msg))
))
;//! \htmlinclude ro_update_compressed_mesh-response.msg.html

(cl:defclass <ro_update_compressed_mesh-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ro_update_compressed_mesh-response (<ro_update_compressed_mesh-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ro_update_compressed_mesh-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ro_update_compressed_mesh-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<ro_update_compressed_mesh-response> is deprecated: use deepbuilder-srv:ro_update_compressed_mesh-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ro_update_compressed_mesh-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:message-val is deprecated.  Use deepbuilder-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ro_update_compressed_mesh-response>) ostream)
  "Serializes a message object of type '<ro_update_compressed_mesh-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ro_update_compressed_mesh-response>) istream)
  "Deserializes a message object of type '<ro_update_compressed_mesh-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ro_update_compressed_mesh-response>)))
  "Returns string type for a service object of type '<ro_update_compressed_mesh-response>"
  "deepbuilder/ro_update_compressed_meshResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_update_compressed_mesh-response)))
  "Returns string type for a service object of type 'ro_update_compressed_mesh-response"
  "deepbuilder/ro_update_compressed_meshResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ro_update_compressed_mesh-response>)))
  "Returns md5sum for a message object of type '<ro_update_compressed_mesh-response>"
  "230cfe3cf22bf1c93dac2ac217ea4d24")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ro_update_compressed_mesh-response)))
  "Returns md5sum for a message object of type 'ro_update_compressed_mesh-response"
  "230cfe3cf22bf1c93dac2ac217ea4d24")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ro_update_compressed_mesh-response>)))
  "Returns full string definition for message of type '<ro_update_compressed_mesh-response>"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ro_update_compressed_mesh-response)))
  "Returns full string definition for message of type 'ro_update_compressed_mesh-response"
  (cl:format cl:nil "string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ro_update_compressed_mesh-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ro_update_compressed_mesh-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ro_update_compressed_mesh-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ro_update_compressed_mesh)))
  'ro_update_compressed_mesh-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ro_update_compressed_mesh)))
  'ro_update_compressed_mesh-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ro_update_compressed_mesh)))
  "Returns string type for a service object of type '<ro_update_compressed_mesh>"
  "deepbuilder/ro_update_compressed_mesh")