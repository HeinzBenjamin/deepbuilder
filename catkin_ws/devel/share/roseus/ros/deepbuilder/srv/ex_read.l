;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ex_read)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ex_read (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::EX_READ")
  (make-package "DEEPBUILDER::EX_READ"))
(unless (find-package "DEEPBUILDER::EX_READREQUEST")
  (make-package "DEEPBUILDER::EX_READREQUEST"))
(unless (find-package "DEEPBUILDER::EX_READRESPONSE")
  (make-package "DEEPBUILDER::EX_READRESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ex_readRequest
  :super ros::object
  :slots (_var_names _types ))

(defmethod deepbuilder::ex_readRequest
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

(defclass deepbuilder::ex_readResponse
  :super ros::object
  :slots (_values _message ))

(defmethod deepbuilder::ex_readResponse
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

(defclass deepbuilder::ex_read
  :super ros::object
  :slots ())

(setf (get deepbuilder::ex_read :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::ex_read :datatype-) "deepbuilder/ex_read")
(setf (get deepbuilder::ex_read :request) deepbuilder::ex_readRequest)
(setf (get deepbuilder::ex_read :response) deepbuilder::ex_readResponse)

(defmethod deepbuilder::ex_readRequest
  (:response () (instance deepbuilder::ex_readResponse :init)))

(setf (get deepbuilder::ex_readRequest :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::ex_readRequest :datatype-) "deepbuilder/ex_readRequest")
(setf (get deepbuilder::ex_readRequest :definition-)
      "string[] var_names
string[] types
---
string[] values
string message
")

(setf (get deepbuilder::ex_readResponse :md5sum-) "7848c669d219de11243ab460d9130d88")
(setf (get deepbuilder::ex_readResponse :datatype-) "deepbuilder/ex_readResponse")
(setf (get deepbuilder::ex_readResponse :definition-)
      "string[] var_names
string[] types
---
string[] values
string message
")



(provide :deepbuilder/ex_read "7848c669d219de11243ab460d9130d88")


