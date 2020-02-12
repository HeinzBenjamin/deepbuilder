;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ex_change_motor_speed)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ex_change_motor_speed (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEED")
  (make-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEED"))
(unless (find-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEEDREQUEST")
  (make-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEEDREQUEST"))
(unless (find-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEEDRESPONSE")
  (make-package "DEEPBUILDER::EX_CHANGE_MOTOR_SPEEDRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ex_change_motor_speedRequest
  :super ros::object
  :slots (_value ))

(defmethod deepbuilder::ex_change_motor_speedRequest
  (:init
   (&key
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _value (float __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ex_change_motor_speedResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ex_change_motor_speedResponse
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

(defclass deepbuilder::ex_change_motor_speed
  :super ros::object
  :slots ())

(setf (get deepbuilder::ex_change_motor_speed :md5sum-) "ac15ce1feb45ac549d2e2b722ff0d645")
(setf (get deepbuilder::ex_change_motor_speed :datatype-) "deepbuilder/ex_change_motor_speed")
(setf (get deepbuilder::ex_change_motor_speed :request) deepbuilder::ex_change_motor_speedRequest)
(setf (get deepbuilder::ex_change_motor_speed :response) deepbuilder::ex_change_motor_speedResponse)

(defmethod deepbuilder::ex_change_motor_speedRequest
  (:response () (instance deepbuilder::ex_change_motor_speedResponse :init)))

(setf (get deepbuilder::ex_change_motor_speedRequest :md5sum-) "ac15ce1feb45ac549d2e2b722ff0d645")
(setf (get deepbuilder::ex_change_motor_speedRequest :datatype-) "deepbuilder/ex_change_motor_speedRequest")
(setf (get deepbuilder::ex_change_motor_speedRequest :definition-)
      "float32 value
---
string message
")

(setf (get deepbuilder::ex_change_motor_speedResponse :md5sum-) "ac15ce1feb45ac549d2e2b722ff0d645")
(setf (get deepbuilder::ex_change_motor_speedResponse :datatype-) "deepbuilder/ex_change_motor_speedResponse")
(setf (get deepbuilder::ex_change_motor_speedResponse :definition-)
      "float32 value
---
string message
")



(provide :deepbuilder/ex_change_motor_speed "ac15ce1feb45ac549d2e2b722ff0d645")


