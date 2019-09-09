;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_wait_for_ready)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_wait_for_ready (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_WAIT_FOR_READY")
  (make-package "DEEPBUILDER::RT_WAIT_FOR_READY"))
(unless (find-package "DEEPBUILDER::RT_WAIT_FOR_READYREQUEST")
  (make-package "DEEPBUILDER::RT_WAIT_FOR_READYREQUEST"))
(unless (find-package "DEEPBUILDER::RT_WAIT_FOR_READYRESPONSE")
  (make-package "DEEPBUILDER::RT_WAIT_FOR_READYRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::rt_wait_for_readyRequest
  :super ros::object
  :slots (_timeout_ms ))

(defmethod deepbuilder::rt_wait_for_readyRequest
  (:init
   (&key
    ((:timeout_ms __timeout_ms) 0)
    )
   (send-super :init)
   (setq _timeout_ms (round __timeout_ms))
   self)
  (:timeout_ms
   (&optional __timeout_ms)
   (if __timeout_ms (setq _timeout_ms __timeout_ms)) _timeout_ms)
  (:serialization-length
   ()
   (+
    ;; int64 _timeout_ms
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _timeout_ms
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timeout_ms (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timeout_ms) (= (length (_timeout_ms . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timeout_ms . bv) 0) 0) s)
              (write-long (ash (elt (_timeout_ms . bv) 1) -1) s))
             ((and (class _timeout_ms) (= (length (_timeout_ms . bv)) 1)) ;; big1
              (write-long (elt (_timeout_ms . bv) 0) s)
              (write-long (if (>= _timeout_ms 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timeout_ms s)(write-long (if (>= _timeout_ms 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _timeout_ms
#+(or :alpha :irix6 :x86_64)
      (setf _timeout_ms (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timeout_ms (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass deepbuilder::rt_wait_for_readyResponse
  :super ros::object
  :slots (_ready ))

(defmethod deepbuilder::rt_wait_for_readyResponse
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

(defclass deepbuilder::rt_wait_for_ready
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_wait_for_ready :md5sum-) "985b321a02883643c59c6d43bcb5063f")
(setf (get deepbuilder::rt_wait_for_ready :datatype-) "deepbuilder/rt_wait_for_ready")
(setf (get deepbuilder::rt_wait_for_ready :request) deepbuilder::rt_wait_for_readyRequest)
(setf (get deepbuilder::rt_wait_for_ready :response) deepbuilder::rt_wait_for_readyResponse)

(defmethod deepbuilder::rt_wait_for_readyRequest
  (:response () (instance deepbuilder::rt_wait_for_readyResponse :init)))

(setf (get deepbuilder::rt_wait_for_readyRequest :md5sum-) "985b321a02883643c59c6d43bcb5063f")
(setf (get deepbuilder::rt_wait_for_readyRequest :datatype-) "deepbuilder/rt_wait_for_readyRequest")
(setf (get deepbuilder::rt_wait_for_readyRequest :definition-)
      "int64 timeout_ms
---
bool ready
")

(setf (get deepbuilder::rt_wait_for_readyResponse :md5sum-) "985b321a02883643c59c6d43bcb5063f")
(setf (get deepbuilder::rt_wait_for_readyResponse :datatype-) "deepbuilder/rt_wait_for_readyResponse")
(setf (get deepbuilder::rt_wait_for_readyResponse :definition-)
      "int64 timeout_ms
---
bool ready
")



(provide :deepbuilder/rt_wait_for_ready "985b321a02883643c59c6d43bcb5063f")


