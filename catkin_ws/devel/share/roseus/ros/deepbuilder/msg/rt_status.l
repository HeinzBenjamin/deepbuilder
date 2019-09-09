;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_status)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_status (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_STATUS")
  (make-package "DEEPBUILDER::RT_STATUS"))

(in-package "ROS")
;;//! \htmlinclude rt_status.msg.html
(if (not (find-package "MY_MSGS"))
  (ros::roseus-add-msgs "my_msgs"))


(defclass deepbuilder::rt_status
  :super ros::object
  :slots (_gh_present _agent_present _ros_tick _current_controller _state _action ))

(defmethod deepbuilder::rt_status
  (:init
   (&key
    ((:gh_present __gh_present) nil)
    ((:agent_present __agent_present) nil)
    ((:ros_tick __ros_tick) 0)
    ((:current_controller __current_controller) "")
    ((:state __state) (instance my_msgs::state :init))
    ((:action __action) (instance my_msgs::action :init))
    )
   (send-super :init)
   (setq _gh_present __gh_present)
   (setq _agent_present __agent_present)
   (setq _ros_tick (round __ros_tick))
   (setq _current_controller (string __current_controller))
   (setq _state __state)
   (setq _action __action)
   self)
  (:gh_present
   (&optional __gh_present)
   (if __gh_present (setq _gh_present __gh_present)) _gh_present)
  (:agent_present
   (&optional __agent_present)
   (if __agent_present (setq _agent_present __agent_present)) _agent_present)
  (:ros_tick
   (&optional __ros_tick)
   (if __ros_tick (setq _ros_tick __ros_tick)) _ros_tick)
  (:current_controller
   (&optional __current_controller)
   (if __current_controller (setq _current_controller __current_controller)) _current_controller)
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:action
   (&rest __action)
   (if (keywordp (car __action))
       (send* _action __action)
     (progn
       (if __action (setq _action (car __action)))
       _action)))
  (:serialization-length
   ()
   (+
    ;; bool _gh_present
    1
    ;; bool _agent_present
    1
    ;; int64 _ros_tick
    8
    ;; string _current_controller
    4 (length _current_controller)
    ;; my_msgs/state _state
    (send _state :serialization-length)
    ;; my_msgs/action _action
    (send _action :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _gh_present
       (if _gh_present (write-byte -1 s) (write-byte 0 s))
     ;; bool _agent_present
       (if _agent_present (write-byte -1 s) (write-byte 0 s))
     ;; int64 _ros_tick
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ros_tick (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ros_tick) (= (length (_ros_tick . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ros_tick . bv) 0) 0) s)
              (write-long (ash (elt (_ros_tick . bv) 1) -1) s))
             ((and (class _ros_tick) (= (length (_ros_tick . bv)) 1)) ;; big1
              (write-long (elt (_ros_tick . bv) 0) s)
              (write-long (if (>= _ros_tick 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ros_tick s)(write-long (if (>= _ros_tick 0) 0 #xffffffff) s)))
     ;; string _current_controller
       (write-long (length _current_controller) s) (princ _current_controller s)
     ;; my_msgs/state _state
       (send _state :serialize s)
     ;; my_msgs/action _action
       (send _action :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _gh_present
     (setq _gh_present (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _agent_present
     (setq _agent_present (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int64 _ros_tick
#+(or :alpha :irix6 :x86_64)
      (setf _ros_tick (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ros_tick (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _current_controller
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _current_controller (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; my_msgs/state _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;; my_msgs/action _action
     (send _action :deserialize buf ptr-) (incf ptr- (send _action :serialization-length))
   ;;
   self)
  )

(setf (get deepbuilder::rt_status :md5sum-) "72a571d7c6714cec7e8e029ca7689a9e")
(setf (get deepbuilder::rt_status :datatype-) "deepbuilder/rt_status")
(setf (get deepbuilder::rt_status :definition-)
      "#this should contain ALL information about the runtime
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
float32 A5
")



(provide :deepbuilder/rt_status "72a571d7c6714cec7e8e029ca7689a9e")


