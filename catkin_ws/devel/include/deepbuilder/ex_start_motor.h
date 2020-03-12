// Generated by gencpp from file deepbuilder/ex_start_motor.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_EX_START_MOTOR_H
#define DEEPBUILDER_MESSAGE_EX_START_MOTOR_H

#include <ros/service_traits.h>


#include <deepbuilder/ex_start_motorRequest.h>
#include <deepbuilder/ex_start_motorResponse.h>


namespace deepbuilder
{

struct ex_start_motor
{

typedef ex_start_motorRequest Request;
typedef ex_start_motorResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ex_start_motor
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::ex_start_motor > {
  static const char* value()
  {
    return "5f003d6bcc824cbd51361d66d8e4f76c";
  }

  static const char* value(const ::deepbuilder::ex_start_motor&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::ex_start_motor > {
  static const char* value()
  {
    return "deepbuilder/ex_start_motor";
  }

  static const char* value(const ::deepbuilder::ex_start_motor&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::ex_start_motorRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::ex_start_motor > 
template<>
struct MD5Sum< ::deepbuilder::ex_start_motorRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ex_start_motor >::value();
  }
  static const char* value(const ::deepbuilder::ex_start_motorRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ex_start_motorRequest> should match 
// service_traits::DataType< ::deepbuilder::ex_start_motor > 
template<>
struct DataType< ::deepbuilder::ex_start_motorRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ex_start_motor >::value();
  }
  static const char* value(const ::deepbuilder::ex_start_motorRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::ex_start_motorResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::ex_start_motor > 
template<>
struct MD5Sum< ::deepbuilder::ex_start_motorResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ex_start_motor >::value();
  }
  static const char* value(const ::deepbuilder::ex_start_motorResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ex_start_motorResponse> should match 
// service_traits::DataType< ::deepbuilder::ex_start_motor > 
template<>
struct DataType< ::deepbuilder::ex_start_motorResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ex_start_motor >::value();
  }
  static const char* value(const ::deepbuilder::ex_start_motorResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_EX_START_MOTOR_H