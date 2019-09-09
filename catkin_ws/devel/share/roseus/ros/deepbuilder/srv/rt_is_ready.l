;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_is_ready)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_is_ready (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_IS_READY")
  (make-package "DEEPBUILDER::RT_IS_READY"))
(unless (find-package "DEEPBUILDER::RT_IS_READYREQUEST")
  (make-package "DEEPBUILDER::RT_IS_READYREQUEST"))
(unless (find-package "DEEPBUILDER::RT_IS_READYRESPONSE")
  (make-package "DEEPBUILDER::RT_IS_READYRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::rt_is_readyRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::rt_is_readyRequest
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

(defclass deepbuilder::rt_is_readyResponse
  :super ros::object
  :slots (_ready ))

(defmethod deepbuilder::rt_is_readyResponse
  (:init
   (&key
    ((:ready __ready) nil)
    )
   (send-super :init)
   (setq _ready __ready)
   self)
  (:ready
   (&optional __ready)
   (if __ready (setq _ready __ready)) _ready)
  (:serialization-length
   ()
   (+
    ;; bool _ready
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _ready
       (if _ready (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _ready
     (setq _ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::rt_is_ready
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_is_ready :md5sum-) "6f378c6311f9e6ccd2cd8c5b327003f1")
(setf (get deepbuilder::rt_is_ready :datatype-) "deepbuilder/rt_is_ready")
(setf (get deepbuilder::rt_is_ready :request) deepbuilder::rt_is_readyRequest)
(setf (get deepbuilder::rt_is_ready :response) deepbuilder::rt_is_readyResponse)

(defmethod deepbuilder::rt_is_readyRequest
  (:response () (instance deepbuilder::rt_is_readyResponse :init)))

(setf (get deepbuilder::rt_is_readyRequest :md5sum-) "6f378c6311f9e6ccd2cd8c5b327003f1")
(setf (get deepbuilder::rt_is_readyRequest :datatype-) "deepbuilder/rt_is_readyRequest")
(setf (get deepbuilder::rt_is_readyRequest :definition-)
      "---
bool ready
")

(setf (get deepbuilder::rt_is_readyResponse :md5sum-) "6f378c6311f9e6ccd2cd8c5b327003f1")
(setf (get deepbuilder::rt_is_readyResponse :datatype-) "deepbuilder/rt_is_readyResponse")
(setf (get deepbuilder::rt_is_readyResponse :definition-)
      "---
bool ready
")



(provide :deepbuilder/rt_is_ready "6f378c6311f9e6ccd2cd8c5b327003f1")


