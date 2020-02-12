;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_plan_motion)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_plan_motion (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_PLAN_MOTION")
  (make-package "DEEPBUILDER::RO_PLAN_MOTION"))
(unless (find-package "DEEPBUILDER::RO_PLAN_MOTIONREQUEST")
  (make-package "DEEPBUILDER::RO_PLAN_MOTIONREQUEST"))
(unless (find-package "DEEPBUILDER::RO_PLAN_MOTIONRESPONSE")
  (make-package "DEEPBUILDER::RO_PLAN_MOTIONRESPONSE"))

(in-package "ROS")



(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass deepbuilder::ro_plan_motionRequest
  :super ros::object
  :slots (_first_point_joint_states _way_points _speed ))

(defmethod deepbuilder::ro_plan_motionRequest
  (:init
   (&key
    ((:first_point_joint_states __first_point_joint_states) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:way_points __way_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _first_point_joint_states __first_point_joint_states)
   (setq _way_points __way_points)
   (setq _speed (float __speed))
   self)
  (:first_point_joint_states
   (&optional __first_point_joint_states)
   (if __first_point_joint_states (setq _first_point_joint_states __first_point_joint_states)) _first_point_joint_states)
  (:way_points
   (&optional __way_points)
   (if __way_points (setq _way_points __way_points)) _way_points)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32[] _first_point_joint_states
    (* 4    (length _first_point_joint_states)) 4
    ;; float32[] _way_points
    (* 4    (length _way_points)) 4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _first_point_joint_states
     (write-long (length _first_point_joint_states) s)
     (dotimes (i (length _first_point_joint_states))
       (sys::poke (elt _first_point_joint_states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _way_points
     (write-long (length _way_points) s)
     (dotimes (i (length _way_points))
       (sys::poke (elt _way_points i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _first_point_joint_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _first_point_joint_states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _first_point_joint_states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _way_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _way_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _way_points i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_plan_motionResponse
  :super ros::object
  :slots (_motion_plan _collisions _message ))

(defmethod deepbuilder::ro_plan_motionResponse
  (:init
   (&key
    ((:motion_plan __motion_plan) (instance trajectory_msgs::JointTrajectory :init))
    ((:collisions __collisions) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:message __message) "")
    )
   (send-super :init)
   (setq _motion_plan __motion_plan)
   (setq _collisions __collisions)
   (setq _message (string __message))
   self)
  (:motion_plan
   (&rest __motion_plan)
   (if (keywordp (car __motion_plan))
       (send* _motion_plan __motion_plan)
     (progn
       (if __motion_plan (setq _motion_plan (car __motion_plan)))
       _motion_plan)))
  (:collisions
   (&optional __collisions)
   (if __collisions (setq _collisions __collisions)) _collisions)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _motion_plan
    (send _motion_plan :serialization-length)
    ;; bool[] _collisions
    (* 1    (length _collisions)) 4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _motion_plan
       (send _motion_plan :serialize s)
     ;; bool[] _collisions
     (write-long (length _collisions) s)
     (dotimes (i (length _collisions))
       (if (elt _collisions i) (write-byte -1 s) (write-byte 0 s))
       )
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _motion_plan
     (send _motion_plan :deserialize buf ptr-) (incf ptr- (send _motion_plan :serialization-length))
   ;; bool[] _collisions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _collisions (make-list n))
     (dotimes (i n)
     (setf (elt _collisions i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ro_plan_motion
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_plan_motion :md5sum-) "79a5a45e866664a192667e3d0dcdaa5f")
(setf (get deepbuilder::ro_plan_motion :datatype-) "deepbuilder/ro_plan_motion")
(setf (get deepbuilder::ro_plan_motion :request) deepbuilder::ro_plan_motionRequest)
(setf (get deepbuilder::ro_plan_motion :response) deepbuilder::ro_plan_motionResponse)

(defmethod deepbuilder::ro_plan_motionRequest
  (:response () (instance deepbuilder::ro_plan_motionResponse :init)))

(setf (get deepbuilder::ro_plan_motionRequest :md5sum-) "79a5a45e866664a192667e3d0dcdaa5f")
(setf (get deepbuilder::ro_plan_motionRequest :datatype-) "deepbuilder/ro_plan_motionRequest")
(setf (get deepbuilder::ro_plan_motionRequest :definition-)
      "float32[] first_point_joint_states
float32[] way_points
float32 speed
---
trajectory_msgs/JointTrajectory motion_plan

bool[] collisions
string message

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
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

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
")

(setf (get deepbuilder::ro_plan_motionResponse :md5sum-) "79a5a45e866664a192667e3d0dcdaa5f")
(setf (get deepbuilder::ro_plan_motionResponse :datatype-) "deepbuilder/ro_plan_motionResponse")
(setf (get deepbuilder::ro_plan_motionResponse :definition-)
      "float32[] first_point_joint_states
float32[] way_points
float32 speed
---
trajectory_msgs/JointTrajectory motion_plan

bool[] collisions
string message

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
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

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
")



(provide :deepbuilder/ro_plan_motion "79a5a45e866664a192667e3d0dcdaa5f")


