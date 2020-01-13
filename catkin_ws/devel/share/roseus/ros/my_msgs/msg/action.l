;; Auto-generated. Do not edit!


(when (boundp 'my_msgs::action)
  (if (not (find-package "MY_MSGS"))
    (make-package "MY_MSGS"))
  (shadow 'action (find-package "MY_MSGS")))
(unless (find-package "MY_MSGS::ACTION")
  (make-package "MY_MSGS::ACTION"))

(in-package "ROS")
;;//! \htmlinclude action.msg.html


(defclass my_msgs::action
  :super ros::object
  :slots (_id _A0 _A1 _A2 _A3 _A4 _A5 _A6 ))

(defmethod my_msgs::action
  (:init
   (&key
    ((:id __id) "")
    ((:A0 __A0) 0.0)
    ((:A1 __A1) 0.0)
    ((:A2 __A2) 0.0)
    ((:A3 __A3) 0.0)
    ((:A4 __A4) 0.0)
    ((:A5 __A5) 0.0)
    ((:A6 __A6) 0.0)
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _A0 (float __A0))
   (setq _A1 (float __A1))
   (setq _A2 (float __A2))
   (setq _A3 (float __A3))
   (setq _A4 (float __A4))
   (setq _A5 (float __A5))
   (setq _A6 (float __A6))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:A0
   (&optional __A0)
   (if __A0 (setq _A0 __A0)) _A0)
  (:A1
   (&optional __A1)
   (if __A1 (setq _A1 __A1)) _A1)
  (:A2
   (&optional __A2)
   (if __A2 (setq _A2 __A2)) _A2)
  (:A3
   (&optional __A3)
   (if __A3 (setq _A3 __A3)) _A3)
  (:A4
   (&optional __A4)
   (if __A4 (setq _A4 __A4)) _A4)
  (:A5
   (&optional __A5)
   (if __A5 (setq _A5 __A5)) _A5)
  (:A6
   (&optional __A6)
   (if __A6 (setq _A6 __A6)) _A6)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; float32 _A0
    4
    ;; float32 _A1
    4
    ;; float32 _A2
    4
    ;; float32 _A3
    4
    ;; float32 _A4
    4
    ;; float32 _A5
    4
    ;; float32 _A6
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; float32 _A0
       (sys::poke _A0 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A1
       (sys::poke _A1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A2
       (sys::poke _A2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A3
       (sys::poke _A3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A4
       (sys::poke _A4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A5
       (sys::poke _A5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _A6
       (sys::poke _A6 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _A0
     (setq _A0 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A1
     (setq _A1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A2
     (setq _A2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A3
     (setq _A3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A4
     (setq _A4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A5
     (setq _A5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _A6
     (setq _A6 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_msgs::action :md5sum-) "c40b50724540a881a54a2f96dfd06062")
(setf (get my_msgs::action :datatype-) "my_msgs/action")
(setf (get my_msgs::action :definition-)
      "string id
float32 A0
float32 A1
float32 A2
float32 A3
float32 A4
float32 A5
float32 A6
")



(provide :my_msgs/action "c40b50724540a881a54a2f96dfd06062")


