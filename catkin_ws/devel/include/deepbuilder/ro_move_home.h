// Generated by gencpp from file deepbuilder/ro_move_home.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RO_MOVE_HOME_H
#define DEEPBUILDER_MESSAGE_RO_MOVE_HOME_H

#include <ros/service_traits.h>


#include <deepbuilder/ro_move_homeRequest.h>
#include <deepbuilder/ro_move_homeResponse.h>


namespace deepbuilder
{

struct ro_move_home
{

typedef ro_move_homeRequest Request;
typedef ro_move_homeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ro_move_home
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::ro_move_home > {
  static const char* value()
  {
    return "65f9af88059b07caeeaf7e2d659e542b";
  }

  static const char* value(const ::deepbuilder::ro_move_home&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::ro_move_home > {
  static const char* value()
  {
    return "deepbuilder/ro_move_home";
  }

  static const char* value(const ::deepbuilder::ro_move_home&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::ro_move_homeRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_move_home > 
template<>
struct MD5Sum< ::deepbuilder::ro_move_homeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_move_home >::value();
  }
  static const char* value(const ::deepbuilder::ro_move_homeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_move_homeRequest> should match 
// service_traits::DataType< ::deepbuilder::ro_move_home > 
template<>
struct DataType< ::deepbuilder::ro_move_homeRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_move_home >::value();
  }
  static const char* value(const ::deepbuilder::ro_move_homeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::ro_move_homeResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::ro_move_home > 
template<>
struct MD5Sum< ::deepbuilder::ro_move_homeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::ro_move_home >::value();
  }
  static const char* value(const ::deepbuilder::ro_move_homeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::ro_move_homeResponse> should match 
// service_traits::DataType< ::deepbuilder::ro_move_home > 
template<>
struct DataType< ::deepbuilder::ro_move_homeResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::ro_move_home >::value();
  }
  static const char* value(const ::deepbuilder::ro_move_homeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RO_MOVE_HOME_H
