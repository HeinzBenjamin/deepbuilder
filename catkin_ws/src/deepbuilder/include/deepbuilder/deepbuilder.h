#pragma once
#include <ros/ros.h>
#include <ros/this_node.h>
#include <ros/master.h>
#include <thread>
#include <chrono>
#include "termcolor.h"
#include <my_msgs/action.h>
#include <my_msgs/state.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <boost/shared_ptr.hpp>
#include <rosbridge_msgs/ConnectedClients.h>

#define NO_COLOR termcolor::reset
#define PRINT(msg) __print(msg, COLOR)
#define PRINT_BOLD(msg) __print_bold(msg, COLOR)
#define PRINT_ERROR(msg) __print_error(msg)
#define PRINT_WARNING(msg) __print_warning(msg)

template <typename T1, typename T2>
inline void __print(T1 msg, T2 col)
{
    std::cout << col << msg << NO_COLOR << std::endl;
}

template <typename T1, typename T2>
inline void __print_bold(T1 msg, T2 col)
{
    std::cout << col << termcolor::bold << msg << NO_COLOR << std::endl;
}

template<typename T1>
inline void __print_error(T1 msg){
    std::cout << termcolor::red << termcolor::bold << msg << NO_COLOR << std::endl;
}

template<typename T1>
inline void __print_warning(T1 msg){
    std::cout << termcolor::yellow << msg << NO_COLOR << std::endl;
}