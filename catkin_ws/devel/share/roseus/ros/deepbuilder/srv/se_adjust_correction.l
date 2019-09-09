;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::se_adjust_correction)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'se_adjust_correction (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::SE_ADJUST_CORRECTION")
  (make-package "DEEPBUILDER::SE_ADJUST_CORRECTION"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_CORRECTIONREQUEST")
  (make-package "DEEPBUILDER::SE_ADJUST_CORRECTIONREQUEST"))
(unless (find-package "DEEPBUILDER::SE_ADJUST_CORRECTIONRESPONSE")
  (make-package "DEEPBUILDER::SE_ADJUST_CORRECTIONRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::se_adjust_correctionRequest
  :super ros::object
  :slots (_value ))

(defmethod deepbuilder::se_adjust_correctionRequest
  (:init
   (&key
    ((:value __value) 0.0)
    )
   (send-super :init)
   (setq _value (float __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; float32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _value
       (sys::poke _value (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _value
     (setq _value (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::se_adjust_correctionResponse
  :super ros::object
  :slots (_oldValue _newValue ))

(defmethod deepbuilder::se_adjust_correctionResponse
  (:init
   (&key
    ((:oldValue __oldValue) 0.0)
    ((:newValue __newValue) 0.0)
    )
   (send-super :init)
   (setq _oldValue (float __oldValue))
   (setq _newValue (float __newValue))
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
    ;; float32 _oldValue
    4
    ;; float32 _newValue
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _oldValue
       (sys::poke _oldValue (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _newValue
       (sys::poke _newValue (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _oldValue
     (setq _oldValue (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _newValue
     (setq _newValue (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass deepbuilder::se_adjust_correction
  :super ros::object
  :slots ())

(setf (get deepbuilder::se_adjust_correction :md5sum-) "cd2ed50a53af7332f044c9ff74dcb9ee")
(setf (get deepbuilder::se_adjust_correction :datatype-) "deepbuilder/se_adjust_correction")
(setf (get deepbuilder::se_adjust_correction :request) deepbuilder::se_adjust_correctionRequest)
(setf (get deepbuilder::se_adjust_correction :response) deepbuilder::se_adjust_correctionResponse)

(defmethod deepbuilder::se_adjust_correctionRequest
  (:response () (instance deepbuilder::se_adjust_correctionResponse :init)))

(setf (get deepbuilder::se_adjust_correctionRequest :md5sum-) "cd2ed50a53af7332f044c9ff74dcb9ee")
(setf (get deepbuilder::se_adjust_correctionRequest :datatype-) "deepbuilder/se_adjust_correctionRequest")
(setf (get deepbuilder::se_adjust_correctionRequest :definition-)
      "float32 value
---
float32 oldValue
float32 newValue
")

(setf (get deepbuilder::se_adjust_correctionResponse :md5sum-) "cd2ed50a53af7332f044c9ff74dcb9ee")
(setf (get deepbuilder::se_adjust_correctionResponse :datatype-) "deepbuilder/se_adjust_correctionResponse")
(setf (get deepbuilder::se_adjust_correctionResponse :definition-)
      "float32 value
---
float32 oldValue
float32 newValue
")



(provide :deepbuilder/se_adjust_correction "cd2ed50a53af7332f044c9ff74dcb9ee")


