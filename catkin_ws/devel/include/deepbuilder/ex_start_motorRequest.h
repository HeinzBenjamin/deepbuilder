// Generated by gencpp from file deepbuilder/ex_start_motorRequest.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_EX_START_MOTORREQUEST_H
#define DEEPBUILDER_MESSAGE_EX_START_MOTORREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace deepbuilder
{
template <class ContainerAllocator>
struct ex_start_motorRequest_
{
  typedef ex_start_motorRequest_<ContainerAllocator> Type;

  ex_start_motorRequest_()
    {
    }
  ex_start_motorRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ex_start_motorRequest_

typedef ::deepbuilder::ex_start_motorRequest_<std::allocator<void> > ex_start_motorRequest;

typedef boost::shared_ptr< ::deepbuilder::ex_start_motorRequest > ex_start_motorRequestPtr;
typedef boost::shared_ptr< ::deepbuilder::ex_start_motorRequest const> ex_start_motorRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace deepbuilder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'shape_msgs': ['/opt/ros/kinetic/share/shape_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'moveit_msgs': ['/opt/ros/kinetic/share/moveit_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'object_recognition_msgs': ['/opt/ros/kinetic/share/object_recognition_msgs/cmake/../msg'], 'octomap_msgs': ['/opt/ros/kinetic/share/octomap_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'rosbridge_msgs': ['/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::deepbuilder::ex_start_motorRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ex_start_motorRequest";
  }

  static const char* value(const ::deepbuilder::ex_start_motorRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::deepbuilder::ex_start_motorRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ex_start_motorRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ex_start_motorRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::deepbuilder::ex_start_motorRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_EX_START_MOTORREQUEST_H
