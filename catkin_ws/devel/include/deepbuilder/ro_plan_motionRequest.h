// Generated by gencpp from file deepbuilder/ro_plan_motionRequest.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_PLAN_MOTIONREQUEST_H
#define DEEPBUILDER_MESSAGE_RO_PLAN_MOTIONREQUEST_H


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
struct ro_plan_motionRequest_
{
  typedef ro_plan_motionRequest_<ContainerAllocator> Type;

  ro_plan_motionRequest_()
    : first_point_joint_states()
    , way_points()
    , speed(0.0)  {
    }
  ro_plan_motionRequest_(const ContainerAllocator& _alloc)
    : first_point_joint_states(_alloc)
    , way_points(_alloc)
    , speed(0.0)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _first_point_joint_states_type;
  _first_point_joint_states_type first_point_joint_states;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _way_points_type;
  _way_points_type way_points;

   typedef float _speed_type;
  _speed_type speed;





  typedef boost::shared_ptr< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ro_plan_motionRequest_

typedef ::deepbuilder::ro_plan_motionRequest_<std::allocator<void> > ro_plan_motionRequest;

typedef boost::shared_ptr< ::deepbuilder::ro_plan_motionRequest > ro_plan_motionRequestPtr;
typedef boost::shared_ptr< ::deepbuilder::ro_plan_motionRequest const> ro_plan_motionRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a5e1103996b2665386a0e743d1712fe5";
  }

  static const char* value(const ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa5e1103996b26653ULL;
  static const uint64_t static_value2 = 0x86a0e743d1712fe5ULL;
};

template<class ContainerAllocator>
struct DataType< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "deepbuilder/ro_plan_motionRequest";
  }

  static const char* value(const ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] first_point_joint_states\n\
float32[] way_points\n\
float32 speed\n\
";
  }

  static const char* value(const ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.first_point_joint_states);
      stream.next(m.way_points);
      stream.next(m.speed);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ro_plan_motionRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::deepbuilder::ro_plan_motionRequest_<ContainerAllocator>& v)
  {
    s << indent << "first_point_joint_states[]" << std::endl;
    for (size_t i = 0; i < v.first_point_joint_states.size(); ++i)
    {
      s << indent << "  first_point_joint_states[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.first_point_joint_states[i]);
    }
    s << indent << "way_points[]" << std::endl;
    for (size_t i = 0; i < v.way_points.size(); ++i)
    {
      s << indent << "  way_points[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.way_points[i]);
    }
    s << indent << "speed: ";
    Printer<float>::stream(s, indent + "  ", v.speed);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_PLAN_MOTIONREQUEST_H