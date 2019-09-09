;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_gripper_setforce)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_gripper_setforce (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETFORCE")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETFORCE"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETFORCEREQUEST")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETFORCEREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_SETFORCERESPONSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_SETFORCERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_gripper_setforceRequest
  :super ros::object
  :slots (_force ))

(defmethod deepbuilder::ro_gripper_setforceRequest
  (:init
   (&key
    ((:force __force) 0)
    )
   (send-super :init)
   (setq _force (round __force))
   self)
  (:force
   (&optional __force)
   (if __force (setq _force __force)) _force)
  (:serialization-length
   ()
   (+
    ;; int32 _force
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _force
       (write-long _force s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _force
     (setq _force (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_gripper_setforceResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_gripper_setforceResponse
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

(defclass deepbuilder::ro_gripper_setforce
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_gripper_setforce :md5sum-) "ccfa9429760d636bcda3739aae3048ac")
(setf (get deepbuilder::ro_gripper_setforce :datatype-) "deepbuilder/ro_gripper_setforce")
(setf (get deepbuilder::ro_gripper_setforce :request) deepbuilder::ro_gripper_setforceRequest)
(setf (get deepbuilder::ro_gripper_setforce :response) deepbuilder::ro_gripper_setforceResponse)

(defmethod deepbuilder::ro_gripper_setforceRequest
  (:response () (instance deepbuilder::ro_gripper_setforceResponse :init)))

(setf (get deepbuilder::ro_gripper_setforceRequest :md5sum-) "ccfa9429760d636bcda3739aae3048ac")
(setf (get deepbuilder::ro_gripper_setforceRequest :datatype-) "deepbuilder/ro_gripper_setforceRequest")
(setf (get deepbuilder::ro_gripper_setforceRequest :definition-)
      "int32 force
---
string message
")

(setf (get deepbuilder::ro_gripper_setforceResponse :md5sum-) "ccfa9429760d636bcda3739aae3048ac")
(setf (get deepbuilder::ro_gripper_setforceResponse :datatype-) "deepbuilder/ro_gripper_setforceResponse")
(setf (get deepbuilder::ro_gripper_setforceResponse :definition-)
      "int32 force
---
string message
")



(provide :deepbuilder/ro_gripper_setforce "ccfa9429760d636bcda3739aae3048ac")


