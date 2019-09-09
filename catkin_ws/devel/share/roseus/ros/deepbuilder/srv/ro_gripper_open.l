;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_gripper_open)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_gripper_open (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_OPEN")
  (make-package "DEEPBUILDER::RO_GRIPPER_OPEN"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_OPENREQUEST")
  (make-package "DEEPBUILDER::RO_GRIPPER_OPENREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GRIPPER_OPENRESPONSE")
  (make-package "DEEPBUILDER::RO_GRIPPER_OPENRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_gripper_openRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::ro_gripper_openRequest
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

(defclass deepbuilder::ro_gripper_openResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_gripper_openResponse
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

(defclass deepbuilder::ro_gripper_open
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_gripper_open :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_open :datatype-) "deepbuilder/ro_gripper_open")
(setf (get deepbuilder::ro_gripper_open :request) deepbuilder::ro_gripper_openRequest)
(setf (get deepbuilder::ro_gripper_open :response) deepbuilder::ro_gripper_openResponse)

(defmethod deepbuilder::ro_gripper_openRequest
  (:response () (instance deepbuilder::ro_gripper_openResponse :init)))

(setf (get deepbuilder::ro_gripper_openRequest :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_openRequest :datatype-) "deepbuilder/ro_gripper_openRequest")
(setf (get deepbuilder::ro_gripper_openRequest :definition-)
      "---
string message
")

(setf (get deepbuilder::ro_gripper_openResponse :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ro_gripper_openResponse :datatype-) "deepbuilder/ro_gripper_openResponse")
(setf (get deepbuilder::ro_gripper_openResponse :definition-)
      "---
string message
")



(provide :deepbuilder/ro_gripper_open "5f003d6bcc824cbd51361d66d8e4f76c")


