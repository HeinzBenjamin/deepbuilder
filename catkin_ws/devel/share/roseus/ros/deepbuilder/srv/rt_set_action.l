;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_set_action)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_set_action (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_SET_ACTION")
  (make-package "DEEPBUILDER::RT_SET_ACTION"))
(unless (find-package "DEEPBUILDER::RT_SET_ACTIONREQUEST")
  (make-package "DEEPBUILDER::RT_SET_ACTIONREQUEST"))
(unless (find-package "DEEPBUILDER::RT_SET_ACTIONRESPONSE")
  (make-package "DEEPBUILDER::RT_SET_ACTIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "MY_MSGS"))
  (ros::roseus-add-msgs "my_msgs"))




(defclass deepbuilder::rt_set_actionRequest
  :super ros::object
  :slots (_controller _action ))

(defmethod deepbuilder::rt_set_actionRequest
  (:init
   (&key
    ((:controller __controller) "")
    ((:action __action) (instance my_msgs::action :init))
    )
   (send-super :init)
   (setq _controller (string __controller))
   (setq _action __action)
   self)
  (:controller
   (&optional __controller)
   (if __controller (setq _controller __controller)) _controller)
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
    ;; string _controller
    4 (length _controller)
    ;; my_msgs/action _action
    (send _action :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _controller
       (write-long (length _controller) s) (princ _controller s)
     ;; my_msgs/action _action
       (send _action :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _controller
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _controller (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; my_msgs/action _action
     (send _action :deserialize buf ptr-) (incf ptr- (send _action :serialization-length))
   ;;
   self)
  )

(defclass deepbuilder::rt_set_actionResponse
  :super ros::object
  :slots ())

(defmethod deepbuilder::rt_set_actionResponse
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

(defclass deepbuilder::rt_set_action
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_set_action :md5sum-) "5d06ec287625f49b9001c48a2d24b856")
(setf (get deepbuilder::rt_set_action :datatype-) "deepbuilder/rt_set_action")
(setf (get deepbuilder::rt_set_action :request) deepbuilder::rt_set_actionRequest)
(setf (get deepbuilder::rt_set_action :response) deepbuilder::rt_set_actionResponse)

(defmethod deepbuilder::rt_set_actionRequest
  (:response () (instance deepbuilder::rt_set_actionResponse :init)))

(setf (get deepbuilder::rt_set_actionRequest :md5sum-) "5d06ec287625f49b9001c48a2d24b856")
(setf (get deepbuilder::rt_set_actionRequest :datatype-) "deepbuilder/rt_set_actionRequest")
(setf (get deepbuilder::rt_set_actionRequest :definition-)
      "string controller
my_msgs/action action

================================================================================
MSG: my_msgs/action
string id
float32 A0
float32 A1
float32 A2
float32 A3
float32 A4
---
")

(setf (get deepbuilder::rt_set_actionResponse :md5sum-) "5d06ec287625f49b9001c48a2d24b856")
(setf (get deepbuilder::rt_set_actionResponse :datatype-) "deepbuilder/rt_set_actionResponse")
(setf (get deepbuilder::rt_set_actionResponse :definition-)
      "string controller
my_msgs/action action

================================================================================
MSG: my_msgs/action
string id
float32 A0
float32 A1
float32 A2
float32 A3
float32 A4
---
")



(provide :deepbuilder/rt_set_action "5d06ec287625f49b9001c48a2d24b856")


