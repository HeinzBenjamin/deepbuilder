// Generated by gencpp from file deepbuilder/ro_gripper_open.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_GRIPPER_OPEN_H
#define DEEPBUILDER_MESSAGE_RO_GRIPPER_OPEN_H

#include <ros/service_traits.h>


#include <deepbuilder/ro_gripper_openRequest.h>
#include <deepbuilder/ro_gripper_openResponse.h>


namespace deepbuilder
{

struct ro_gripper_open
{

typedef ro_gripper_openRequest Request;
typedef ro_gripper_openResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ro_gripper_open
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::ro_gripper_open > {
  static const char* value()
  {
    return "5f003d6bcc824cbd51361d66d8e4f76c";
  }

  static const char* value(const ::deepbuilder::ro_gripper_open&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::ro_gripper_open > {
  static const char* value()
  {
    return "deepbuilder/ro_gripper_open";
  }

  static const char* value(const ::deepbuilder::ro_gripper_open&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::ro_gripper_openRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_gripper_open > 
template<>
struct MD5Sum< ::deepbuilder::ro_gripper_openRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_gripper_open >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_openRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_gripper_openRequest> should match 
// service_traits::DataType< ::deepbuilder::ro_gripper_open > 
template<>
struct DataType< ::deepbuilder::ro_gripper_openRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_gripper_open >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_openRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::ro_gripper_openResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_gripper_open > 
template<>
struct MD5Sum< ::deepbuilder::ro_gripper_openResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_gripper_open >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_openResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_gripper_openResponse> should match 
// service_traits::DataType< ::deepbuilder::ro_gripper_open > 
template<>
struct DataType< ::deepbuilder::ro_gripper_openResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_gripper_open >::value();
  }
  static const char* value(const ::deepbuilder::ro_gripper_openResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_GRIPPER_OPEN_H
