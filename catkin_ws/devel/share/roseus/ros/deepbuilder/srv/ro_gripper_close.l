;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_gripper_close)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_gripper_close (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_CLOSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_CLOSE"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_CLOSEREQUEST")
  (make-package "DEEPBUILDER::RO_GRIPPER_CLOSEREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_CLOSERESPONSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_CLOSERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_gripper_closeRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::ro_gripper_closeRequest
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

(defclass deepbuilder::ro_gripper_closeResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_gripper_closeResponse
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

(defclass deepbuilder::ro_gripper_close
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_gripper_close :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_close :datatype-) "deepbuilder/ro_gripper_close")
(setf (get deepbuilder::ro_gripper_close :request) deepbuilder::ro_gripper_closeRequest)
(setf (get deepbuilder::ro_gripper_close :response) deepbuilder::ro_gripper_closeResponse)

(defmethod deepbuilder::ro_gripper_closeRequest
  (:response () (instance deepbuilder::ro_gripper_closeResponse :init)))

(setf (get deepbuilder::ro_gripper_closeRequest :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_closeRequest :datatype-) "deepbuilder/ro_gripper_closeRequest")
(setf (get deepbuilder::ro_gripper_closeRequest :definition-)
      "---
string message
")

(setf (get deepbuilder::ro_gripper_closeResponse :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_closeResponse :datatype-) "deepbuilder/ro_gripper_closeResponse")
(setf (get deepbuilder::ro_gripper_closeResponse :definition-)
      "---
string message
")



(provide :deepbuilder/ro_gripper_close "5f003d6bcc824cbd51361d66d8e4f76c")


