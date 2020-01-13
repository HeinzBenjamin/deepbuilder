// Generated by gencpp from file deepbuilder/ro_plan_pathResponse.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_PLAN_PATHRESPONSE_H
#define DEEPBUILDER_MESSAGE_RO_PLAN_PATHRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <trajectory_msgs/JointTrajectory.h>

namespace deepbuilder
{
template <class ContainerAllocator>
struct ro_plan_pathResponse_
{
  typedef ro_plan_pathResponse_<ContainerAllocator> Type;

  ro_plan_pathResponse_()
    : path()
    , collisions()
    , message()  {
    }
  ro_plan_pathResponse_(const ContainerAllocator& _alloc)
    : path(_alloc)
    , collisions(_alloc)
    , message(_alloc)  {
  (void)_alloc;
    }



   typedef  ::trajectory_msgs::JointTrajectory_<ContainerAllocator>  _path_type;
  _path_type path;

   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _collisions_type;
  _collisions_type collisions;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ro_plan_pathResponse_

typedef ::deepbuilder::ro_plan_pathResponse_<std::allocator<void> > ro_plan_pathResponse;

typedef boost::shared_ptr< ::deepbuilder::ro_plan_pathResponse > ro_plan_pathResponsePtr;
typedef boost::shared_ptr< ::deepbuilder::ro_plan_pathResponse const> ro_plan_pathResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace deepbuilder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'shape_msgs': ['/opt/ros/kinetic/share/shape_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'rosbridge_msgs': ['/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e8ee0855aadc4b6691c3e96847c5833b";
  }

  static const char* value(const ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe8ee0855aadc4b66ULL;
  static const uint64_t static_value2 = 0x91c3e96847c5833bULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ro_plan_pathResponse";
  }

  static const char* value(const ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "trajectory_msgs/JointTrajectory path\n\
\n\
bool[] collisions\n\
string message\n\
\n\
================================================================================\n\
MSG: trajectory_msgs/JointTrajectory\n\
Header header\n\
string[] joint_names\n\
JointTrajectoryPoint[] points\n\
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
\n\
================================================================================\n\
MSG: trajectory_msgs/JointTrajectoryPoint\n\
# Each trajectory point specifies either positions[, velocities[, accelerations]]\n\
# or positions[, effort] for the trajectory to be executed.\n\
# All specified values are in the same order as the joint names in JointTrajectory.msg\n\
\n\
float64[] positions\n\
float64[] velocities\n\
float64[] accelerations\n\
float64[] effort\n\
duration time_from_start\n\
";
  }

  static const char* value(const ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.path);
      stream.next(m.collisions);
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ro_plan_pathResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ro_plan_pathResponse_<ContainerAllocator>& v)
  {
    s << indent << "path: ";
    s << std::endl;
    Printer< ::trajectory_msgs::JointTrajectory_<ContainerAllocator> >::stream(s, indent + "  ", v.path);
    s << indent << "collisions[]" << std::endl;
    for (size_t i = 0; i < v.collisions.size(); ++i)
    {
      s << indent << "  collisions[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.collisions[i]);
    }
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_PLAN_PATHRESPONSE_H