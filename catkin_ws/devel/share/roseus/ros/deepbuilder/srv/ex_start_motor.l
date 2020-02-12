;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ex_start_motor)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ex_start_motor (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::EX_START_MOTOR")
  (make-package "DEEPBUILDER::EX_START_MOTOR"))
(unless (find-package "DEEPBUILDER::EX_START_MOTORREQUEST")
  (make-package "DEEPBUILDER::EX_START_MOTORREQUEST"))
(unless (find-package "DEEPBUILDER::EX_START_MOTORRESPONSE")
  (make-package "DEEPBUILDER::EX_START_MOTORRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ex_start_motorRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::ex_start_motorRequest
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

(defclass deepbuilder::ex_start_motorResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ex_start_motorResponse
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

(defclass deepbuilder::ex_start_motor
  :super ros::object
  :slots ())

(setf (get deepbuilder::ex_start_motor :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ex_start_motor :datatype-) "deepbuilder/ex_start_motor")
(setf (get deepbuilder::ex_start_motor :request) deepbuilder::ex_start_motorRequest)
(setf (get deepbuilder::ex_start_motor :response) deepbuilder::ex_start_motorResponse)

(defmethod deepbuilder::ex_start_motorRequest
  (:response () (instance deepbuilder::ex_start_motorResponse :init)))

(setf (get deepbuilder::ex_start_motorRequest :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ex_start_motorRequest :datatype-) "deepbuilder/ex_start_motorRequest")
(setf (get deepbuilder::ex_start_motorRequest :definition-)
      "---
string message
")

(setf (get deepbuilder::ex_start_motorResponse :md5sum-) "5f003d6bcc824cbd51361d66d8e4f76c")
(setf (get deepbuilder::ex_start_motorResponse :datatype-) "deepbuilder/ex_start_motorResponse")
(setf (get deepbuilder::ex_start_motorResponse :definition-)
      "---
string message
")



(provide :deepbuilder/ex_start_motor "5f003d6bcc824cbd51361d66d8e4f76c")


