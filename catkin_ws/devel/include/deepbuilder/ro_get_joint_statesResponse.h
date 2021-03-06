// Generated by gencpp from file deepbuilder/ro_get_joint_statesResponse.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_GET_JOINT_STATESRESPONSE_H
#define DEEPBUILDER_MESSAGE_RO_GET_JOINT_STATESRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/JointState.h>

namespace deepbuilder
{
template <class ContainerAllocator>
struct ro_get_joint_statesResponse_
{
  typedef ro_get_joint_statesResponse_<ContainerAllocator> Type;

  ro_get_joint_statesResponse_()
    : joint_states()  {
    }
  ro_get_joint_statesResponse_(const ContainerAllocator& _alloc)
    : joint_states(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::JointState_<ContainerAllocator>  _joint_states_type;
  _joint_states_type joint_states;





  typedef boost::shared_ptr< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ro_get_joint_statesResponse_

typedef ::deepbuilder::ro_get_joint_statesResponse_<std::allocator<void> > ro_get_joint_statesResponse;

typedef boost::shared_ptr< ::deepbuilder::ro_get_joint_statesResponse > ro_get_joint_statesResponsePtr;
typedef boost::shared_ptr< ::deepbuilder::ro_get_joint_statesResponse const> ro_get_joint_statesResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace deepbuilder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'shape_msgs': ['/opt/ros/kinetic/share/shape_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'moveit_msgs': ['/opt/ros/kinetic/share/moveit_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'object_recognition_msgs': ['/opt/ros/kinetic/share/object_recognition_msgs/cmake/../msg'], 'octomap_msgs': ['/opt/ros/kinetic/share/octomap_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'rosbridge_msgs': ['/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "482cc7b23f4d6ca5e5aac26ecce1ce01";
  }

  static const char* value(const ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x482cc7b23f4d6ca5ULL;
  static const uint64_t static_value2 = 0xe5aac26ecce1ce01ULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ro_get_joint_statesResponse";
  }

  static const char* value(const ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/JointState joint_states\n\
\n\
================================================================================\n\
MSG: sensor_msgs/JointState\n\
# This is a message that holds data to describe the state of a set of torque controlled joints. \n\
#\n\
# The state of each joint (revolute or prismatic) is defined by:\n\
#  * the position of the joint (rad or m),\n\
#  * the velocity of the joint (rad/s or m/s) and \n\
#  * the effort that is applied in the joint (Nm or N).\n\
#\n\
# Each joint is uniquely identified by its name\n\
# The header specifies the time at which the joint states were recorded. All the joint states\n\
# in one message have to be recorded at the same time.\n\
#\n\
# This message consists of a multiple arrays, one for each part of the joint state. \n\
# The goal is to make each of the fields optional. When e.g. your joints have no\n\
# effort associated with them, you can leave the effort array empty. \n\
#\n\
# All arrays in this message should have the same size, or be empty.\n\
# This is the only way to uniquely associate the joint name with the correct\n\
# states.\n\
\n\
\n\
Header header\n\
\n\
string[] name\n\
float64[] position\n\
float64[] velocity\n\
float64[] effort\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joint_states);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ro_get_joint_statesResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ro_get_joint_statesResponse_<ContainerAllocator>& v)
  {
    s << indent << "joint_states: ";
    s << std::endl;
    Printer< ::sensor_msgs::JointState_<ContainerAllocator> >::stream(s, indent + "  ", v.joint_states);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_GET_JOINT_STATESRESPONSE_H
