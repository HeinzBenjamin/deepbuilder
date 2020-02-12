;; Auto-generated. Do not edit!


(when (boundp 'deepbuilder::ex_write)
  (if (not (find-package "DEEPBUILDER"))
    (make-package "DEEPBUILDER"))
  (shadow 'ex_write (find-package "DEEPBUILDER")))
(unless (find-package "DEEPBUILDER::EX_WRITE")
  (make-package "DEEPBUILDER::EX_WRITE"))
(unless (find-package "DEEPBUILDER::EX_WRITEREQUEST")
  (make-package "DEEPBUILDER::EX_WRITEREQUEST"))
(unless (find-package "DEEPBUILDER::EX_WRITERESPONSE")
  (make-package "DEEPBUILDER::EX_WRITERESPONSE"))

(in-package "ROS")





(defclass deepbuilder::ex_writeRequest
  :super ros::object
  :slots (_var_names _types _values ))

(defmethod deepbuilder::ex_writeRequest
  (:init
   (&key
    ((:var_names __var_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:types __types) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:values __values) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _var_names __var_names)
   (setq _types __types)
   (setq _values __values)
   self)
  (:var_names
   (&optional __var_names)
   (if __var_names (setq _var_names __var_names)) _var_names)
  (:types
   (&optional __types)
   (if __types (setq _types __types)) _types)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; string[] _var_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _var_names)) 4
    ;; string[] _types
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _types)) 4
    ;; string[] _values
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _values)) 4
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
     ;; string[] _values
     (write-long (length _values) s)
     (dolist (elem _values)
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
   ;; string[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _values i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass deepbuilder::ex_writeResponse
  :super ros::object
  :slots (_message ))

(defmethod deepbuilder::ex_writeResponse
  (:init
   (&key
    ((:message __message) "")
    )
   (send-super :init)
   (setq _message (string __message))
   self)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass deepbuilder::ex_write
  :super ros::object
  :slots ())

(setf (get deepbuilder::ex_write :md5sum-) "93beb009a54ccf54fefb5b85020d0e0d")
(setf (get deepbuilder::ex_write :datatype-) "deepbuilder/ex_write")
(setf (get deepbuilder::ex_write :request) deepbuilder::ex_writeRequest)
(setf (get deepbuilder::ex_write :response) deepbuilder::ex_writeResponse)

(defmethod deepbuilder::ex_writeRequest
  (:response () (instance deepbuilder::ex_writeResponse :init)))

(setf (get deepbuilder::ex_writeRequest :md5sum-) "93beb009a54ccf54fefb5b85020d0e0d")
(setf (get deepbuilder::ex_writeRequest :datatype-) "deepbuilder/ex_writeRequest")
(setf (get deepbuilder::ex_writeRequest :definition-)
      "string[] var_names
string[] types
string[] values
---
string message
")

(setf (get deepbuilder::ex_writeResponse :md5sum-) "93beb009a54ccf54fefb5b85020d0e0d")
(setf (get deepbuilder::ex_writeResponse :datatype-) "deepbuilder/ex_writeResponse")
(setf (get deepbuilder::ex_writeResponse :definition-)
      "string[] var_names
string[] types
string[] values
---
string message
")



(provide :deepbuilder/ex_write "93beb009a54ccf54fefb5b85020d0e0d")


