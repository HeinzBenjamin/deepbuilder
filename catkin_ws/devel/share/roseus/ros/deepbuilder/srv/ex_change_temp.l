;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ex_change_temp)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ex_change_temp (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::EX_CHANGE_TEMP")
  (make-package "DEEPBUILDER::EX_CHANGE_TEMP"))
(unless (find-package "DEEPBUILDER::EX_CHANGE_TEMPREQUEST")
  (make-package "DEEPBUILDER::EX_CHANGE_TEMPREQUEST"))
(unless (find-package "DEEPBUILDER::EX_CHANGE_TEMPRESPONSE")
  (make-package "DEEPBUILDER::EX_CHANGE_TEMPRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ex_change_tempRequest
  :super ros::object
  :slots (_value _wait ))

(defmethod deepbuilder::ex_change_tempRequest
  (:init
   (&key
    ((:value __value) 0.0)
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _value (float __value))
   (setq _wait __wait)
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:wait
   (&optional __wait)
   (if __wait (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; float32 _value
    4
    ;; bool _wait
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::ex_change_tempResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ex_change_tempResponse
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

(defclass deepbuilder::ex_change_temp
  :super ros::object
  :slots ())

(setf (get deepbuilder::ex_change_temp :md5sum-) "ccd6eb84971df341c36707104795ebb6")
(setf (get deepbuilder::ex_change_temp :datatype-) "deepbuilder/ex_change_temp")
(setf (get deepbuilder::ex_change_temp :request) deepbuilder::ex_change_tempRequest)
(setf (get deepbuilder::ex_change_temp :response) deepbuilder::ex_change_tempResponse)

(defmethod deepbuilder::ex_change_tempRequest
  (:response () (instance deepbuilder::ex_change_tempResponse :init)))

(setf (get deepbuilder::ex_change_tempRequest :md5sum-) "ccd6eb84971df341c36707104795ebb6")
(setf (get deepbuilder::ex_change_tempRequest :datatype-) "deepbuilder/ex_change_tempRequest")
(setf (get deepbuilder::ex_change_tempRequest :definition-)
      "float32 value
bool wait
---
string message
")

(setf (get deepbuilder::ex_change_tempResponse :md5sum-) "ccd6eb84971df341c36707104795ebb6")
(setf (get deepbuilder::ex_change_tempResponse :datatype-) "deepbuilder/ex_change_tempResponse")
(setf (get deepbuilder::ex_change_tempResponse :definition-)
      "float32 value
bool wait
---
string message
")



(provide :deepbuilder/ex_change_temp "ccd6eb84971df341c36707104795ebb6")


