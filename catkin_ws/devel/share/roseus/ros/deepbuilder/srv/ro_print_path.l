;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_print_path)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_print_path (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_PRINT_PATH")
  (make-package "DEEPBUILDER::RO_PRINT_PATH"))
(unless (find-package "DEEPBUILDER::RO_PRINT_PATHREQUEST")
  (make-package "DEEPBUILDER::RO_PRINT_PATHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_PRINT_PATHRESPONSE")
  (make-package "DEEPBUILDER::RO_PRINT_PATHRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_print_pathRequest
  :super ros::object
  :slots (_action _first_way_point_joint_states _last_way_point_joint_states _way_points_cartesian _num_way_points ))

(defmethod deepbuilder::ro_print_pathRequest
  (:init
   (&key
    ((:action __action) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:first_way_point_joint_states __first_way_point_joint_states) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:last_way_point_joint_states __last_way_point_joint_states) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:way_points_cartesian __way_points_cartesian) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num_way_points __num_way_points) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _action __action)
   (setq _first_way_point_joint_states __first_way_point_joint_states)
   (setq _last_way_point_joint_states __last_way_point_joint_states)
   (setq _way_points_cartesian __way_points_cartesian)
   (setq _num_way_points __num_way_points)
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:first_way_point_joint_states
   (&optional __first_way_point_joint_states)
   (if __first_way_point_joint_states (setq _first_way_point_joint_states __first_way_point_joint_states)) _first_way_point_joint_states)
  (:last_way_point_joint_states
   (&optional __last_way_point_joint_states)
   (if __last_way_point_joint_states (setq _last_way_point_joint_states __last_way_point_joint_states)) _last_way_point_joint_states)
  (:way_points_cartesian
   (&optional __way_points_cartesian)
   (if __way_points_cartesian (setq _way_points_cartesian __way_points_cartesian)) _way_points_cartesian)
  (:num_way_points
   (&optional __num_way_points)
   (if __num_way_points (setq _num_way_points __num_way_points)) _num_way_points)
  (:serialization-length
   ()
   (+
    ;; float32[] _action
    (* 4    (length _action)) 4
    ;; float32[] _first_way_point_joint_states
    (* 4    (length _first_way_point_joint_states)) 4
    ;; float32[] _last_way_point_joint_states
    (* 4    (length _last_way_point_joint_states)) 4
    ;; float32[] _way_points_cartesian
    (* 4    (length _way_points_cartesian)) 4
    ;; int32[] _num_way_points
    (* 4    (length _num_way_points)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _action
     (write-long (length _action) s)
     (dotimes (i (length _action))
       (sys::poke (elt _action i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _first_way_point_joint_states
     (write-long (length _first_way_point_joint_states) s)
     (dotimes (i (length _first_way_point_joint_states))
       (sys::poke (elt _first_way_point_joint_states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _last_way_point_joint_states
     (write-long (length _last_way_point_joint_states) s)
     (dotimes (i (length _last_way_point_joint_states))
       (sys::poke (elt _last_way_point_joint_states i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _way_points_cartesian
     (write-long (length _way_points_cartesian) s)
     (dotimes (i (length _way_points_cartesian))
       (sys::poke (elt _way_points_cartesian i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _num_way_points
     (write-long (length _num_way_points) s)
     (dotimes (i (length _num_way_points))
       (write-long (elt _num_way_points i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _action
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _action (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _action i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _first_way_point_joint_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _first_way_point_joint_states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _first_way_point_joint_states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _last_way_point_joint_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _last_way_point_joint_states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _last_way_point_joint_states i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _way_points_cartesian
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _way_points_cartesian (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _way_points_cartesian i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _num_way_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _num_way_points (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _num_way_points i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass deepbuilder::ro_print_pathResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_print_pathResponse
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

(defclass deepbuilder::ro_print_path
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_print_path :md5sum-) "ed58a50dbb7811f85489d43aa932223a")
(setf (get deepbuilder::ro_print_path :datatype-) "deepbuilder/ro_print_path")
(setf (get deepbuilder::ro_print_path :request) deepbuilder::ro_print_pathRequest)
(setf (get deepbuilder::ro_print_path :response) deepbuilder::ro_print_pathResponse)

(defmethod deepbuilder::ro_print_pathRequest
  (:response () (instance deepbuilder::ro_print_pathResponse :init)))

(setf (get deepbuilder::ro_print_pathRequest :md5sum-) "ed58a50dbb7811f85489d43aa932223a")
(setf (get deepbuilder::ro_print_pathRequest :datatype-) "deepbuilder/ro_print_pathRequest")
(setf (get deepbuilder::ro_print_pathRequest :definition-)
      "float32[] action
float32[] first_way_point_joint_states
float32[] last_way_point_joint_states
float32[] way_points_cartesian
int32[] num_way_points
---
string message
")

(setf (get deepbuilder::ro_print_pathResponse :md5sum-) "ed58a50dbb7811f85489d43aa932223a")
(setf (get deepbuilder::ro_print_pathResponse :datatype-) "deepbuilder/ro_print_pathResponse")
(setf (get deepbuilder::ro_print_pathResponse :definition-)
      "float32[] action
float32[] first_way_point_joint_states
float32[] last_way_point_joint_states
float32[] way_points_cartesian
int32[] num_way_points
---
string message
")



(provide :deepbuilder/ro_print_path "ed58a50dbb7811f85489d43aa932223a")


