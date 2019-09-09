;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_get_values)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_get_values (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_GET_VALUES")
  (make-package "DEEPBUILDER::SE_GET_VALUES"))
(unless (find-package "DEEPBUILDER::SE_GET_VALUESREQUEST")
  (make-package "DEEPBUILDER::SE_GET_VALUESREQUEST"))
(unless (find-package "DEEPBUILDER::SE_GET_VALUESRESPONSE")
  (make-package "DEEPBUILDER::SE_GET_VALUESRESPONSE"))

(in-package "ROS")



(if (not (find-package "MY_MSGS"))
  (ros::roseus-add-msgs "my_msgs"))


(defclass deepbuilder::se_get_valuesRequest
  :super ros::object
  :slots ())

(defmethod deepbuilder::se_get_valuesRequest
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

(defclass deepbuilder::se_get_valuesResponse
  :super ros::object
  :slots (_values ))

(defmethod deepbuilder::se_get_valuesResponse
  (:init
   (&key
    ((:values __values) (instance my_msgs::float_array :init))
    )
   (send-super :init)
   (setq _values __values)
   self)
  (:values
   (&rest __values)
   (if (keywordp (car __values))
       (send* _values __values)
     (progn
       (if __values (setq _values (car __values)))
       _values)))
  (:serialization-length
   ()
   (+
    ;; my_msgs/float_array _values
    (send _values :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; my_msgs/float_array _values
       (send _values :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; my_msgs/float_array _values
     (send _values :deserialize buf ptr-) (incf ptr- (send _values :serialization-length))
   ;;
   self)
  )

(defclass deepbuilder::se_get_values
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_get_values :md5sum-) "afc255e103ebf1fda6e279c644d870f5")
(setf (get deepbuilder::se_get_values :datatype-) "deepbuilder/se_get_values")
(setf (get deepbuilder::se_get_values :request) deepbuilder::se_get_valuesRequest)
(setf (get deepbuilder::se_get_values :response) deepbuilder::se_get_valuesResponse)

(defmethod deepbuilder::se_get_valuesRequest
  (:response () (instance deepbuilder::se_get_valuesResponse :init)))

(setf (get deepbuilder::se_get_valuesRequest :md5sum-) "afc255e103ebf1fda6e279c644d870f5")
(setf (get deepbuilder::se_get_valuesRequest :datatype-) "deepbuilder/se_get_valuesRequest")
(setf (get deepbuilder::se_get_valuesRequest :definition-)
      "---
my_msgs/float_array values

================================================================================
MSG: my_msgs/float_array
")

(setf (get deepbuilder::se_get_valuesResponse :md5sum-) "afc255e103ebf1fda6e279c644d870f5")
(setf (get deepbuilder::se_get_valuesResponse :datatype-) "deepbuilder/se_get_valuesResponse")
(setf (get deepbuilder::se_get_valuesResponse :definition-)
      "---
my_msgs/float_array values

================================================================================
MSG: my_msgs/float_array
")



(provide :deepbuilder/se_get_values "afc255e103ebf1fda6e279c644d870f5")


