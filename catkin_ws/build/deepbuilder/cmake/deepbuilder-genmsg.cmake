# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "deepbuilder: 0 messages, 5 services")

set(MSG_I_FLAGS "-Imy_msgs:/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Irosbridge_msgs:/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/kinetic/share/shape_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(deepbuilder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" "trajectory_msgs/JointTrajectoryPoint:std_msgs/Header:trajectory_msgs/JointTrajectory"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" "trajectory_msgs/JointTrajectoryPoint:std_msgs/Header:trajectory_msgs/JointTrajectory"
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" ""
)

get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_custom_target(_deepbuilder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "deepbuilder" "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv"
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
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/deepbuilder
)
_generate_srv_cpp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
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
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_cpp _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_gencpp)
add_dependencies(deepbuilder_gencpp deepbuilder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv"
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
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/deepbuilder
)
_generate_srv_eus(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
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
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_eus _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_geneus)
add_dependencies(deepbuilder_geneus deepbuilder_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv"
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
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/deepbuilder
)
_generate_srv_lisp(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
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
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_lisp _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_genlisp)
add_dependencies(deepbuilder_genlisp deepbuilder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv"
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
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/deepbuilder
)
_generate_srv_nodejs(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
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
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_nodejs _deepbuilder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(deepbuilder_gennodejs)
add_dependencies(deepbuilder_gennodejs deepbuilder_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS deepbuilder_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv"
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
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder
)
_generate_srv_py(deepbuilder
  "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg"
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
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_plan_path.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_update_state_mesh.srv" NAME_WE)
add_dependencies(deepbuilder_generate_messages_py _deepbuilder_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv" NAME_WE)
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
if(TARGET shape_msgs_generate_messages_cpp)
  add_dependencies(deepbuilder_generate_messages_cpp shape_msgs_generate_messages_cpp)
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
if(TARGET shape_msgs_generate_messages_eus)
  add_dependencies(deepbuilder_generate_messages_eus shape_msgs_generate_messages_eus)
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
if(TARGET shape_msgs_generate_messages_lisp)
  add_dependencies(deepbuilder_generate_messages_lisp shape_msgs_generate_messages_lisp)
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
if(TARGET shape_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs shape_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET trajectory_msgs_generate_messages_nodejs)
  add_dependencies(deepbuilder_generate_messages_nodejs trajectory_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/deepbuilder\")")
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
if(TARGET shape_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py shape_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(deepbuilder_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
