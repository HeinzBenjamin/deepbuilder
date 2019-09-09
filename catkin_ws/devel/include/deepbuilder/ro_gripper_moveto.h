// Generated by gencpp from file deepbuilder/ro_gripper_moveto.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_GRIPPER_MOVETO_H
#define DEEPBUILDER_MESSAGE_RO_GRIPPER_MOVETO_H

#include <ros/service_traits.h>


#include <deepbuilder/ro_gripper_movetoRequest.h>
#include <deepbuilder/ro_gripper_movetoResponse.h>


namespace deepbuilder
{

struct ro_gripper_moveto
{

typedef ro_gripper_movetoRequest Request;
typedef ro_gripper_movetoResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ro_gripper_moveto
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::ro_gripper_moveto > {
  static const char* value()
  {
    return "9a72e9df09a389879daf01f6fbd13491";
  }

  static const char* value(const ::deepbuilder::ro_gripper_moveto&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::ro_gripper_moveto > {
  static const char* value()
  {
    return "deepbuilder/ro_gripper_moveto";
  }

  static const char* value(const ::deepbuilder::ro_gripper_moveto&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::ro_gripper_movetoRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_gripper_moveto > 
template<>
struct MD5Sum< ::deepbuilder::ro_gripper_movetoRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_gripper_moveto >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_movetoRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_gripper_movetoRequest> should match 
// service_traits::DataType< ::deepbuilder::ro_gripper_moveto > 
template<>
struct DataType< ::deepbuilder::ro_gripper_movetoRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_gripper_moveto >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_movetoRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::ro_gripper_movetoResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_gripper_moveto > 
template<>
struct MD5Sum< ::deepbuilder::ro_gripper_movetoResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_gripper_moveto >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_movetoResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_gripper_movetoResponse> should match 
// service_traits::DataType< ::deepbuilder::ro_gripper_moveto > 
template<>
struct DataType< ::deepbuilder::ro_gripper_movetoResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_gripper_moveto >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_movetoResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_GRIPPER_MOVETO_H
