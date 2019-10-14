;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_check_path)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_check_path (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_CHECK_PATH")
  (make-package "DEEPBUILDER::RO_CHECK_PATH"))
(unless (find-package "DEEPBUILDER::RO_CHECK_PATHREQUEST")
  (make-package "DEEPBUILDER::RO_CHECK_PATHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_CHECK_PATHRESPONSE")
  (make-package "DEEPBUILDER::RO_CHECK_PATHRESPONSE"))

(in-package "ROS")



(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass deepbuilder::ro_check_pathRequest
  :super ros::object
  :slots (_goal _state _session_name ))

(defmethod deepbuilder::ro_check_pathRequest
  (:init
   (&key
    ((:goal __goal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:state __state) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:session_name __session_name) "")
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _state __state)
   (setq _session_name (string __session_name))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:session_name
   (&optional __session_name)
   (if __session_name (setq _session_name __session_name)) _session_name)
  (:serialization-length
   ()
   (+
    ;; float32[] _goal
    (* 4    (length _goal)) 4
    ;; float32[] _state
    (* 4    (length _state)) 4
    ;; string _session_name
    4 (length _session_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _goal
     (write-long (length _goal) s)
     (dotimes (i (length _goal))
       (sys::poke (elt _goal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _state
     (write-long (length _state) s)
     (dotimes (i (length _state))
       (sys::poke (elt _state i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _session_name
       (write-long (length _session_name) s) (princ _session_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _goal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _state
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _state i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; string _session_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _session_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ro_check_pathResponse
  :super ros::object
  :slots (_path _message ))

(defmethod deepbuilder::ro_check_pathResponse
  (:init
   (&key
    ((:path __path) (instance trajectory_msgs::JointTrajectory :init))
    ((:message __message) "")
    )
   (send-super :init)
   (setq _path __path)
   (setq _message (string __message))
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _path
    (send _path :serialization-length)
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _path
       (send _path :serialize s)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ro_check_path
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_check_path :md5sum-) "1eb7e8316dc45f59de08c07322cfdf4c")
(setf (get deepbuilder::ro_check_path :datatype-) "deepbuilder/ro_check_path")
(setf (get deepbuilder::ro_check_path :request) deepbuilder::ro_check_pathRequest)
(setf (get deepbuilder::ro_check_path :response) deepbuilder::ro_check_pathResponse)

(defmethod deepbuilder::ro_check_pathRequest
  (:response () (instance deepbuilder::ro_check_pathResponse :init)))

(setf (get deepbuilder::ro_check_pathRequest :md5sum-) "1eb7e8316dc45f59de08c07322cfdf4c")
(setf (get deepbuilder::ro_check_pathRequest :datatype-) "deepbuilder/ro_check_pathRequest")
(setf (get deepbuilder::ro_check_pathRequest :definition-)
      "float32[] goal
float32[] state
string session_name
---
trajectory_msgs/JointTrajectory path
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

(setf (get deepbuilder::ro_check_pathResponse :md5sum-) "1eb7e8316dc45f59de08c07322cfdf4c")
(setf (get deepbuilder::ro_check_pathResponse :datatype-) "deepbuilder/ro_check_pathResponse")
(setf (get deepbuilder::ro_check_pathResponse :definition-)
      "float32[] goal
float32[] state
string session_name
---
trajectory_msgs/JointTrajectory path
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



(provide :deepbuilder/ro_check_path "1eb7e8316dc45f59de08c07322cfdf4c")


