; Auto-generated. Do not edit!


(cl:in-package deepbuilder-srv)


;//! \htmlinclude rt_get_status-request.msg.html

(cl:defclass <rt_get_status-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rt_get_status-request (<rt_get_status-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_get_status-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_get_status-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_get_status-request> is deprecated: use deepbuilder-srv:rt_get_status-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_get_status-request>) ostream)
  "Serializes a message object of type '<rt_get_status-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_get_status-request>) istream)
  "Deserializes a message object of type '<rt_get_status-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_get_status-request>)))
  "Returns string type for a service object of type '<rt_get_status-request>"
  "deepbuilder/rt_get_statusRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_get_status-request)))
  "Returns string type for a service object of type 'rt_get_status-request"
  "deepbuilder/rt_get_statusRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_get_status-request>)))
  "Returns md5sum for a message object of type '<rt_get_status-request>"
  "c414cc48f9560ab2032cf04710ece6ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_get_status-request)))
  "Returns md5sum for a message object of type 'rt_get_status-request"
  "c414cc48f9560ab2032cf04710ece6ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_get_status-request>)))
  "Returns full string definition for message of type '<rt_get_status-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_get_status-request)))
  "Returns full string definition for message of type 'rt_get_status-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_get_status-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_get_status-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_get_status-request
))
;//! \htmlinclude rt_get_status-response.msg.html

(cl:defclass <rt_get_status-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type deepbuilder-msg:rt_status
    :initform (cl:make-instance 'deepbuilder-msg:rt_status)))
)

(cl:defclass rt_get_status-response (<rt_get_status-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rt_get_status-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rt_get_status-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name deepbuilder-srv:<rt_get_status-response> is deprecated: use deepbuilder-srv:rt_get_status-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <rt_get_status-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader deepbuilder-srv:status-val is deprecated.  Use deepbuilder-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rt_get_status-response>) ostream)
  "Serializes a message object of type '<rt_get_status-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'status) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rt_get_status-response>) istream)
  "Deserializes a message object of type '<rt_get_status-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'status) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rt_get_status-response>)))
  "Returns string type for a service object of type '<rt_get_status-response>"
  "deepbuilder/rt_get_statusResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_get_status-response)))
  "Returns string type for a service object of type 'rt_get_status-response"
  "deepbuilder/rt_get_statusResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rt_get_status-response>)))
  "Returns md5sum for a message object of type '<rt_get_status-response>"
  "c414cc48f9560ab2032cf04710ece6ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rt_get_status-response)))
  "Returns md5sum for a message object of type 'rt_get_status-response"
  "c414cc48f9560ab2032cf04710ece6ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rt_get_status-response>)))
  "Returns full string definition for message of type '<rt_get_status-response>"
  (cl:format cl:nil "rt_status status~%~%================================================================================~%MSG: deepbuilder/rt_status~%#this should contain ALL information about the runtime~%bool gh_present~%bool agent_present~%int64 ros_tick~%string current_controller~%my_msgs/state state~%my_msgs/action action~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rt_get_status-response)))
  "Returns full string definition for message of type 'rt_get_status-response"
  (cl:format cl:nil "rt_status status~%~%================================================================================~%MSG: deepbuilder/rt_status~%#this should contain ALL information about the runtime~%bool gh_present~%bool agent_present~%int64 ros_tick~%string current_controller~%my_msgs/state state~%my_msgs/action action~%================================================================================~%MSG: my_msgs/state~%string action_id~%bool out_of_reach~%bool self_collision~%geometry_msgs/Pose last_tcp~%int32 fastest_box~%int32 highest_box~%float32 current_height~%geometry_msgs/Pose[] box_poses~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: my_msgs/action~%string id~%float32 A0~%float32 A1~%float32 A2~%float32 A3~%float32 A4~%float32 A5~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rt_get_status-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rt_get_status-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rt_get_status-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rt_get_status)))
  'rt_get_status-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rt_get_status)))
  'rt_get_status-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rt_get_status)))
  "Returns string type for a service object of type '<rt_get_status>"
  "deepbuilder/rt_get_status")