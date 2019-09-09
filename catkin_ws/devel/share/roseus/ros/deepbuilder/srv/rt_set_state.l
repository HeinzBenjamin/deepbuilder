;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_set_state)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_set_state (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_SET_STATE")
  (make-package "DEEPBUILDER::RT_SET_STATE"))
(unless (find-package "DEEPBUILDER::RT_SET_STATEREQUEST")
  (make-package "DEEPBUILDER::RT_SET_STATEREQUEST"))
(unless (find-package "DEEPBUILDER::RT_SET_STATERESPONSE")
  (make-package "DEEPBUILDER::RT_SET_STATERESPONSE"))

(in-package "ROS")

(if (not (find-package "MY_MSGS"))
  (ros::roseus-add-msgs "my_msgs"))




(defclass deepbuilder::rt_set_stateRequest
  :super ros::object
  :slots (_controller _state ))

(defmethod deepbuilder::rt_set_stateRequest
  (:init
   (&key
    ((:controller __controller) "")
    ((:state __state) (instance my_msgs::state :init))
    )
   (send-super :init)
   (setq _controller (string __controller))
   (setq _state __state)
   self)
  (:controller
   (&optional __controller)
   (if __controller (setq _controller __controller)) _controller)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; string _controller
    4 (length _controller)
    ;; my_msgs/state _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _controller
       (write-long (length _controller) s) (princ _controller s)
     ;; my_msgs/state _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _controller
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _controller (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; my_msgs/state _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(defclass deepbuilder::rt_set_stateResponse
  :super ros::object
  :slots ())

(defmethod deepbuilder::rt_set_stateResponse
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

(defclass deepbuilder::rt_set_state
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_set_state :md5sum-) "32b4089e124a4eaa45ecb040a983b2cd")
(setf (get deepbuilder::rt_set_state :datatype-) "deepbuilder/rt_set_state")
(setf (get deepbuilder::rt_set_state :request) deepbuilder::rt_set_stateRequest)
(setf (get deepbuilder::rt_set_state :response) deepbuilder::rt_set_stateResponse)

(defmethod deepbuilder::rt_set_stateRequest
  (:response () (instance deepbuilder::rt_set_stateResponse :init)))

(setf (get deepbuilder::rt_set_stateRequest :md5sum-) "32b4089e124a4eaa45ecb040a983b2cd")
(setf (get deepbuilder::rt_set_stateRequest :datatype-) "deepbuilder/rt_set_stateRequest")
(setf (get deepbuilder::rt_set_stateRequest :definition-)
      "string controller
my_msgs/state state

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
---
")

(setf (get deepbuilder::rt_set_stateResponse :md5sum-) "32b4089e124a4eaa45ecb040a983b2cd")
(setf (get deepbuilder::rt_set_stateResponse :datatype-) "deepbuilder/rt_set_stateResponse")
(setf (get deepbuilder::rt_set_stateResponse :definition-)
      "string controller
my_msgs/state state

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
---
")



(provide :deepbuilder/rt_set_state "32b4089e124a4eaa45ecb040a983b2cd")


