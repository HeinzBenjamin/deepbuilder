// Generated by gencpp from file deepbuilder/ex_change_tempRequest.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_EX_CHANGE_TEMPREQUEST_H
#define DEEPBUILDER_MESSAGE_EX_CHANGE_TEMPREQUEST_H


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
struct ex_change_tempRequest_
{
  typedef ex_change_tempRequest_<ContainerAllocator> Type;

  ex_change_tempRequest_()
    : value(0.0)
    , wait(false)  {
    }
  ex_change_tempRequest_(const ContainerAllocator& _alloc)
    : value(0.0)
    , wait(false)  {
  (void)_alloc;
    }



   typedef float _value_type;
  _value_type value;

   typedef uint8_t _wait_type;
  _wait_type wait;





  typedef boost::shared_ptr< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ex_change_tempRequest_

typedef ::deepbuilder::ex_change_tempRequest_<std::allocator<void> > ex_change_tempRequest;

typedef boost::shared_ptr< ::deepbuilder::ex_change_tempRequest > ex_change_tempRequestPtr;
typedef boost::shared_ptr< ::deepbuilder::ex_change_tempRequest const> ex_change_tempRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "623b7792c59d824fd49fc71b84271b68";
  }

  static const char* value(const ::deepbuilder::ex_change_tempRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x623b7792c59d824fULL;
  static const uint64_t static_value2 = 0xd49fc71b84271b68ULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ex_change_tempRequest";
  }

  static const char* value(const ::deepbuilder::ex_change_tempRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 value\n\
bool wait\n\
";
  }

  static const char* value(const ::deepbuilder::ex_change_tempRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.value);
      stream.next(m.wait);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ex_change_tempRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ex_change_tempRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ex_change_tempRequest_<ContainerAllocator>& v)
  {
    s << indent << "value: ";
    Printer<float>::stream(s, indent + "  ", v.value);
    s << indent << "wait: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.wait);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_EX_CHANGE_TEMPREQUEST_H
