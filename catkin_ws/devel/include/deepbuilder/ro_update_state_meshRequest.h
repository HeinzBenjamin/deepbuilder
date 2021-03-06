// Generated by gencpp from file deepbuilder/ro_update_state_meshRequest.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_UPDATE_STATE_MESHREQUEST_H
#define DEEPBUILDER_MESSAGE_RO_UPDATE_STATE_MESHREQUEST_H


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
struct ro_update_state_meshRequest_
{
  typedef ro_update_state_meshRequest_<ContainerAllocator> Type;

  ro_update_state_meshRequest_()
    : vertices()
    , indices()
    , session()  {
    }
  ro_update_state_meshRequest_(const ContainerAllocator& _alloc)
    : vertices(_alloc)
    , indices(_alloc)
    , session(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _vertices_type;
  _vertices_type vertices;

   typedef std::vector<int32_t, typename ContainerAllocator::template rebind<int32_t>::other >  _indices_type;
  _indices_type indices;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _session_type;
  _session_type session;





  typedef boost::shared_ptr< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ro_update_state_meshRequest_

typedef ::deepbuilder::ro_update_state_meshRequest_<std::allocator<void> > ro_update_state_meshRequest;

typedef boost::shared_ptr< ::deepbuilder::ro_update_state_meshRequest > ro_update_state_meshRequestPtr;
typedef boost::shared_ptr< ::deepbuilder::ro_update_state_meshRequest const> ro_update_state_meshRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2d613adb849ca8d48a02e1057248cd10";
  }

  static const char* value(const ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2d613adb849ca8d4ULL;
  static const uint64_t static_value2 = 0x8a02e1057248cd10ULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ro_update_state_meshRequest";
  }

  static const char* value(const ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] vertices\n\
int32[] indices\n\
string session\n\
";
  }

  static const char* value(const ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vertices);
      stream.next(m.indices);
      stream.next(m.session);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ro_update_state_meshRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ro_update_state_meshRequest_<ContainerAllocator>& v)
  {
    s << indent << "vertices[]" << std::endl;
    for (size_t i = 0; i < v.vertices.size(); ++i)
    {
      s << indent << "  vertices[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.vertices[i]);
    }
    s << indent << "indices[]" << std::endl;
    for (size_t i = 0; i < v.indices.size(); ++i)
    {
      s << indent << "  indices[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.indices[i]);
    }
    s << indent << "session: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.session);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_UPDATE_STATE_MESHREQUEST_H
