;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_get_state)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_get_state (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_GET_STATE")
  (make-package "DEEPBUILDER::RO_GET_STATE"))
(unless (find-package "DEEPBUILDER::RO_GET_STATEREQUEST")
  (make-package "DEEPBUILDER::RO_GET_STATEREQUEST"))
(unless (find-package "DEEPBUILDER::RO_GET_STATERESPONSE")
  (make-package "DEEPBUILDER::RO_GET_STATERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass deepbuilder::ro_get_stateRequest
  :super ros::object
  :slots (_speed _tcp_mode ))

(defmethod deepbuilder::ro_get_stateRequest
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

(defclass deepbuilder::ro_get_stateResponse
  :super ros::object
  :slots (_boxes ))

(defmethod deepbuilder::ro_get_stateResponse
  (:init
   (&key
    ((:boxes __boxes) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    )
   (send-super :init)
   (setq _boxes __boxes)
   self)
  (:boxes
   (&rest __boxes)
   (if (keywordp (car __boxes))
       (send* _boxes __boxes)
     (progn
       (if __boxes (setq _boxes (car __boxes)))
       _boxes)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose[] _boxes
    (apply #'+ (send-all _boxes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose[] _boxes
     (write-long (length _boxes) s)
     (dolist (elem _boxes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose[] _boxes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _boxes (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _boxes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass deepbuilder::ro_get_state
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_get_state :md5sum-) "d02bed547f95931d877d3048b2328dcb")
(setf (get deepbuilder::ro_get_state :datatype-) "deepbuilder/ro_get_state")
(setf (get deepbuilder::ro_get_state :request) deepbuilder::ro_get_stateRequest)
(setf (get deepbuilder::ro_get_state :response) deepbuilder::ro_get_stateResponse)

(defmethod deepbuilder::ro_get_stateRequest
  (:response () (instance deepbuilder::ro_get_stateResponse :init)))

(setf (get deepbuilder::ro_get_stateRequest :md5sum-) "d02bed547f95931d877d3048b2328dcb")
(setf (get deepbuilder::ro_get_stateRequest :datatype-) "deepbuilder/ro_get_stateRequest")
(setf (get deepbuilder::ro_get_stateRequest :definition-)
      "float32 speed
bool tcp_mode

---
geometry_msgs/Pose[] boxes

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get deepbuilder::ro_get_stateResponse :md5sum-) "d02bed547f95931d877d3048b2328dcb")
(setf (get deepbuilder::ro_get_stateResponse :datatype-) "deepbuilder/ro_get_stateResponse")
(setf (get deepbuilder::ro_get_stateResponse :definition-)
      "float32 speed
bool tcp_mode

---
geometry_msgs/Pose[] boxes

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :deepbuilder/ro_get_state "d02bed547f95931d877d3048b2328dcb")


