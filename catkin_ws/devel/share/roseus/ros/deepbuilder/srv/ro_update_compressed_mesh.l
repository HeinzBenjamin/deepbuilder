;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_update_compressed_mesh)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_update_compressed_mesh (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESH")
  (make-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESH"))
(unless (find-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESHREQUEST")
  (make-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESHRESPONSE")
  (make-package "DEEPBUILDER::RO_UPDATE_COMPRESSED_MESHRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_update_compressed_meshRequest
  :super ros::object
  :slots (_vertices _indices _session ))

(defmethod deepbuilder::ro_update_compressed_meshRequest
  (:init
   (&key
    ((:vertices __vertices) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:indices __indices) (make-array 0 :initial-element 0 :element-type :integer))
    ((:session __session) "")
    )
   (send-super :init)
   (setq _vertices __vertices)
   (setq _indices __indices)
   (setq _session (string __session))
   self)
  (:vertices
   (&optional __vertices)
   (if __vertices (setq _vertices __vertices)) _vertices)
  (:indices
   (&optional __indices)
   (if __indices (setq _indices __indices)) _indices)
  (:session
   (&optional __session)
   (if __session (setq _session __session)) _session)
  (:serialization-length
   ()
   (+
    ;; float32[] _vertices
    (* 4    (length _vertices)) 4
    ;; int32[] _indices
    (* 4    (length _indices)) 4
    ;; string _session
    4 (length _session)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _vertices
     (write-long (length _vertices) s)
     (dotimes (i (length _vertices))
       (sys::poke (elt _vertices i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _indices
     (write-long (length _indices) s)
     (dotimes (i (length _indices))
       (write-long (elt _indices i) s)
       )
     ;; string _session
       (write-long (length _session) s) (princ _session s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _vertices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _vertices (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _vertices i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _indices
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _indices (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _indices i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; string _session
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _session (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ro_update_compressed_meshResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_update_compressed_meshResponse
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

(defclass deepbuilder::ro_update_compressed_mesh
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_update_compressed_mesh :md5sum-) "230cfe3cf22bf1c93dac2ac217ea4d24")
(setf (get deepbuilder::ro_update_compressed_mesh :datatype-) "deepbuilder/ro_update_compressed_mesh")
(setf (get deepbuilder::ro_update_compressed_mesh :request) deepbuilder::ro_update_compressed_meshRequest)
(setf (get deepbuilder::ro_update_compressed_mesh :response) deepbuilder::ro_update_compressed_meshResponse)

(defmethod deepbuilder::ro_update_compressed_meshRequest
  (:response () (instance deepbuilder::ro_update_compressed_meshResponse :init)))

(setf (get deepbuilder::ro_update_compressed_meshRequest :md5sum-) "230cfe3cf22bf1c93dac2ac217ea4d24")
(setf (get deepbuilder::ro_update_compressed_meshRequest :datatype-) "deepbuilder/ro_update_compressed_meshRequest")
(setf (get deepbuilder::ro_update_compressed_meshRequest :definition-)
      "float32[] vertices
int32[] indices
string session
---
string message
")

(setf (get deepbuilder::ro_update_compressed_meshResponse :md5sum-) "230cfe3cf22bf1c93dac2ac217ea4d24")
(setf (get deepbuilder::ro_update_compressed_meshResponse :datatype-) "deepbuilder/ro_update_compressed_meshResponse")
(setf (get deepbuilder::ro_update_compressed_meshResponse :definition-)
      "float32[] vertices
int32[] indices
string session
---
string message
")



(provide :deepbuilder/ro_update_compressed_mesh "230cfe3cf22bf1c93dac2ac217ea4d24")


