// Generated by gencpp from file deepbuilder/rt_wait_for_ready.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_RT_WAIT_FOR_READY_H
#define DEEPBUILDER_MESSAGE_RT_WAIT_FOR_READY_H

#include <ros/service_traits.h>


#include <deepbuilder/rt_wait_for_readyRequest.h>
#include <deepbuilder/rt_wait_for_readyResponse.h>


namespace deepbuilder
{

struct rt_wait_for_ready
{

typedef rt_wait_for_readyRequest Request;
typedef rt_wait_for_readyResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct rt_wait_for_ready
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::rt_wait_for_ready > {
  static const char* value()
  {
    return "985b321a02883643c59c6d43bcb5063f";
  }

  static const char* value(const ::deepbuilder::rt_wait_for_ready&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::rt_wait_for_ready > {
  static const char* value()
  {
    return "deepbuilder/rt_wait_for_ready";
  }

  static const char* value(const ::deepbuilder::rt_wait_for_ready&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::rt_wait_for_readyRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::rt_wait_for_ready > 
template<>
struct MD5Sum< ::deepbuilder::rt_wait_for_readyRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::rt_wait_for_ready >::value();
  }
  static const char* value(const ::deepbuilder::rt_wait_for_readyRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::rt_wait_for_readyRequest> should match 
// service_traits::DataType< ::deepbuilder::rt_wait_for_ready > 
template<>
struct DataType< ::deepbuilder::rt_wait_for_readyRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::rt_wait_for_ready >::value();
  }
  static const char* value(const ::deepbuilder::rt_wait_for_readyRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::rt_wait_for_readyResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::rt_wait_for_ready > 
template<>
struct MD5Sum< ::deepbuilder::rt_wait_for_readyResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::rt_wait_for_ready >::value();
  }
  static const char* value(const ::deepbuilder::rt_wait_for_readyResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::rt_wait_for_readyResponse> should match 
// service_traits::DataType< ::deepbuilder::rt_wait_for_ready > 
template<>
struct DataType< ::deepbuilder::rt_wait_for_readyResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::rt_wait_for_ready >::value();
  }
  static const char* value(const ::deepbuilder::rt_wait_for_readyResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_RT_WAIT_FOR_READY_H
