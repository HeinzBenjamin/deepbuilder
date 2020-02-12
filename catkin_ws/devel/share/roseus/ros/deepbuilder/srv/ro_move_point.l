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
  :slots (_goal_pose _speed _wait ))

(defmethod deepbuilder::ro_move_pointRequest
  (:init
   (&key
    ((:goal_pose __goal_pose) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _goal_pose __goal_pose)
   (setq _speed (float __speed))
   (setq _wait __wait)
   self)
  (:goal_pose
   (&optional __goal_pose)
   (if __goal_pose (setq _goal_pose __goal_pose)) _goal_pose)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:wait
   (&optional __wait)
   (if __wait (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; float32[] _goal_pose
    (* 4    (length _goal_pose)) 4
    ;; float32 _speed
    4
    ;; bool _wait
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _goal_pose
     (write-long (length _goal_pose) s)
     (dotimes (i (length _goal_pose))
       (sys::poke (elt _goal_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _goal_pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal_pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _goal_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(setf (get deepbuilder::ro_move_point :md5sum-) "63f6e48d493920111c122f8ee202a5d9")
(setf (get deepbuilder::ro_move_point :datatype-) "deepbuilder/ro_move_point")
(setf (get deepbuilder::ro_move_point :request) deepbuilder::ro_move_pointRequest)
(setf (get deepbuilder::ro_move_point :response) deepbuilder::ro_move_pointResponse)

(defmethod deepbuilder::ro_move_pointRequest
  (:response () (instance deepbuilder::ro_move_pointResponse :init)))

(setf (get deepbuilder::ro_move_pointRequest :md5sum-) "63f6e48d493920111c122f8ee202a5d9")
(setf (get deepbuilder::ro_move_pointRequest :datatype-) "deepbuilder/ro_move_pointRequest")
(setf (get deepbuilder::ro_move_pointRequest :definition-)
      "float32[] goal_pose
float32 speed
bool wait
---
string message
")

(setf (get deepbuilder::ro_move_pointResponse :md5sum-) "63f6e48d493920111c122f8ee202a5d9")
(setf (get deepbuilder::ro_move_pointResponse :datatype-) "deepbuilder/ro_move_pointResponse")
(setf (get deepbuilder::ro_move_pointResponse :definition-)
      "float32[] goal_pose
float32 speed
bool wait
---
string message
")



(provide :deepbuilder/ro_move_point "63f6e48d493920111c122f8ee202a5d9")


