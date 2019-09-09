;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_gripper_setspeed)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_gripper_setspeed (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETSPEED")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETSPEED"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETSPEEDREQUEST")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETSPEEDREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETSPEEDRESPONSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETSPEEDRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_gripper_setspeedRequest
  :super ros::object
  :slots (_speed ))

(defmethod deepbuilder::ro_gripper_setspeedRequest
  (:init
   (&key
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _speed
       (write-long _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_gripper_setspeedResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_gripper_setspeedResponse
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

(defclass deepbuilder::ro_gripper_setspeed
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_gripper_setspeed :md5sum-) "53122cc92cfbc917935bb064451b2b06")
(setf (get deepbuilder::ro_gripper_setspeed :datatype-) "deepbuilder/ro_gripper_setspeed")
(setf (get deepbuilder::ro_gripper_setspeed :request) deepbuilder::ro_gripper_setspeedRequest)
(setf (get deepbuilder::ro_gripper_setspeed :response) deepbuilder::ro_gripper_setspeedResponse)

(defmethod deepbuilder::ro_gripper_setspeedRequest
  (:response () (instance deepbuilder::ro_gripper_setspeedResponse :init)))

(setf (get deepbuilder::ro_gripper_setspeedRequest :md5sum-) "53122cc92cfbc917935bb064451b2b06")
(setf (get deepbuilder::ro_gripper_setspeedRequest :datatype-) "deepbuilder/ro_gripper_setspeedRequest")
(setf (get deepbuilder::ro_gripper_setspeedRequest :definition-)
      "int32 speed
---
string message
")

(setf (get deepbuilder::ro_gripper_setspeedResponse :md5sum-) "53122cc92cfbc917935bb064451b2b06")
(setf (get deepbuilder::ro_gripper_setspeedResponse :datatype-) "deepbuilder/ro_gripper_setspeedResponse")
(setf (get deepbuilder::ro_gripper_setspeedResponse :definition-)
      "int32 speed
---
string message
")



(provide :deepbuilder/ro_gripper_setspeed "53122cc92cfbc917935bb064451b2b06")


