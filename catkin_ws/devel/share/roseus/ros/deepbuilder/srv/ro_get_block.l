;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_get_block)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_get_block (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GET_BLOCK")
  (make-package "DEEPBUILDER::RO_GET_BLOCK"))
(unless (find-package "DEEPBUILDER::RO_GET_BLOCKREQUEST")
  (make-package "DEEPBUILDER::RO_GET_BLOCKREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GET_BLOCKRESPONSE")
  (make-package "DEEPBUILDER::RO_GET_BLOCKRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_get_blockRequest
  :super ros::object
  :slots (_speed _tcp_mode ))

(defmethod deepbuilder::ro_get_blockRequest
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:tcp_mode __tcp_mode) nil)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _tcp_mode __tcp_mode)
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:tcp_mode
   (&optional __tcp_mode)
   (if __tcp_mode (setq _tcp_mode __tcp_mode)) _tcp_mode)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; bool _tcp_mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _tcp_mode
       (if _tcp_mode (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _tcp_mode
     (setq _tcp_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::ro_get_blockResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_get_blockResponse
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

(defclass deepbuilder::ro_get_block
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_get_block :md5sum-) "65f9af88059b07caeeaf7e2d659e542b")
(setf (get deepbuilder::ro_get_block :datatype-) "deepbuilder/ro_get_block")
(setf (get deepbuilder::ro_get_block :request) deepbuilder::ro_get_blockRequest)
(setf (get deepbuilder::ro_get_block :response) deepbuilder::ro_get_blockResponse)

(defmethod deepbuilder::ro_get_blockRequest
  (:response () (instance deepbuilder::ro_get_blockResponse :init)))

(setf (get deepbuilder::ro_get_blockRequest :md5sum-) "65f9af88059b07caeeaf7e2d659e542b")
(setf (get deepbuilder::ro_get_blockRequest :datatype-) "deepbuilder/ro_get_blockRequest")
(setf (get deepbuilder::ro_get_blockRequest :definition-)
      "float32 speed
bool tcp_mode

---
string message
")

(setf (get deepbuilder::ro_get_blockResponse :md5sum-) "65f9af88059b07caeeaf7e2d659e542b")
(setf (get deepbuilder::ro_get_blockResponse :datatype-) "deepbuilder/ro_get_blockResponse")
(setf (get deepbuilder::ro_get_blockResponse :definition-)
      "float32 speed
bool tcp_mode

---
string message
")



(provide :deepbuilder/ro_get_block "65f9af88059b07caeeaf7e2d659e542b")


