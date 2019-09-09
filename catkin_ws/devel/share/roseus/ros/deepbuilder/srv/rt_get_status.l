;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_get_status)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_get_status (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_GET_STATUS")
  (make-package "DEEPBUILDER::RT_GET_STATUS"))
(unless (find-package "DEEPBUILDER::RT_GET_STATUSREQUEST")
  (make-package "DEEPBUILDER::RT_GET_STATUSREQUEST"))
(unless (find-package "DEEPBUILDER::RT_GET_STATUSRESPONSE")
  (make-package "DEEPBUILDER::RT_GET_STATUSRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::rt_get_statusRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::rt_get_statusRequest
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

(defclass deepbuilder::rt_get_statusResponse
  :super ros::object
  :slots (_status ))

(defmethod deepbuilder::rt_get_statusResponse
  (:init
   (&key
    ((:status __status) (instance deepbuilder::rt_status :init))
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&rest __status)
   (if (keywordp (car __status))
       (send* _status __status)
     (progn
       (if __status (setq _status (car __status)))
       _status)))
  (:serialization-length
   ()
   (+
    ;; deepbuilder/rt_status _status
    (send _status :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; deepbuilder/rt_status _status
       (send _status :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; deepbuilder/rt_status _status
     (send _status :deserialize buf ptr-) (incf ptr- (send _status :serialization-length))
   ;;
   self)
  )

(defclass deepbuilder::rt_get_status
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_get_status :md5sum-) "c414cc48f9560ab2032cf04710ece6ce")
(setf (get deepbuilder::rt_get_status :datatype-) "deepbuilder/rt_get_status")
(setf (get deepbuilder::rt_get_status :request) deepbuilder::rt_get_statusRequest)
(setf (get deepbuilder::rt_get_status :response) deepbuilder::rt_get_statusResponse)

(defmethod deepbuilder::rt_get_statusRequest
  (:response () (instance deepbuilder::rt_get_statusResponse :init)))

(setf (get deepbuilder::rt_get_statusRequest :md5sum-) "c414cc48f9560ab2032cf04710ece6ce")
(setf (get deepbuilder::rt_get_statusRequest :datatype-) "deepbuilder/rt_get_statusRequest")
(setf (get deepbuilder::rt_get_statusRequest :definition-)
      "---
rt_status status

================================================================================
MSG: deepbuilder/rt_status
#this should contain ALL information about the runtime
bool gh_present
bool agent_present
int64 ros_tick
string current_controller
my_msgs/state state
my_msgs/action action
================================================================================
MSG: my_msgs/state
string action_id
bool out_of_reach
bool self_collision
geometry_msgs/Pose last_tcp
int32 fastest_box
int32 highest_box
float32 current_height
geometry_msgs/Pose[] box_poses
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: my_msgs/action
string id
float32 A0
float32 A1
float32 A2
float32 A3
float32 A4
")

(setf (get deepbuilder::rt_get_statusResponse :md5sum-) "c414cc48f9560ab2032cf04710ece6ce")
(setf (get deepbuilder::rt_get_statusResponse :datatype-) "deepbuilder/rt_get_statusResponse")
(setf (get deepbuilder::rt_get_statusResponse :definition-)
      "---
rt_status status

================================================================================
MSG: deepbuilder/rt_status
#this should contain ALL information about the runtime
bool gh_present
bool agent_present
int64 ros_tick
string current_controller
my_msgs/state state
my_msgs/action action
================================================================================
MSG: my_msgs/state
string action_id
bool out_of_reach
bool self_collision
geometry_msgs/Pose last_tcp
int32 fastest_box
int32 highest_box
float32 current_height
geometry_msgs/Pose[] box_poses
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: my_msgs/action
string id
float32 A0
float32 A1
float32 A2
float32 A3
float32 A4
")



(provide :deepbuilder/rt_get_status "c414cc48f9560ab2032cf04710ece6ce")


