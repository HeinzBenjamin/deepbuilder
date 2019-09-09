;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_gripper_moveto)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_gripper_moveto (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_MOVETO")
  (make-package "DEEPBUILDER::RO_GRIPPER_MOVETO"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_MOVETOREQUEST")
  (make-package "DEEPBUILDER::RO_GRIPPER_MOVETOREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_MOVETORESPONSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_MOVETORESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_gripper_movetoRequest
  :super ros::object
  :slots (_goal ))

(defmethod deepbuilder::ro_gripper_movetoRequest
  (:init
   (&key
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _goal (round __goal))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; int32 _goal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _goal
       (write-long _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_gripper_movetoResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_gripper_movetoResponse
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

(defclass deepbuilder::ro_gripper_moveto
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_gripper_moveto :md5sum-) "9a72e9df09a389879daf01f6fbd13491")
(setf (get deepbuilder::ro_gripper_moveto :datatype-) "deepbuilder/ro_gripper_moveto")
(setf (get deepbuilder::ro_gripper_moveto :request) deepbuilder::ro_gripper_movetoRequest)
(setf (get deepbuilder::ro_gripper_moveto :response) deepbuilder::ro_gripper_movetoResponse)

(defmethod deepbuilder::ro_gripper_movetoRequest
  (:response () (instance deepbuilder::ro_gripper_movetoResponse :init)))

(setf (get deepbuilder::ro_gripper_movetoRequest :md5sum-) "9a72e9df09a389879daf01f6fbd13491")
(setf (get deepbuilder::ro_gripper_movetoRequest :datatype-) "deepbuilder/ro_gripper_movetoRequest")
(setf (get deepbuilder::ro_gripper_movetoRequest :definition-)
      "int32 goal
---
string message
")

(setf (get deepbuilder::ro_gripper_movetoResponse :md5sum-) "9a72e9df09a389879daf01f6fbd13491")
(setf (get deepbuilder::ro_gripper_movetoResponse :datatype-) "deepbuilder/ro_gripper_movetoResponse")
(setf (get deepbuilder::ro_gripper_movetoResponse :definition-)
      "int32 goal
---
string message
")



(provide :deepbuilder/ro_gripper_moveto "9a72e9df09a389879daf01f6fbd13491")


