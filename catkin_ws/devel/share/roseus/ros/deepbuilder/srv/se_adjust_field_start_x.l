;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_adjust_field_start_x)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_adjust_field_start_x (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELD_START_X")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELD_START_X"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELD_START_XREQUEST")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELD_START_XREQUEST"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_FIELD_START_XRESPONSE")
  (make-package "DEEPBUILDER::SE_ADJUST_FIELD_START_XRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::se_adjust_field_start_xRequest
  :super ros::object
  :slots (_value ))

(defmethod deepbuilder::se_adjust_field_start_xRequest
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

(defclass deepbuilder::se_adjust_field_start_xResponse
  :super ros::object
  :slots (_oldValue _newValue ))

(defmethod deepbuilder::se_adjust_field_start_xResponse
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

(defclass deepbuilder::se_adjust_field_start_x
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_adjust_field_start_x :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_field_start_x :datatype-) "deepbuilder/se_adjust_field_start_x")
(setf (get deepbuilder::se_adjust_field_start_x :request) deepbuilder::se_adjust_field_start_xRequest)
(setf (get deepbuilder::se_adjust_field_start_x :response) deepbuilder::se_adjust_field_start_xResponse)

(defmethod deepbuilder::se_adjust_field_start_xRequest
  (:response () (instance deepbuilder::se_adjust_field_start_xResponse :init)))

(setf (get deepbuilder::se_adjust_field_start_xRequest :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_field_start_xRequest :datatype-) "deepbuilder/se_adjust_field_start_xRequest")
(setf (get deepbuilder::se_adjust_field_start_xRequest :definition-)
      "int32 value
---
int32 oldValue
int32 newValue
")

(setf (get deepbuilder::se_adjust_field_start_xResponse :md5sum-) "c347af19957c4bfd6fa7272ca95ca3d6")
(setf (get deepbuilder::se_adjust_field_start_xResponse :datatype-) "deepbuilder/se_adjust_field_start_xResponse")
(setf (get deepbuilder::se_adjust_field_start_xResponse :definition-)
      "int32 value
---
int32 oldValue
int32 newValue
")



(provide :deepbuilder/se_adjust_field_start_x "c347af19957c4bfd6fa7272ca95ca3d6")


