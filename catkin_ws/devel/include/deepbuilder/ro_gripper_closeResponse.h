// Generated by gencpp from file deepbuilder/ro_gripper_closeResponse.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_GRIPPER_CLOSERESPONSE_H
#define DEEPBUILDER_MESSAGE_RO_GRIPPER_CLOSERESPONSE_H


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
struct ro_gripper_closeResponse_
{
  typedef ro_gripper_closeResponse_<ContainerAllocator> Type;

  ro_gripper_closeResponse_()
    : message()  {
    }
  ro_gripper_closeResponse_(const ContainerAllocator& _alloc)
    : message(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _message_type;
  _message_type message;





  typedef boost::shared_ptr< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ro_gripper_closeResponse_

typedef ::deepbuilder::ro_gripper_closeResponse_<std::allocator<void> > ro_gripper_closeResponse;

typedef boost::shared_ptr< ::deepbuilder::ro_gripper_closeResponse > ro_gripper_closeResponsePtr;
typedef boost::shared_ptr< ::deepbuilder::ro_gripper_closeResponse const> ro_gripper_closeResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace deepbuilder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'deepbuilder': ['/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'rosbridge_msgs': ['/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5f003d6bcc824cbd51361d66d8e4f76c";
  }

  static const char* value(const ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5f003d6bcc824cbdULL;
  static const uint64_t static_value2 = 0x51361d66d8e4f76cULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ro_gripper_closeResponse";
  }

  static const char* value(const ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string message\n\
";
  }

  static const char* value(const ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.message);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ro_gripper_closeResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ro_gripper_closeResponse_<ContainerAllocator>& v)
  {
    s << indent << "message: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.message);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_GRIPPER_CLOSERESPONSE_H
