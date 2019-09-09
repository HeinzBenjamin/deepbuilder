;; Auto-generated. Do not edit!


(when (boundp 'my_msgs::state)
  (if (not (find-package "MY_MSGS"))
    (make-package "MY_MSGS"))
  (shadow 'state (find-package "MY_MSGS")))
(unless (find-package "MY_MSGS::STATE")
  (make-package "MY_MSGS::STATE"))

(in-package "ROS")
;;//! \htmlinclude state.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass my_msgs::state
  :super ros::object
  :slots (_action_id _out_of_reach _self_collision _last_tcp _fastest_box _highest_box _current_height _box_poses ))

(defmethod my_msgs::state
  (:init
   (&key
    ((:action_id __action_id) "")
    ((:out_of_reach __out_of_reach) nil)
    ((:self_collision __self_collision) nil)
    ((:last_tcp __last_tcp) (instance geometry_msgs::Pose :init))
    ((:fastest_box __fastest_box) 0)
    ((:highest_box __highest_box) 0)
    ((:current_height __current_height) 0.0)
    ((:box_poses __box_poses) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    )
   (send-super :init)
   (setq _action_id (string __action_id))
   (setq _out_of_reach __out_of_reach)
   (setq _self_collision __self_collision)
   (setq _last_tcp __last_tcp)
   (setq _fastest_box (round __fastest_box))
   (setq _highest_box (round __highest_box))
   (setq _current_height (float __current_height))
   (setq _box_poses __box_poses)
   self)
  (:action_id
   (&optional __action_id)
   (if __action_id (setq _action_id __action_id)) _action_id)
  (:out_of_reach
   (&optional __out_of_reach)
   (if __out_of_reach (setq _out_of_reach __out_of_reach)) _out_of_reach)
  (:self_collision
   (&optional __self_collision)
   (if __self_collision (setq _self_collision __self_collision)) _self_collision)
  (:last_tcp
   (&rest __last_tcp)
   (if (keywordp (car __last_tcp))
       (send* _last_tcp __last_tcp)
     (progn
       (if __last_tcp (setq _last_tcp (car __last_tcp)))
       _last_tcp)))
  (:fastest_box
   (&optional __fastest_box)
   (if __fastest_box (setq _fastest_box __fastest_box)) _fastest_box)
  (:highest_box
   (&optional __highest_box)
   (if __highest_box (setq _highest_box __highest_box)) _highest_box)
  (:current_height
   (&optional __current_height)
   (if __current_height (setq _current_height __current_height)) _current_height)
  (:box_poses
   (&rest __box_poses)
   (if (keywordp (car __box_poses))
       (send* _box_poses __box_poses)
     (progn
       (if __box_poses (setq _box_poses (car __box_poses)))
       _box_poses)))
  (:serialization-length
   ()
   (+
    ;; string _action_id
    4 (length _action_id)
    ;; bool _out_of_reach
    1
    ;; bool _self_collision
    1
    ;; geometry_msgs/Pose _last_tcp
    (send _last_tcp :serialization-length)
    ;; int32 _fastest_box
    4
    ;; int32 _highest_box
    4
    ;; float32 _current_height
    4
    ;; geometry_msgs/Pose[] _box_poses
    (apply #'+ (send-all _box_poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action_id
       (write-long (length _action_id) s) (princ _action_id s)
     ;; bool _out_of_reach
       (if _out_of_reach (write-byte -1 s) (write-byte 0 s))
     ;; bool _self_collision
       (if _self_collision (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Pose _last_tcp
       (send _last_tcp :serialize s)
     ;; int32 _fastest_box
       (write-long _fastest_box s)
     ;; int32 _highest_box
       (write-long _highest_box s)
     ;; float32 _current_height
       (sys::poke _current_height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Pose[] _box_poses
     (write-long (length _box_poses) s)
     (dolist (elem _box_poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _out_of_reach
     (setq _out_of_reach (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _self_collision
     (setq _self_collision (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Pose _last_tcp
     (send _last_tcp :deserialize buf ptr-) (incf ptr- (send _last_tcp :serialization-length))
   ;; int32 _fastest_box
     (setq _fastest_box (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _highest_box
     (setq _highest_box (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _current_height
     (setq _current_height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Pose[] _box_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _box_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get my_msgs::state :md5sum-) "72cea1bd08eaaeaa5fb310c31bb88005")
(setf (get my_msgs::state :datatype-) "my_msgs/state")
(setf (get my_msgs::state :definition-)
      "string action_id
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

")



(provide :my_msgs/state "72cea1bd08eaaeaa5fb310c31bb88005")


