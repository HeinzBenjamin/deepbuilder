;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_collect_tags)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_collect_tags (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_COLLECT_TAGS")
  (make-package "DEEPBUILDER::SE_COLLECT_TAGS"))
(unless (find-package "DEEPBUILDER::SE_COLLECT_TAGSREQUEST")
  (make-package "DEEPBUILDER::SE_COLLECT_TAGSREQUEST"))
(unless (find-package "DEEPBUILDER::SE_COLLECT_TAGSRESPONSE")
  (make-package "DEEPBUILDER::SE_COLLECT_TAGSRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::se_collect_tagsRequest
  :super ros::object
  :slots (_poses _pairs _pair_lengths ))

(defmethod deepbuilder::se_collect_tagsRequest
  (:init
   (&key
    ((:poses __poses) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pairs __pairs) (make-array 0 :initial-element 0 :element-type :integer))
    ((:pair_lengths __pair_lengths) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _poses __poses)
   (setq _pairs __pairs)
   (setq _pair_lengths __pair_lengths)
   self)
  (:poses
   (&optional __poses)
   (if __poses (setq _poses __poses)) _poses)
  (:pairs
   (&optional __pairs)
   (if __pairs (setq _pairs __pairs)) _pairs)
  (:pair_lengths
   (&optional __pair_lengths)
   (if __pair_lengths (setq _pair_lengths __pair_lengths)) _pair_lengths)
  (:serialization-length
   ()
   (+
    ;; float32[] _poses
    (* 4    (length _poses)) 4
    ;; int32[] _pairs
    (* 4    (length _pairs)) 4
    ;; int32[] _pair_lengths
    (* 4    (length _pair_lengths)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _poses
     (write-long (length _poses) s)
     (dotimes (i (length _poses))
       (sys::poke (elt _poses i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _pairs
     (write-long (length _pairs) s)
     (dotimes (i (length _pairs))
       (write-long (elt _pairs i) s)
       )
     ;; int32[] _pair_lengths
     (write-long (length _pair_lengths) s)
     (dotimes (i (length _pair_lengths))
       (write-long (elt _pair_lengths i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _poses i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _pairs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pairs (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pairs i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _pair_lengths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pair_lengths (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _pair_lengths i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass deepbuilder::se_collect_tagsResponse
  :super ros::object
  :slots (_tag_poses _types _ids ))

(defmethod deepbuilder::se_collect_tagsResponse
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

(defclass deepbuilder::se_collect_tags
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_collect_tags :md5sum-) "83f15a0a65a3dcd57be2f47c0135c2de")
(setf (get deepbuilder::se_collect_tags :datatype-) "deepbuilder/se_collect_tags")
(setf (get deepbuilder::se_collect_tags :request) deepbuilder::se_collect_tagsRequest)
(setf (get deepbuilder::se_collect_tags :response) deepbuilder::se_collect_tagsResponse)

(defmethod deepbuilder::se_collect_tagsRequest
  (:response () (instance deepbuilder::se_collect_tagsResponse :init)))

(setf (get deepbuilder::se_collect_tagsRequest :md5sum-) "83f15a0a65a3dcd57be2f47c0135c2de")
(setf (get deepbuilder::se_collect_tagsRequest :datatype-) "deepbuilder/se_collect_tagsRequest")
(setf (get deepbuilder::se_collect_tagsRequest :definition-)
      "float32[] poses
int32[] pairs
int32[] pair_lengths
---
float32[] tag_poses
int8[] types
int8[] ids
")

(setf (get deepbuilder::se_collect_tagsResponse :md5sum-) "83f15a0a65a3dcd57be2f47c0135c2de")
(setf (get deepbuilder::se_collect_tagsResponse :datatype-) "deepbuilder/se_collect_tagsResponse")
(setf (get deepbuilder::se_collect_tagsResponse :definition-)
      "float32[] poses
int32[] pairs
int32[] pair_lengths
---
float32[] tag_poses
int8[] types
int8[] ids
")



(provide :deepbuilder/se_collect_tags "83f15a0a65a3dcd57be2f47c0135c2de")


