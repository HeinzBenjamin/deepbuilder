// Generated by gencpp from file deepbuilder/tc_read.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_TC_READ_H
#define DEEPBUILDER_MESSAGE_TC_READ_H

#include <ros/service_traits.h>


#include <deepbuilder/tc_readRequest.h>
#include <deepbuilder/tc_readResponse.h>


namespace deepbuilder
{

struct tc_read
{

typedef tc_readRequest Request;
typedef tc_readResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct tc_read
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::tc_read > {
  static const char* value()
  {
    return "7848c669d219de11243ab460d9130d88";
  }

  static const char* value(const ::deepbuilder::tc_read&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::tc_read > {
  static const char* value()
  {
    return "deepbuilder/tc_read";
  }

  static const char* value(const ::deepbuilder::tc_read&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::tc_readRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::tc_read > 
template<>
struct MD5Sum< ::deepbuilder::tc_readRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::tc_read >::value();
  }
  static const char* value(const ::deepbuilder::tc_readRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::tc_readRequest> should match 
// service_traits::DataType< ::deepbuilder::tc_read > 
template<>
struct DataType< ::deepbuilder::tc_readRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::tc_read >::value();
  }
  static const char* value(const ::deepbuilder::tc_readRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::tc_readResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::tc_read > 
template<>
struct MD5Sum< ::deepbuilder::tc_readResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::tc_read >::value();
  }
  static const char* value(const ::deepbuilder::tc_readResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::tc_readResponse> should match 
// service_traits::DataType< ::deepbuilder::tc_read > 
template<>
struct DataType< ::deepbuilder::tc_readResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::tc_read >::value();
  }
  static const char* value(const ::deepbuilder::tc_readResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_TC_READ_H