;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_move_home)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_move_home (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_MOVE_HOME")
  (make-package "DEEPBUILDER::RO_MOVE_HOME"))
(unless (find-package "DEEPBUILDER::RO_MOVE_HOMEREQUEST")
  (make-package "DEEPBUILDER::RO_MOVE_HOMEREQUEST"))
(unless (find-package "DEEPBUILDER::RO_MOVE_HOMERESPONSE")
  (make-package "DEEPBUILDER::RO_MOVE_HOMERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_move_homeRequest
  :super ros::object
  :slots (_speed _wait ))

(defmethod deepbuilder::ro_move_homeRequest
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _wait __wait)
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:wait
   (&optional __wait)
   (if __wait (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; bool _wait
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::ro_move_homeResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_move_homeResponse
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

(defclass deepbuilder::ro_move_home
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_move_home :md5sum-) "c30317d3d3699e0839f659b2d971bd95")
(setf (get deepbuilder::ro_move_home :datatype-) "deepbuilder/ro_move_home")
(setf (get deepbuilder::ro_move_home :request) deepbuilder::ro_move_homeRequest)
(setf (get deepbuilder::ro_move_home :response) deepbuilder::ro_move_homeResponse)

(defmethod deepbuilder::ro_move_homeRequest
  (:response () (instance deepbuilder::ro_move_homeResponse :init)))

(setf (get deepbuilder::ro_move_homeRequest :md5sum-) "c30317d3d3699e0839f659b2d971bd95")
(setf (get deepbuilder::ro_move_homeRequest :datatype-) "deepbuilder/ro_move_homeRequest")
(setf (get deepbuilder::ro_move_homeRequest :definition-)
      "float32 speed
bool wait
---
string message
")

(setf (get deepbuilder::ro_move_homeResponse :md5sum-) "c30317d3d3699e0839f659b2d971bd95")
(setf (get deepbuilder::ro_move_homeResponse :datatype-) "deepbuilder/ro_move_homeResponse")
(setf (get deepbuilder::ro_move_homeResponse :definition-)
      "float32 speed
bool wait
---
string message
")



(provide :deepbuilder/ro_move_home "c30317d3d3699e0839f659b2d971bd95")


