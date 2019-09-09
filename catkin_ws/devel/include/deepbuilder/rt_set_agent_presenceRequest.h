// Generated by gencpp from file deepbuilder/rt_set_agent_presenceRequest.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RT_SET_AGENT_PRESENCEREQUEST_H
#define DEEPBUILDER_MESSAGE_RT_SET_AGENT_PRESENCEREQUEST_H


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
struct rt_set_agent_presenceRequest_
{
  typedef rt_set_agent_presenceRequest_<ContainerAllocator> Type;

  rt_set_agent_presenceRequest_()
    : agent_present(false)  {
    }
  rt_set_agent_presenceRequest_(const ContainerAllocator& _alloc)
    : agent_present(false)  {
  (void)_alloc;
    }



   typedef uint8_t _agent_present_type;
  _agent_present_type agent_present;





  typedef boost::shared_ptr< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> const> ConstPtr;

}; // struct rt_set_agent_presenceRequest_

typedef ::deepbuilder::rt_set_agent_presenceRequest_<std::allocator<void> > rt_set_agent_presenceRequest;

typedef boost::shared_ptr< ::deepbuilder::rt_set_agent_presenceRequest > rt_set_agent_presenceRequestPtr;
typedef boost::shared_ptr< ::deepbuilder::rt_set_agent_presenceRequest const> rt_set_agent_presenceRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8d81a8d38b2cf9545ac2bc74275099bf";
  }

  static const char* value(const ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8d81a8d38b2cf954ULL;
  static const uint64_t static_value2 = 0x5ac2bc74275099bfULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/rt_set_agent_presenceRequest";
  }

  static const char* value(const ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool agent_present\n\
";
  }

  static const char* value(const ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.agent_present);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct rt_set_agent_presenceRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::rt_set_agent_presenceRequest_<ContainerAllocator>& v)
  {
    s << indent << "agent_present: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.agent_present);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RT_SET_AGENT_PRESENCEREQUEST_H
