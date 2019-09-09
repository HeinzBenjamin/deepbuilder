;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::rt_set_agent_presence)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'rt_set_agent_presence (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RT_SET_AGENT_PRESENCE")
  (make-package "DEEPBUILDER::RT_SET_AGENT_PRESENCE"))
(unless (find-package "DEEPBUILDER::RT_SET_AGENT_PRESENCEREQUEST")
  (make-package "DEEPBUILDER::RT_SET_AGENT_PRESENCEREQUEST"))
(unless (find-package "DEEPBUILDER::RT_SET_AGENT_PRESENCERESPONSE")
  (make-package "DEEPBUILDER::RT_SET_AGENT_PRESENCERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::rt_set_agent_presenceRequest
  :super ros::object
  :slots (_agent_present ))

(defmethod deepbuilder::rt_set_agent_presenceRequest
  (:init
   (&key
    ((:agent_present __agent_present) nil)
    )
   (send-super :init)
   (setq _agent_present __agent_present)
   self)
  (:agent_present
   (&optional __agent_present)
   (if __agent_present (setq _agent_present __agent_present)) _agent_present)
  (:serialization-length
   ()
   (+
    ;; bool _agent_present
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _agent_present
       (if _agent_present (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _agent_present
     (setq _agent_present (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass deepbuilder::rt_set_agent_presenceResponse
  :super ros::object
  :slots ())

(defmethod deepbuilder::rt_set_agent_presenceResponse
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

(defclass deepbuilder::rt_set_agent_presence
  :super ros::object
  :slots ())

(setf (get deepbuilder::rt_set_agent_presence :md5sum-) "8d81a8d38b2cf9545ac2bc74275099bf")
(setf (get deepbuilder::rt_set_agent_presence :datatype-) "deepbuilder/rt_set_agent_presence")
(setf (get deepbuilder::rt_set_agent_presence :request) deepbuilder::rt_set_agent_presenceRequest)
(setf (get deepbuilder::rt_set_agent_presence :response) deepbuilder::rt_set_agent_presenceResponse)

(defmethod deepbuilder::rt_set_agent_presenceRequest
  (:response () (instance deepbuilder::rt_set_agent_presenceResponse :init)))

(setf (get deepbuilder::rt_set_agent_presenceRequest :md5sum-) "8d81a8d38b2cf9545ac2bc74275099bf")
(setf (get deepbuilder::rt_set_agent_presenceRequest :datatype-) "deepbuilder/rt_set_agent_presenceRequest")
(setf (get deepbuilder::rt_set_agent_presenceRequest :definition-)
      "bool agent_present
---
")

(setf (get deepbuilder::rt_set_agent_presenceResponse :md5sum-) "8d81a8d38b2cf9545ac2bc74275099bf")
(setf (get deepbuilder::rt_set_agent_presenceResponse :datatype-) "deepbuilder/rt_set_agent_presenceResponse")
(setf (get deepbuilder::rt_set_agent_presenceResponse :definition-)
      "bool agent_present
---
")



(provide :deepbuilder/rt_set_agent_presence "8d81a8d38b2cf9545ac2bc74275099bf")


