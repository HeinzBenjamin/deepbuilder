;; Auto-generated. Do not edit!


(when (boundp 'my_msgs::float_array)
  (if (not (find-package "MY_MSGS"))
    (make-package "MY_MSGS"))
  (shadow 'float_array (find-package "MY_MSGS")))
(unless (find-package "MY_MSGS::FLOAT_ARRAY")
  (make-package "MY_MSGS::FLOAT_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude float_array.msg.html


(defclass my_msgs::float_array
  :super ros::object
  :slots (_values ))

(defmethod my_msgs::float_array
  (:init
   (&key
    ((:values __values) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _values __values)
   self)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; float32[] _values
    (* 4    (length _values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _values
     (write-long (length _values) s)
     (dotimes (i (length _values))
       (sys::poke (elt _values i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _values i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get my_msgs::float_array :md5sum-) "e2c9c4a808bfa8ef83980bb0222137bf")
(setf (get my_msgs::float_array :datatype-) "my_msgs/float_array")
(setf (get my_msgs::float_array :definition-)
      "float32[] values
")



(provide :my_msgs/float_array "e2c9c4a808bfa8ef83980bb0222137bf")


