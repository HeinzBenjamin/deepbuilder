;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::tc_read)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'tc_read (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::TC_READ")
  (make-package "DEEPBUILDER::TC_READ"))
(unless (find-package "DEEPBUILDER::TC_READREQUEST")
  (make-package "DEEPBUILDER::TC_READREQUEST"))
(unless (find-package "DEEPBUILDER::TC_READRESPONSE")
  (make-package "DEEPBUILDER::TC_READRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::tc_readRequest
  :super ros::object
  :slots (_var_names _types ))

(defmethod deepbuilder::tc_readRequest
  (:init
   (&key
    ((:var_names __var_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:types __types) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _var_names __var_names)
   (setq _types __types)
   self)
  (:var_names
   (&optional __var_names)
   (if __var_names (setq _var_names __var_names)) _var_names)
  (:types
   (&optional __types)
   (if __types (setq _types __types)) _types)
  (:serialization-length
   ()
   (+
    ;; string[] _var_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _var_names)) 4
    ;; string[] _types
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _types)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _var_names
     (write-long (length _var_names) s)
     (dolist (elem _var_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _types
     (write-long (length _types) s)
     (dolist (elem _types)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _var_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _var_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _var_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _types
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _types (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _types i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass deepbuilder::tc_readResponse
  :super ros::object
  :slots (_values _message ))

(defmethod deepbuilder::tc_readResponse
  (:init
   (&key
    ((:values __values) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:message __message) "")
    )
   (send-super :init)
   (setq _values __values)
   (setq _message (string __message))
   self)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string[] _values
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _values)) 4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _values
     (write-long (length _values) s)
     (dolist (elem _values)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _values i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::tc_read
  :super ros::object
  :slots ())

(setf (get deepbuilder::tc_read :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::tc_read :datatype-) "deepbuilder/tc_read")
(setf (get deepbuilder::tc_read :request) deepbuilder::tc_readRequest)
(setf (get deepbuilder::tc_read :response) deepbuilder::tc_readResponse)

(defmethod deepbuilder::tc_readRequest
  (:response () (instance deepbuilder::tc_readResponse :init)))

(setf (get deepbuilder::tc_readRequest :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::tc_readRequest :datatype-) "deepbuilder/tc_readRequest")
(setf (get deepbuilder::tc_readRequest :definition-)
      "string[] var_names
string[] types
---
string[] values
string message
")

(setf (get deepbuilder::tc_readResponse :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::tc_readResponse :datatype-) "deepbuilder/tc_readResponse")
(setf (get deepbuilder::tc_readResponse :definition-)
      "string[] var_names
string[] types
---
string[] values
string message
")



(provide :deepbuilder/tc_read "7848c669d219de11243ab460d9130d88")


