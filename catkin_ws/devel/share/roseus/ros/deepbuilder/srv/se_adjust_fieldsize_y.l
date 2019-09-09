;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_adjust_fieldsize_y)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_adjust_fieldsize_y (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_Y")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_Y"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_YREQUEST")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_YREQUEST"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_YRESPONSE")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELDSIZE_YRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::se_adjust_fieldsize_yRequest
  :super ros::object
  :slots (_value ))

(defmethod deepbuilder::se_adjust_fieldsize_yRequest
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::se_adjust_fieldsize_yResponse
  :super ros::object
  :slots (_oldValue _newValue ))

(defmethod deepbuilder::se_adjust_fieldsize_yResponse
  (:init
   (&key
    ((:oldValue __oldValue) 0)
    ((:newValue __newValue) 0)
    )
   (send-super :init)
   (setq _oldValue (round __oldValue))
   (setq _newValue (round __newValue))
   self)
  (:oldValue
   (&optional __oldValue)
   (if __oldValue (setq _oldValue __oldValue)) _oldValue)
  (:newValue
   (&optional __newValue)
   (if __newValue (setq _newValue __newValue)) _newValue)
  (:serialization-length
   ()
   (+
    ;; int32 _oldValue
    4
    ;; int32 _newValue
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _oldValue
       (write-long _oldValue s)
     ;; int32 _newValue
       (write-long _newValue s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _oldValue
     (setq _oldValue (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _newValue
     (setq _newValue (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::se_adjust_fieldsize_y
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_adjust_fieldsize_y :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_fieldsize_y :datatype-) "deepbuilder/se_adjust_fieldsize_y")
(setf (get deepbuilder::se_adjust_fieldsize_y :request) deepbuilder::se_adjust_fieldsize_yRequest)
(setf (get deepbuilder::se_adjust_fieldsize_y :response) deepbuilder::se_adjust_fieldsize_yResponse)

(defmethod deepbuilder::se_adjust_fieldsize_yRequest
  (:response () (instance deepbuilder::se_adjust_fieldsize_yResponse :init)))

(setf (get deepbuilder::se_adjust_fieldsize_yRequest :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_fieldsize_yRequest :datatype-) "deepbuilder/se_adjust_fieldsize_yRequest")
(setf (get deepbuilder::se_adjust_fieldsize_yRequest :definition-)
      "int32 value
---
int32 oldValue
int32 newValue
")

(setf (get deepbuilder::se_adjust_fieldsize_yResponse :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_fieldsize_yResponse :datatype-) "deepbuilder/se_adjust_fieldsize_yResponse")
(setf (get deepbuilder::se_adjust_fieldsize_yResponse :definition-)
      "int32 value
---
int32 oldValue
int32 newValue
")



(provide :deepbuilder/se_adjust_fieldsize_y "c347af19957c4bfd6fa7272ca95ca3d6")


