// Generated by gencpp from file deepbuilder/ex_change_motor_speed.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_EX_CHANGE_MOTOR_SPEED_H
#define DEEPBUILDER_MESSAGE_EX_CHANGE_MOTOR_SPEED_H

#include <ros/service_traits.h>


#include <deepbuilder/ex_change_motor_speedRequest.h>
#include <deepbuilder/ex_change_motor_speedResponse.h>


namespace deepbuilder
{

struct ex_change_motor_speed
{

typedef ex_change_motor_speedRequest Request;
typedef ex_change_motor_speedResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ex_change_motor_speed
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::ex_change_motor_speed > {
  static const char* value()
  {
    return "ac15ce1feb45ac549d2e2b722ff0d645";
  }

  static const char* value(const ::deepbuilder::ex_change_motor_speed&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::ex_change_motor_speed > {
  static const char* value()
  {
    return "deepbuilder/ex_change_motor_speed";
  }

  static const char* value(const ::deepbuilder::ex_change_motor_speed&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::ex_change_motor_speedRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::ex_change_motor_speed > 
template<>
struct MD5Sum< ::deepbuilder::ex_change_motor_speedRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ex_change_motor_speed >::value();
  }
  static const char* value(const ::deepbuilder::ex_change_motor_speedRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ex_change_motor_speedRequest> should match 
// service_traits::DataType< ::deepbuilder::ex_change_motor_speed > 
template<>
struct DataType< ::deepbuilder::ex_change_motor_speedRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ex_change_motor_speed >::value();
  }
  static const char* value(const ::deepbuilder::ex_change_motor_speedRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::ex_change_motor_speedResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::ex_change_motor_speed > 
template<>
struct MD5Sum< ::deepbuilder::ex_change_motor_speedResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ex_change_motor_speed >::value();
  }
  static const char* value(const ::deepbuilder::ex_change_motor_speedResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ex_change_motor_speedResponse> should match 
// service_traits::DataType< ::deepbuilder::ex_change_motor_speed > 
template<>
struct DataType< ::deepbuilder::ex_change_motor_speedResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ex_change_motor_speed >::value();
  }
  static const char* value(const ::deepbuilder::ex_change_motor_speedResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_EX_CHANGE_MOTOR_SPEED_H