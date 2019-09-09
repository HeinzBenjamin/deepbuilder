
(cl:in-package :asdf)

(defsystem "deepbuilder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :my_msgs-msg
)
  :components ((:file "_package")
    (:file "rt_status" :depends-on ("_package_rt_status"))
    (:file "_package_rt_status" :depends-on ("_package"))
  ))