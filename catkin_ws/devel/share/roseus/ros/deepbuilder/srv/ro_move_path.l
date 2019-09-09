;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ro_move_path)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ro_move_path (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATH")
  (make-package "DEEPBUILDER::RO_MOVE_PATH"))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATHREQUEST")
  (make-package "DEEPBUILDER::RO_MOVE_PATHREQUEST"))
(unless (find-package "DEEPBUILDER::RO_MOVE_PATHRESPONSE")
  (make-package "DEEPBUILDER::RO_MOVE_PATHRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ro_move_pathRequest
  :super ros::object
  :slots (_path _speed ))

(defmethod deepbuilder::ro_move_pathRequest
  (:init
   (&key
    ((:path __path) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _path __path)
   (setq _speed (float __speed))
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32[] _path
    (* 4    (length _path)) 4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
       (sys::poke (elt _path i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _path i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::ro_move_pathResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ro_move_pathResponse
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

(defclass deepbuilder::ro_move_path
  :super ros::object
  :slots ())

(setf (get deepbuilder::ro_move_path :md5sum-) "b4a3d2594e319909ad839e09a056ad1d")
(setf (get deepbuilder::ro_move_path :datatype-) "deepbuilder/ro_move_path")
(setf (get deepbuilder::ro_move_path :request) deepbuilder::ro_move_pathRequest)
(setf (get deepbuilder::ro_move_path :response) deepbuilder::ro_move_pathResponse)

(defmethod deepbuilder::ro_move_pathRequest
  (:response () (instance deepbuilder::ro_move_pathResponse :init)))

(setf (get deepbuilder::ro_move_pathRequest :md5sum-) "b4a3d2594e319909ad839e09a056ad1d")
(setf (get deepbuilder::ro_move_pathRequest :datatype-) "deepbuilder/ro_move_pathRequest")
(setf (get deepbuilder::ro_move_pathRequest :definition-)
      "float32[] path
float32 speed
---
string message
")

(setf (get deepbuilder::ro_move_pathResponse :md5sum-) "b4a3d2594e319909ad839e09a056ad1d")
(setf (get deepbuilder::ro_move_pathResponse :datatype-) "deepbuilder/ro_move_pathResponse")
(setf (get deepbuilder::ro_move_pathResponse :definition-)
      "float32[] path
float32 speed
---
string message
")



(provide :deepbuilder/ro_move_path "b4a3d2594e319909ad839e09a056ad1d")


