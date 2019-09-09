# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "deepbuilder: 1 messages, 29 services")

set(MSG_I_FLAGS "-Ideepbuilder:/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg;-Imy_msgs:/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Irosbridge_msgs:/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(deepbuilder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" "trajectory_msgs/JointTrajectoryPoint:std_msgs/Header:trajectory_msgs/JointTrajectory"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" "my_msgs/state:geometry_msgs/Quaternion:geometry_msgs/Point:deepbuilder/rt_status:geometry_msgs/Pose:my_msgs/action"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" "my_msgs/float_array"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:my_msgs/action:my_msgs/state:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" "my_msgs/action"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" "geometry_msgs/Quaternion:geometry_msgs/Pose:my_msgs/state:geometry_msgs/Point"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)

### Generating Services
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/float_array.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)

### Generating Module File
_generate_module_cpp(deepbuilder
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(deepbuilder_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(deepbuilder_generate_messages deepbuilder_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_gencpp)
add_dependencies(deepbuilder_gencpp deepbuilder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)

### Generating Services
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/float_array.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)

### Generating Module File
_generate_module_eus(deepbuilder
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(deepbuilder_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(deepbuilder_generate_messages deepbuilder_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_geneus)
add_dependencies(deepbuilder_geneus deepbuilder_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)

### Generating Services
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/float_array.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)

### Generating Module File
_generate_module_lisp(deepbuilder
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(deepbuilder_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(deepbuilder_generate_messages deepbuilder_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_genlisp)
add_dependencies(deepbuilder_genlisp deepbuilder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)

### Generating Services
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/float_array.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)

### Generating Module File
_generate_module_nodejs(deepbuilder
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(deepbuilder_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(deepbuilder_generate_messages deepbuilder_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_gennodejs)
add_dependencies(deepbuilder_gennodejs deepbuilder_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)

### Generating Services
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/float_array.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/state.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
  "${MSG_I_FLAGS}"
  "/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg/action.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)

### Generating Module File
_generate_module_py(deepbuilder
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(deepbuilder_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(deepbuilder_generate_messages deepbuilder_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_genpy)
add_dependencies(deepbuilder_genpy deepbuilder_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET my_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp my_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET rosbridge_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp rosbridge_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET trajectory_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET my_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus my_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET rosbridge_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus rosbridge_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET trajectory_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus trajectory_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET my_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp my_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET rosbridge_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp rosbridge_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET trajectory_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp trajectory_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET my_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs my_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET rosbridge_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs rosbridge_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET trajectory_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs trajectory_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET my_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py my_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET rosbridge_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py rosbridge_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
