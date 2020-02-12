;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_get_tags)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_get_tags (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_GET_TAGS")
  (make-package "DEEPBUILDER::SE_GET_TAGS"))
(unless (find-package "DEEPBUILDER::SE_GET_TAGSREQUEST")
  (make-package "DEEPBUILDER::SE_GET_TAGSREQUEST"))
(unless (find-package "DEEPBUILDER::SE_GET_TAGSRESPONSE")
  (make-package "DEEPBUILDER::SE_GET_TAGSRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::se_get_tagsRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::se_get_tagsRequest
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

(defclass deepbuilder::se_get_tagsResponse
  :super ros::object
  :slots (_tag_poses _types _ids ))

(defmethod deepbuilder::se_get_tagsResponse
  (:init
   (&key
    ((:tag_poses __tag_poses) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:types __types) (make-array 0 :initial-element 0 :element-type :integer))
    ((:ids __ids) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _tag_poses __tag_poses)
   (setq _types __types)
   (setq _ids __ids)
   self)
  (:tag_poses
   (&optional __tag_poses)
   (if __tag_poses (setq _tag_poses __tag_poses)) _tag_poses)
  (:types
   (&optional __types)
   (if __types (setq _types __types)) _types)
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:serialization-length
   ()
   (+
    ;; float32[] _tag_poses
    (* 4    (length _tag_poses)) 4
    ;; int8[] _types
    (* 1    (length _types)) 4
    ;; int8[] _ids
    (* 1    (length _ids)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _tag_poses
     (write-long (length _tag_poses) s)
     (dotimes (i (length _tag_poses))
       (sys::poke (elt _tag_poses i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int8[] _types
     (write-long (length _types) s)
     (dotimes (i (length _types))
       (write-byte (elt _types i) s)
       )
     ;; int8[] _ids
     (write-long (length _ids) s)
     (dotimes (i (length _ids))
       (write-byte (elt _ids i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _tag_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tag_poses (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tag_poses i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int8[] _types
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _types (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _types i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _types i) 127) (setf (elt _types i) (- (elt _types i) 256)))
     ))
   ;; int8[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _ids i) (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> (elt _ids i) 127) (setf (elt _ids i) (- (elt _ids i) 256)))
     ))
   ;;
   self)
  )

(defclass deepbuilder::se_get_tags
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_get_tags :md5sum-) "ed7bb1e8d94ce303317cf11ef2ce623d")
(setf (get deepbuilder::se_get_tags :datatype-) "deepbuilder/se_get_tags")
(setf (get deepbuilder::se_get_tags :request) deepbuilder::se_get_tagsRequest)
(setf (get deepbuilder::se_get_tags :response) deepbuilder::se_get_tagsResponse)

(defmethod deepbuilder::se_get_tagsRequest
  (:response () (instance deepbuilder::se_get_tagsResponse :init)))

(setf (get deepbuilder::se_get_tagsRequest :md5sum-) "ed7bb1e8d94ce303317cf11ef2ce623d")
(setf (get deepbuilder::se_get_tagsRequest :datatype-) "deepbuilder/se_get_tagsRequest")
(setf (get deepbuilder::se_get_tagsRequest :definition-)
      "---
float32[] tag_poses
int8[] types
int8[] ids
")

(setf (get deepbuilder::se_get_tagsResponse :md5sum-) "ed7bb1e8d94ce303317cf11ef2ce623d")
(setf (get deepbuilder::se_get_tagsResponse :datatype-) "deepbuilder/se_get_tagsResponse")
(setf (get deepbuilder::se_get_tagsResponse :definition-)
      "---
float32[] tag_poses
int8[] types
int8[] ids
")



(provide :deepbuilder/se_get_tags "ed7bb1e8d94ce303317cf11ef2ce623d")


