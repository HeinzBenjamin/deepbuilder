// Generated by gencpp from file deepbuilder/tc_write.msg
// DO NOT EDIT!


#ifndef DEEPBUILDER_MESSAGE_TC_WRITE_H
#define DEEPBUILDER_MESSAGE_TC_WRITE_H

#include <ros/service_traits.h>


#include <deepbuilder/tc_writeRequest.h>
#include <deepbuilder/tc_writeResponse.h>


namespace deepbuilder
{

struct tc_write
{

typedef tc_writeRequest Request;
typedef tc_writeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct tc_write
} // namespace deepbuilder


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::deepbuilder::tc_write > {
  static const char* value()
  {
    return "93beb009a54ccf54fefb5b85020d0e0d";
  }

  static const char* value(const ::deepbuilder::tc_write&) { return value(); }
};

template<>
struct DataType< ::deepbuilder::tc_write > {
  static const char* value()
  {
    return "deepbuilder/tc_write";
  }

  static const char* value(const ::deepbuilder::tc_write&) { return value(); }
};


// service_traits::MD5Sum< ::deepbuilder::tc_writeRequest> should match 
// service_traits::MD5Sum< ::deepbuilder::tc_write > 
template<>
struct MD5Sum< ::deepbuilder::tc_writeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::tc_write >::value();
  }
  static const char* value(const ::deepbuilder::tc_writeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::tc_writeRequest> should match 
// service_traits::DataType< ::deepbuilder::tc_write > 
template<>
struct DataType< ::deepbuilder::tc_writeRequest>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::tc_write >::value();
  }
  static const char* value(const ::deepbuilder::tc_writeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::deepbuilder::tc_writeResponse> should match 
// service_traits::MD5Sum< ::deepbuilder::tc_write > 
template<>
struct MD5Sum< ::deepbuilder::tc_writeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::deepbuilder::tc_write >::value();
  }
  static const char* value(const ::deepbuilder::tc_writeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::deepbuilder::tc_writeResponse> should match 
// service_traits::DataType< ::deepbuilder::tc_write > 
template<>
struct DataType< ::deepbuilder::tc_writeResponse>
{
  static const char* value()
  {
    return DataType< ::deepbuilder::tc_write >::value();
  }
  static const char* value(const ::deepbuilder::tc_writeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // DEEPBUILDER_MESSAGE_TC_WRITE_H
