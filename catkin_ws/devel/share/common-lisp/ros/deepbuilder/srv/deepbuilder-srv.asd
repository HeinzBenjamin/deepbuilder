
(cl:in-package :asdf)

(defsystem "deepbuilder-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :trajectory_msgs-msg
)
  :components ((:file "_package")
    (:file "ex_change_motor_speed" :depends-on ("_package_ex_change_motor_speed"))
    (:file "_package_ex_change_motor_speed" :depends-on ("_package"))
    (:file "ex_change_temp" :depends-on ("_package_ex_change_temp"))
    (:file "_package_ex_change_temp" :depends-on ("_package"))
    (:file "ex_reset_motor" :depends-on ("_package_ex_reset_motor"))
    (:file "_package_ex_reset_motor" :depends-on ("_package"))
    (:file "ex_start_motor" :depends-on ("_package_ex_start_motor"))
    (:file "_package_ex_start_motor" :depends-on ("_package"))
    (:file "ro_get_joint_states" :depends-on ("_package_ro_get_joint_states"))
    (:file "_package_ro_get_joint_states" :depends-on ("_package"))
    (:file "ro_move_home" :depends-on ("_package_ro_move_home"))
    (:file "_package_ro_move_home" :depends-on ("_package"))
    (:file "ro_move_path" :depends-on ("_package_ro_move_path"))
    (:file "_package_ro_move_path" :depends-on ("_package"))
    (:file "ro_move_point" :depends-on ("_package_ro_move_point"))
    (:file "_package_ro_move_point" :depends-on ("_package"))
    (:file "ro_plan_cartesian" :depends-on ("_package_ro_plan_cartesian"))
    (:file "_package_ro_plan_cartesian" :depends-on ("_package"))
    (:file "ro_plan_path" :depends-on ("_package_ro_plan_path"))
    (:file "_package_ro_plan_path" :depends-on ("_package"))
    (:file "ro_print_path" :depends-on ("_package_ro_print_path"))
    (:file "_package_ro_print_path" :depends-on ("_package"))
    (:file "ro_update_state_mesh" :depends-on ("_package_ro_update_state_mesh"))
    (:file "_package_ro_update_state_mesh" :depends-on ("_package"))
    (:file "se_collect_tags" :depends-on ("_package_se_collect_tags"))
    (:file "_package_se_collect_tags" :depends-on ("_package"))
    (:file "se_get_tags" :depends-on ("_package_se_get_tags"))
    (:file "_package_se_get_tags" :depends-on ("_package"))
    (:file "tc_read" :depends-on ("_package_tc_read"))
    (:file "_package_tc_read" :depends-on ("_package"))
    (:file "tc_write" :depends-on ("_package_tc_write"))
    (:file "_package_tc_write" :depends-on ("_package"))
  ))