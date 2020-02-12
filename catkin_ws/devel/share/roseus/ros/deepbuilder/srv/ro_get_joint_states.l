;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_get_joint_states)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_get_joint_states (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GET_JOINT_STATES")
  (make-package "DEEPBUILDER::RO_GET_JOINT_STATES"))
(unless (find-package "DEEPBUILDER::RO_GET_JOINT_STATESREQUEST")
  (make-package "DEEPBUILDER::RO_GET_JOINT_STATESREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GET_JOINT_STATESRESPONSE")
  (make-package "DEEPBUILDER::RO_GET_JOINT_STATESRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass deepbuilder::ro_get_joint_statesRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::ro_get_joint_statesRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass deepbuilder::ro_get_joint_statesResponse
  :super ros::object
  :slots (_joint_states ))

(defmethod deepbuilder::ro_get_joint_statesResponse
  (:init
   (&key
    ((:joint_states __joint_states) (instance sensor_msgs::JointState :init))
    )
   (send-super :init)
   (setq _joint_states __joint_states)
   self)
  (:joint_states
   (&rest __joint_states)
   (if (keywordp (car __joint_states))
       (send* _joint_states __joint_states)
     (progn
       (if __joint_states (setq _joint_states (car __joint_states)))
       _joint_states)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/JointState _joint_states
    (send _joint_states :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/JointState _joint_states
       (send _joint_states :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/JointState _joint_states
     (send _joint_states :deserialize buf ptr-) (incf ptr- (send _joint_states :serialization-length))
   ;;
   self)
  )

(defclass deepbuilder::ro_get_joint_states
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_get_joint_states :md5sum-) "482cc7b23f4d6ca5e5aac26ecce1ce01")
(setf (get deepbuilder::ro_get_joint_states :datatype-) "deepbuilder/ro_get_joint_states")
(setf (get deepbuilder::ro_get_joint_states :request) deepbuilder::ro_get_joint_statesRequest)
(setf (get deepbuilder::ro_get_joint_states :response) deepbuilder::ro_get_joint_statesResponse)

(defmethod deepbuilder::ro_get_joint_statesRequest
  (:response () (instance deepbuilder::ro_get_joint_statesResponse :init)))

(setf (get deepbuilder::ro_get_joint_statesRequest :md5sum-) "482cc7b23f4d6ca5e5aac26ecce1ce01")
(setf (get deepbuilder::ro_get_joint_statesRequest :datatype-) "deepbuilder/ro_get_joint_statesRequest")
(setf (get deepbuilder::ro_get_joint_statesRequest :definition-)
      "---
sensor_msgs/JointState joint_states

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")

(setf (get deepbuilder::ro_get_joint_statesResponse :md5sum-) "482cc7b23f4d6ca5e5aac26ecce1ce01")
(setf (get deepbuilder::ro_get_joint_statesResponse :datatype-) "deepbuilder/ro_get_joint_statesResponse")
(setf (get deepbuilder::ro_get_joint_statesResponse :definition-)
      "---
sensor_msgs/JointState joint_states

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")



(provide :deepbuilder/ro_get_joint_states "482cc7b23f4d6ca5e5aac26ecce1ce01")


