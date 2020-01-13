
(cl:in-package :asdf)

(defsystem "deepbuilder-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "ro_move_home" :depends-on ("_package_ro_move_home"))
    (:file "_package_ro_move_home" :depends-on ("_package"))
    (:file "ro_move_path" :depends-on ("_package_ro_move_path"))
    (:file "_package_ro_move_path" :depends-on ("_package"))
    (:file "ro_move_point" :depends-on ("_package_ro_move_point"))
    (:file "_package_ro_move_point" :depends-on ("_package"))
    (:file "ro_plan_path" :depends-on ("_package_ro_plan_path"))
    (:file "_package_ro_plan_path" :depends-on ("_package"))
    (:file "ro_update_state_mesh" :depends-on ("_package_ro_update_state_mesh"))
    (:file "_package_ro_update_state_mesh" :depends-on ("_package"))
  ))