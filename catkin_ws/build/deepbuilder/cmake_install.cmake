# Install script for directory: /home/ros/deepbuilder/catkin_ws/src/deepbuilder

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ros/deepbuilder/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder/msg" TYPE FILE FILES "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg/rt_status.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder/srv" TYPE FILE FILES
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_is_ready.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_wait_for_ready.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_state.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_action.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_get_status.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/rt_set_agent_presence.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_close.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_open.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_moveto.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setspeed.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_gripper_setforce.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_home.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_source.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_point.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_cam.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_move_path.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_block.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_state.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_get_robot_state.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/ro_check_path.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_resolution.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_x.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_fieldsize_y.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_x.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_offset_y.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_x.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_field_start_y.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_adjust_correction.srv"
    "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/srv/se_get_values.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder/cmake" TYPE FILE FILES "/home/ros/deepbuilder/catkin_ws/build/deepbuilder/catkin_generated/installspace/deepbuilder-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ros/deepbuilder/catkin_ws/devel/include/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ros/deepbuilder/catkin_ws/devel/share/roseus/ros/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ros/deepbuilder/catkin_ws/devel/share/common-lisp/ros/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ros/deepbuilder/catkin_ws/devel/share/gennodejs/ros/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/ros/deepbuilder/catkin_ws/devel/lib/python2.7/dist-packages/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/ros/deepbuilder/catkin_ws/devel/lib/python2.7/dist-packages/deepbuilder")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ros/deepbuilder/catkin_ws/build/deepbuilder/catkin_generated/installspace/deepbuilder.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder/cmake" TYPE FILE FILES "/home/ros/deepbuilder/catkin_ws/build/deepbuilder/catkin_generated/installspace/deepbuilder-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder/cmake" TYPE FILE FILES
    "/home/ros/deepbuilder/catkin_ws/build/deepbuilder/catkin_generated/installspace/deepbuilderConfig.cmake"
    "/home/ros/deepbuilder/catkin_ws/build/deepbuilder/catkin_generated/installspace/deepbuilderConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/deepbuilder" TYPE FILE FILES "/home/ros/deepbuilder/catkin_ws/src/deepbuilder/package.xml")
endif()

