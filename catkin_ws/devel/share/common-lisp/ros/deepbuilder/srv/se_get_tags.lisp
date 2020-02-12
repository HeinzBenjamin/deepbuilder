; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude se_get_tags-request.msg.html

(cl:defclass <se_get_tags-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass se_get_tags-request (<se_get_tags-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_get_tags-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_get_tags-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_get_tags-request> is deprecated: use deepbuilder-srv:se_get_tags-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_get_tags-request>) ostream)
  "Serializes a message object of type '<se_get_tags-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_get_tags-request>) istream)
  "Deserializes a message object of type '<se_get_tags-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_get_tags-request>)))
  "Returns string type for a service object of type '<se_get_tags-request>"
  "deepbuilder/se_get_tagsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_tags-request)))
  "Returns string type for a service object of type 'se_get_tags-request"
  "deepbuilder/se_get_tagsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_get_tags-request>)))
  "Returns md5sum for a message object of type '<se_get_tags-request>"
  "ed7bb1e8d94ce303317cf11ef2ce623d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_get_tags-request)))
  "Returns md5sum for a message object of type 'se_get_tags-request"
  "ed7bb1e8d94ce303317cf11ef2ce623d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_get_tags-request>)))
  "Returns full string definition for message of type '<se_get_tags-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_get_tags-request)))
  "Returns full string definition for message of type 'se_get_tags-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_get_tags-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_get_tags-request>))
  "Converts a ROS message object to a list"
  (cl:list 'se_get_tags-request
))
;//! \htmlinclude se_get_tags-response.msg.html

(cl:defclass <se_get_tags-response> (roslisp-msg-protocol:ros-message)
  ((tag_poses
    :reader tag_poses
    :initarg :tag_poses
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (types
    :reader types
    :initarg :types
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (ids
    :reader ids
    :initarg :ids
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass se_get_tags-response (<se_get_tags-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <se_get_tags-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'se_get_tags-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<se_get_tags-response> is deprecated: use deepbuilder-srv:se_get_tags-response instead.")))

(cl:ensure-generic-function 'tag_poses-val :lambda-list '(m))
(cl:defmethod tag_poses-val ((m <se_get_tags-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:tag_poses-val is deprecated.  Use deepbuilder-srv:tag_poses instead.")
  (tag_poses m))

(cl:ensure-generic-function 'types-val :lambda-list '(m))
(cl:defmethod types-val ((m <se_get_tags-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:types-val is deprecated.  Use deepbuilder-srv:types instead.")
  (types m))

(cl:ensure-generic-function 'ids-val :lambda-list '(m))
(cl:defmethod ids-val ((m <se_get_tags-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:ids-val is deprecated.  Use deepbuilder-srv:ids instead.")
  (ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <se_get_tags-response>) ostream)
  "Serializes a message object of type '<se_get_tags-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tag_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'tag_poses))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'types))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'types))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ids))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    ))
   (cl:slot-value msg 'ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <se_get_tags-response>) istream)
  "Deserializes a message object of type '<se_get_tags-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tag_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tag_poses)))
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
  (cl:setf (cl:slot-value msg 'types) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'types)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ids)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<se_get_tags-response>)))
  "Returns string type for a service object of type '<se_get_tags-response>"
  "deepbuilder/se_get_tagsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_tags-response)))
  "Returns string type for a service object of type 'se_get_tags-response"
  "deepbuilder/se_get_tagsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<se_get_tags-response>)))
  "Returns md5sum for a message object of type '<se_get_tags-response>"
  "ed7bb1e8d94ce303317cf11ef2ce623d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'se_get_tags-response)))
  "Returns md5sum for a message object of type 'se_get_tags-response"
  "ed7bb1e8d94ce303317cf11ef2ce623d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<se_get_tags-response>)))
  "Returns full string definition for message of type '<se_get_tags-response>"
  (cl:format cl:nil "float32[] tag_poses~%int8[] types~%int8[] ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'se_get_tags-response)))
  "Returns full string definition for message of type 'se_get_tags-response"
  (cl:format cl:nil "float32[] tag_poses~%int8[] types~%int8[] ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <se_get_tags-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tag_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'types) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <se_get_tags-response>))
  "Converts a ROS message object to a list"
  (cl:list 'se_get_tags-response
    (cl:cons ':tag_poses (tag_poses msg))
    (cl:cons ':types (types msg))
    (cl:cons ':ids (ids msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'se_get_tags)))
  'se_get_tags-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'se_get_tags)))
  'se_get_tags-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'se_get_tags)))
  "Returns string type for a service object of type '<se_get_tags>"
  "deepbuilder/se_get_tags")