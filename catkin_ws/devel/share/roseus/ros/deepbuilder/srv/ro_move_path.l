;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_move_path)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_move_path (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATH")
  (make-package "DEEPBUILDER::RO_MOVE_PATH"))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATHREQUEST")
  (make-package "DEEPBUILDER::RO_MOVE_PATHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATHRESPONSE")
  (make-package "DEEPBUILDER::RO_MOVE_PATHRESPONSE"))

(in-package "ROS")

(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))




(defclass deepbuilder::ro_move_pathRequest
  :super ros::object
  :slots (_path _wait ))

(defmethod deepbuilder::ro_move_pathRequest
  (:init
   (&key
    ((:path __path) (instance trajectory_msgs::JointTrajectory :init))
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _path __path)
   (setq _wait __wait)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:wait
   (&optional __wait)
   (if __wait (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _path
    (send _path :serialization-length)
    ;; bool _wait
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _path
       (send _path :serialize s)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::ro_move_pathResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_move_pathResponse
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ro_move_path
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_move_path :md5sum-) "2e66b98388464afecfb23731a1f9334b")
(setf (get deepbuilder::ro_move_path :datatype-) "deepbuilder/ro_move_path")
(setf (get deepbuilder::ro_move_path :request) deepbuilder::ro_move_pathRequest)
(setf (get deepbuilder::ro_move_path :response) deepbuilder::ro_move_pathResponse)

(defmethod deepbuilder::ro_move_pathRequest
  (:response () (instance deepbuilder::ro_move_pathResponse :init)))

(setf (get deepbuilder::ro_move_pathRequest :md5sum-) "2e66b98388464afecfb23731a1f9334b")
(setf (get deepbuilder::ro_move_pathRequest :datatype-) "deepbuilder/ro_move_pathRequest")
(setf (get deepbuilder::ro_move_pathRequest :definition-)
      "trajectory_msgs/JointTrajectory path
bool wait

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
---
string message
")

(setf (get deepbuilder::ro_move_pathResponse :md5sum-) "2e66b98388464afecfb23731a1f9334b")
(setf (get deepbuilder::ro_move_pathResponse :datatype-) "deepbuilder/ro_move_pathResponse")
(setf (get deepbuilder::ro_move_pathResponse :definition-)
      "trajectory_msgs/JointTrajectory path
bool wait

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
---
string message
")



(provide :deepbuilder/ro_move_path "2e66b98388464afecfb23731a1f9334b")


