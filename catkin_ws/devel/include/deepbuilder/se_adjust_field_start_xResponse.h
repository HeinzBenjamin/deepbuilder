// Generated by gencpp from file deepbuilder/se_adjust_field_start_xResponse.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_SE_ADJUST_FIELD_START_XRESPONSE_H
#define DEEPBUILDER_MESSAGE_SE_ADJUST_FIELD_START_XRESPONSE_H


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
struct se_adjust_field_start_xResponse_
{
  typedef se_adjust_field_start_xResponse_<ContainerAllocator> Type;

  se_adjust_field_start_xResponse_()
    : oldValue(0)
    , newValue(0)  {
    }
  se_adjust_field_start_xResponse_(const ContainerAllocator& _alloc)
    : oldValue(0)
    , newValue(0)  {
  (void)_alloc;
    }



   typedef int32_t _oldValue_type;
  _oldValue_type oldValue;

   typedef int32_t _newValue_type;
  _newValue_type newValue;





  typedef boost::shared_ptr< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> const> ConstPtr;

}; // struct se_adjust_field_start_xResponse_

typedef ::deepbuilder::se_adjust_field_start_xResponse_<std::allocator<void> > se_adjust_field_start_xResponse;

typedef boost::shared_ptr< ::deepbuilder::se_adjust_field_start_xResponse > se_adjust_field_start_xResponsePtr;
typedef boost::shared_ptr< ::deepbuilder::se_adjust_field_start_xResponse const> se_adjust_field_start_xResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace deepbuilder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'deepbuilder': ['/home/ros/deepbuilder/catkin_ws/src/deepbuilder/msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'rosbridge_msgs': ['/opt/ros/kinetic/share/rosbridge_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dc7d7c2d117e09b4a630c3701718d7d0";
  }

  static const char* value(const ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdc7d7c2d117e09b4ULL;
  static const uint64_t static_value2 = 0xa630c3701718d7d0ULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/se_adjust_field_start_xResponse";
  }

  static const char* value(const ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 oldValue\n\
int32 newValue\n\
";
  }

  static const char* value(const ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.oldValue);
      stream.next(m.newValue);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct se_adjust_field_start_xResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::se_adjust_field_start_xResponse_<ContainerAllocator>& v)
  {
    s << indent << "oldValue: ";
    Printer<int32_t>::stream(s, indent + "  ", v.oldValue);
    s << indent << "newValue: ";
    Printer<int32_t>::stream(s, indent + "  ", v.newValue);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_SE_ADJUST_FIELD_START_XRESPONSE_H
