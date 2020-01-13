;; Auto-generated. Do not edit!


(when (boundp 'my_msgs::state)
  (if (not (find-package "MY_MSGS"))
    (make-package "MY_MSGS"))
  (shadow 'state (find-package "MY_MSGS")))
(unless (find-package "MY_MSGS::STATE")
  (make-package "MY_MSGS::STATE"))

(in-package "ROS")
;;//! \htmlinclude state.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass my_msgs::state
  :super ros::object
  :slots (_action_id _is_printable _action_tcp _displaced_tcps _state_compressed _compression_loss _state_mesh_vertices _state_mesh_indices _current_height _current_tcp_displacements _current_smoothness _current_area ))

(defmethod my_msgs::state
  (:init
   (&key
    ((:action_id __action_id) "")
    ((:is_printable __is_printable) nil)
    ((:action_tcp __action_tcp) (instance geometry_msgs::Pose :init))
    ((:displaced_tcps __displaced_tcps) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    ((:state_compressed __state_compressed) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:compression_loss __compression_loss) 0.0)
    ((:state_mesh_vertices __state_mesh_vertices) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:state_mesh_indices __state_mesh_indices) (make-array 0 :initial-element 0 :element-type :integer))
    ((:current_height __current_height) 0.0)
    ((:current_tcp_displacements __current_tcp_displacements) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:current_smoothness __current_smoothness) 0.0)
    ((:current_area __current_area) 0.0)
    )
   (send-super :init)
   (setq _action_id (string __action_id))
   (setq _is_printable __is_printable)
   (setq _action_tcp __action_tcp)
   (setq _displaced_tcps __displaced_tcps)
   (setq _state_compressed __state_compressed)
   (setq _compression_loss (float __compression_loss))
   (setq _state_mesh_vertices __state_mesh_vertices)
   (setq _state_mesh_indices __state_mesh_indices)
   (setq _current_height (float __current_height))
   (setq _current_tcp_displacements __current_tcp_displacements)
   (setq _current_smoothness (float __current_smoothness))
   (setq _current_area (float __current_area))
   self)
  (:action_id
   (&optional __action_id)
   (if __action_id (setq _action_id __action_id)) _action_id)
  (:is_printable
   (&optional __is_printable)
   (if __is_printable (setq _is_printable __is_printable)) _is_printable)
  (:action_tcp
   (&rest __action_tcp)
   (if (keywordp (car __action_tcp))
       (send* _action_tcp __action_tcp)
     (progn
       (if __action_tcp (setq _action_tcp (car __action_tcp)))
       _action_tcp)))
  (:displaced_tcps
   (&rest __displaced_tcps)
   (if (keywordp (car __displaced_tcps))
       (send* _displaced_tcps __displaced_tcps)
     (progn
       (if __displaced_tcps (setq _displaced_tcps (car __displaced_tcps)))
       _displaced_tcps)))
  (:state_compressed
   (&optional __state_compressed)
   (if __state_compressed (setq _state_compressed __state_compressed)) _state_compressed)
  (:compression_loss
   (&optional __compression_loss)
   (if __compression_loss (setq _compression_loss __compression_loss)) _compression_loss)
  (:state_mesh_vertices
   (&optional __state_mesh_vertices)
   (if __state_mesh_vertices (setq _state_mesh_vertices __state_mesh_vertices)) _state_mesh_vertices)
  (:state_mesh_indices
   (&optional __state_mesh_indices)
   (if __state_mesh_indices (setq _state_mesh_indices __state_mesh_indices)) _state_mesh_indices)
  (:current_height
   (&optional __current_height)
   (if __current_height (setq _current_height __current_height)) _current_height)
  (:current_tcp_displacements
   (&optional __current_tcp_displacements)
   (if __current_tcp_displacements (setq _current_tcp_displacements __current_tcp_displacements)) _current_tcp_displacements)
  (:current_smoothness
   (&optional __current_smoothness)
   (if __current_smoothness (setq _current_smoothness __current_smoothness)) _current_smoothness)
  (:current_area
   (&optional __current_area)
   (if __current_area (setq _current_area __current_area)) _current_area)
  (:serialization-length
   ()
   (+
    ;; string _action_id
    4 (length _action_id)
    ;; bool _is_printable
    1
    ;; geometry_msgs/Pose _action_tcp
    (send _action_tcp :serialization-length)
    ;; geometry_msgs/Pose[] _displaced_tcps
    (apply #'+ (send-all _displaced_tcps :serialization-length)) 4
    ;; float32[] _state_compressed
    (* 4    (length _state_compressed)) 4
    ;; float32 _compression_loss
    4
    ;; float32[] _state_mesh_vertices
    (* 4    (length _state_mesh_vertices)) 4
    ;; int32[] _state_mesh_indices
    (* 4    (length _state_mesh_indices)) 4
    ;; float32 _current_height
    4
    ;; float32[] _current_tcp_displacements
    (* 4    (length _current_tcp_displacements)) 4
    ;; float32 _current_smoothness
    4
    ;; float32 _current_area
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action_id
       (write-long (length _action_id) s) (princ _action_id s)
     ;; bool _is_printable
       (if _is_printable (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Pose _action_tcp
       (send _action_tcp :serialize s)
     ;; geometry_msgs/Pose[] _displaced_tcps
     (write-long (length _displaced_tcps) s)
     (dolist (elem _displaced_tcps)
       (send elem :serialize s)
       )
     ;; float32[] _state_compressed
     (write-long (length _state_compressed) s)
     (dotimes (i (length _state_compressed))
       (sys::poke (elt _state_compressed i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _compression_loss
       (sys::poke _compression_loss (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _state_mesh_vertices
     (write-long (length _state_mesh_vertices) s)
     (dotimes (i (length _state_mesh_vertices))
       (sys::poke (elt _state_mesh_vertices i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _state_mesh_indices
     (write-long (length _state_mesh_indices) s)
     (dotimes (i (length _state_mesh_indices))
       (write-long (elt _state_mesh_indices i) s)
       )
     ;; float32 _current_height
       (sys::poke _current_height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _current_tcp_displacements
     (write-long (length _current_tcp_displacements) s)
     (dotimes (i (length _current_tcp_displacements))
       (sys::poke (elt _current_tcp_displacements i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _current_smoothness
       (sys::poke _current_smoothness (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _current_area
       (sys::poke _current_area (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _is_printable
     (setq _is_printable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Pose _action_tcp
     (send _action_tcp :deserialize buf ptr-) (incf ptr- (send _action_tcp :serialization-length))
   ;; geometry_msgs/Pose[] _displaced_tcps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _displaced_tcps (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _displaced_tcps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32[] _state_compressed
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state_compressed (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _state_compressed i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _compression_loss
     (setq _compression_loss (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _state_mesh_vertices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state_mesh_vertices (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _state_mesh_vertices i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _state_mesh_indices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _state_mesh_indices (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _state_mesh_indices i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32 _current_height
     (setq _current_height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _current_tcp_displacements
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _current_tcp_displacements (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _current_tcp_displacements i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _current_smoothness
     (setq _current_smoothness (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _current_area
     (setq _current_area (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_msgs::state :md5sum-) "b716ae9e4e97f8d790d147cc9fc70235")
(setf (get my_msgs::state :datatype-) "my_msgs/state")
(setf (get my_msgs::state :definition-)
      "string action_id
bool is_printable
geometry_msgs/Pose action_tcp
geometry_msgs/Pose[] displaced_tcps
float32[] state_compressed
float32 compression_loss
float32[] state_mesh_vertices
int32[] state_mesh_indices
float32 current_height
float32[] current_tcp_displacements
float32 current_smoothness
float32 current_area
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



(provide :my_msgs/state "b716ae9e4e97f8d790d147cc9fc70235")


