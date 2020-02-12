;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_plan_path)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_plan_path (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_PLAN_PATH")
  (make-package "DEEPBUILDER::RO_PLAN_PATH"))
(unless (find-package "DEEPBUILDER::RO_PLAN_PATHREQUEST")
  (make-package "DEEPBUILDER::RO_PLAN_PATHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_PLAN_PATHRESPONSE")
  (make-package "DEEPBUILDER::RO_PLAN_PATHRESPONSE"))

(in-package "ROS")



(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass deepbuilder::ro_plan_pathRequest
  :super ros::object
  :slots (_goal_pose _state_pose _session _speed ))

(defmethod deepbuilder::ro_plan_pathRequest
  (:init
   (&key
    ((:goal_pose __goal_pose) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:state_pose __state_pose) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:session __session) "")
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _goal_pose __goal_pose)
   (setq _state_pose __state_pose)
   (setq _session (string __session))
   (setq _speed (float __speed))
   self)
  (:goal_pose
   (&optional __goal_pose)
   (if __goal_pose (setq _goal_pose __goal_pose)) _goal_pose)
  (:state_pose
   (&optional __state_pose)
   (if __state_pose (setq _state_pose __state_pose)) _state_pose)
  (:session
   (&optional __session)
   (if __session (setq _session __session)) _session)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32[] _goal_pose
    (* 4    (length _goal_pose)) 4
    ;; float32[] _state_pose
    (* 4    (length _state_pose)) 4
    ;; string _session
    4 (length _session)
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _goal_pose
     (write-long (length _goal_pose) s)
     (dotimes (i (length _goal_pose))
       (sys::poke (elt _goal_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _state_pose
     (write-long (length _state_pose) s)
     (dotimes (i (length _state_pose))
       (sys::poke (elt _state_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _session
       (write-long (length _session) s) (princ _session s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _goal_pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _goal_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _state_pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state_pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _state_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; string _session
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _session (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_plan_pathResponse
  :super ros::object
  :slots (_path _collisions _message ))

(defmethod deepbuilder::ro_plan_pathResponse
  (:init
   (&key
    ((:path __path) (instance trajectory_msgs::JointTrajectory :init))
    ((:collisions __collisions) (let (r) (dotimes (i 0) (push nil r)) r))
    ((:message __message) "")
    )
   (send-super :init)
   (setq _path __path)
   (setq _collisions __collisions)
   (setq _message (string __message))
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:collisions
   (&optional __collisions)
   (if __collisions (setq _collisions __collisions)) _collisions)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _path
    (send _path :serialization-length)
    ;; bool[] _collisions
    (* 1    (length _collisions)) 4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _path
       (send _path :serialize s)
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
   ;; trajectory_msgs/JointTrajectory _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
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

(defclass deepbuilder::ro_plan_path
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_plan_path :md5sum-) "6bb18060add6f8092d505a812c13f49f")
(setf (get deepbuilder::ro_plan_path :datatype-) "deepbuilder/ro_plan_path")
(setf (get deepbuilder::ro_plan_path :request) deepbuilder::ro_plan_pathRequest)
(setf (get deepbuilder::ro_plan_path :response) deepbuilder::ro_plan_pathResponse)

(defmethod deepbuilder::ro_plan_pathRequest
  (:response () (instance deepbuilder::ro_plan_pathResponse :init)))

(setf (get deepbuilder::ro_plan_pathRequest :md5sum-) "6bb18060add6f8092d505a812c13f49f")
(setf (get deepbuilder::ro_plan_pathRequest :datatype-) "deepbuilder/ro_plan_pathRequest")
(setf (get deepbuilder::ro_plan_pathRequest :definition-)
      "float32[] goal_pose
float32[] state_pose
string session
float32 speed
---
trajectory_msgs/JointTrajectory path

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

(setf (get deepbuilder::ro_plan_pathResponse :md5sum-) "6bb18060add6f8092d505a812c13f49f")
(setf (get deepbuilder::ro_plan_pathResponse :datatype-) "deepbuilder/ro_plan_pathResponse")
(setf (get deepbuilder::ro_plan_pathResponse :definition-)
      "float32[] goal_pose
float32[] state_pose
string session
float32 speed
---
trajectory_msgs/JointTrajectory path

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



(provide :deepbuilder/ro_plan_path "6bb18060add6f8092d505a812c13f49f")


