;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_move_point)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_move_point (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_MOVE_POINT")
  (make-package "DEEPBUILDER::RO_MOVE_POINT"))
(unless (find-package "DEEPBUILDER::RO_MOVE_POINTREQUEST")
  (make-package "DEEPBUILDER::RO_MOVE_POINTREQUEST"))
(unless (find-package "DEEPBUILDER::RO_MOVE_POINTRESPONSE")
  (make-package "DEEPBUILDER::RO_MOVE_POINTRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_move_pointRequest
  :super ros::object
  :slots (_goal _speed ))

(defmethod deepbuilder::ro_move_pointRequest
  (:init
   (&key
    ((:goal __goal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _speed (float __speed))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32[] _goal
    (* 4    (length _goal)) 4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _goal
     (write-long (length _goal) s)
     (dotimes (i (length _goal))
       (sys::poke (elt _goal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _goal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_move_pointResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_move_pointResponse
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

(defclass deepbuilder::ro_move_point
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_move_point :md5sum-) "9b6f685fe107ffd37a5665d7b368a641")
(setf (get deepbuilder::ro_move_point :datatype-) "deepbuilder/ro_move_point")
(setf (get deepbuilder::ro_move_point :request) deepbuilder::ro_move_pointRequest)
(setf (get deepbuilder::ro_move_point :response) deepbuilder::ro_move_pointResponse)

(defmethod deepbuilder::ro_move_pointRequest
  (:response () (instance deepbuilder::ro_move_pointResponse :init)))

(setf (get deepbuilder::ro_move_pointRequest :md5sum-) "9b6f685fe107ffd37a5665d7b368a641")
(setf (get deepbuilder::ro_move_pointRequest :datatype-) "deepbuilder/ro_move_pointRequest")
(setf (get deepbuilder::ro_move_pointRequest :definition-)
      "float32[] goal
float32 speed
---
string message
")

(setf (get deepbuilder::ro_move_pointResponse :md5sum-) "9b6f685fe107ffd37a5665d7b368a641")
(setf (get deepbuilder::ro_move_pointResponse :datatype-) "deepbuilder/ro_move_pointResponse")
(setf (get deepbuilder::ro_move_pointResponse :definition-)
      "float32[] goal
float32 speed
---
string message
")



(provide :deepbuilder/ro_move_point "9b6f685fe107ffd37a5665d7b368a641")


