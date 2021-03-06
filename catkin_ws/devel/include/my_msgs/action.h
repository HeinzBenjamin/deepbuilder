// Generated by gencpp from file my_msgs/action.msg
// DO NOT EDIT!


#ifndef MY_MSGS_MESSAGE_ACTION_H
#define MY_MSGS_MESSAGE_ACTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_msgs
{
template <class ContainerAllocator>
struct action_
{
  typedef action_<ContainerAllocator> Type;

  action_()
    : id()
    , A0(0.0)
    , A1(0.0)
    , A2(0.0)
    , A3(0.0)
    , A4(0.0)
    , A5(0.0)
    , A6(0.0)  {
    }
  action_(const ContainerAllocator& _alloc)
    : id(_alloc)
    , A0(0.0)
    , A1(0.0)
    , A2(0.0)
    , A3(0.0)
    , A4(0.0)
    , A5(0.0)
    , A6(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _id_type;
  _id_type id;

   typedef float _A0_type;
  _A0_type A0;

   typedef float _A1_type;
  _A1_type A1;

   typedef float _A2_type;
  _A2_type A2;

   typedef float _A3_type;
  _A3_type A3;

   typedef float _A4_type;
  _A4_type A4;

   typedef float _A5_type;
  _A5_type A5;

   typedef float _A6_type;
  _A6_type A6;





  typedef boost::shared_ptr< ::my_msgs::action_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_msgs::action_<ContainerAllocator> const> ConstPtr;

}; // struct action_

typedef ::my_msgs::action_<std::allocator<void> > action;

typedef boost::shared_ptr< ::my_msgs::action > actionPtr;
typedef boost::shared_ptr< ::my_msgs::action const> actionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_msgs::action_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_msgs::action_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'my_msgs': ['/home/ros/deepbuilder/catkin_ws/src/my_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_msgs::action_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_msgs::action_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_msgs::action_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_msgs::action_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_msgs::action_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_msgs::action_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_msgs::action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c40b50724540a881a54a2f96dfd06062";
  }

  static const char* value(const ::my_msgs::action_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc40b50724540a881ULL;
  static const uint64_t static_value2 = 0xa54a2f96dfd06062ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_msgs::action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_msgs/action";
  }

  static const char* value(const ::my_msgs::action_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_msgs::action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string id\n\
float32 A0\n\
float32 A1\n\
float32 A2\n\
float32 A3\n\
float32 A4\n\
float32 A5\n\
float32 A6\n\
";
  }

  static const char* value(const ::my_msgs::action_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_msgs::action_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.A0);
      stream.next(m.A1);
      stream.next(m.A2);
      stream.next(m.A3);
      stream.next(m.A4);
      stream.next(m.A5);
      stream.next(m.A6);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct action_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_msgs::action_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_msgs::action_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.id);
    s << indent << "A0: ";
    Printer<float>::stream(s, indent + "  ", v.A0);
    s << indent << "A1: ";
    Printer<float>::stream(s, indent + "  ", v.A1);
    s << indent << "A2: ";
    Printer<float>::stream(s, indent + "  ", v.A2);
    s << indent << "A3: ";
    Printer<float>::stream(s, indent + "  ", v.A3);
    s << indent << "A4: ";
    Printer<float>::stream(s, indent + "  ", v.A4);
    s << indent << "A5: ";
    Printer<float>::stream(s, indent + "  ", v.A5);
    s << indent << "A6: ";
    Printer<float>::stream(s, indent + "  ", v.A6);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_MSGS_MESSAGE_ACTION_H
