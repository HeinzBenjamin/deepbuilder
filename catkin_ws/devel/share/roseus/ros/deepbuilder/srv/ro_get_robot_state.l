;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_get_robot_state)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_get_robot_state (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GET_ROBOT_STATE")
  (make-package "DEEPBUILDER::RO_GET_ROBOT_STATE"))
(unless (find-package "DEEPBUILDER::RO_GET_ROBOT_STATEREQUEST")
  (make-package "DEEPBUILDER::RO_GET_ROBOT_STATEREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GET_ROBOT_STATERESPONSE")
  (make-package "DEEPBUILDER::RO_GET_ROBOT_STATERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_get_robot_stateRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::ro_get_robot_stateRequest
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

(defclass deepbuilder::ro_get_robot_stateResponse
  :super ros::object
  :slots (_joint_states ))

(defmethod deepbuilder::ro_get_robot_stateResponse
  (:init
   (&key
    ((:joint_states __joint_states) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_states __joint_states)
   self)
  (:joint_states
   (&optional __joint_states)
   (if __joint_states (setq _joint_states __joint_states)) _joint_states)
  (:serialization-length
   ()
   (+
    ;; float32[] _joint_states
    (* 4    (length _joint_states)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _joint_states
     (write-long (length _joint_states) s)
     (dotimes (i (length _joint_states))
       (sys::poke (elt _joint_states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _joint_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass deepbuilder::ro_get_robot_state
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_get_robot_state :md5sum-) "4fa113d228950451cb528101719c77a1")
(setf (get deepbuilder::ro_get_robot_state :datatype-) "deepbuilder/ro_get_robot_state")
(setf (get deepbuilder::ro_get_robot_state :request) deepbuilder::ro_get_robot_stateRequest)
(setf (get deepbuilder::ro_get_robot_state :response) deepbuilder::ro_get_robot_stateResponse)

(defmethod deepbuilder::ro_get_robot_stateRequest
  (:response () (instance deepbuilder::ro_get_robot_stateResponse :init)))

(setf (get deepbuilder::ro_get_robot_stateRequest :md5sum-) "4fa113d228950451cb528101719c77a1")
(setf (get deepbuilder::ro_get_robot_stateRequest :datatype-) "deepbuilder/ro_get_robot_stateRequest")
(setf (get deepbuilder::ro_get_robot_stateRequest :definition-)
      "---
float32[] joint_states
")

(setf (get deepbuilder::ro_get_robot_stateResponse :md5sum-) "4fa113d228950451cb528101719c77a1")
(setf (get deepbuilder::ro_get_robot_stateResponse :datatype-) "deepbuilder/ro_get_robot_stateResponse")
(setf (get deepbuilder::ro_get_robot_stateResponse :definition-)
      "---
float32[] joint_states
")



(provide :deepbuilder/ro_get_robot_state "4fa113d228950451cb528101719c77a1")


