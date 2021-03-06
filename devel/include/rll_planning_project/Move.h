// Generated by gencpp from file rll_planning_project/Move.msg
// DO NOT EDIT!


#ifndef RLL_PLANNING_PROJECT_MESSAGE_MOVE_H
#define RLL_PLANNING_PROJECT_MESSAGE_MOVE_H

#include <ros/service_traits.h>


#include <rll_planning_project/MoveRequest.h>
#include <rll_planning_project/MoveResponse.h>


namespace rll_planning_project
{

struct Move
{

typedef MoveRequest Request;
typedef MoveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct Move
} // namespace rll_planning_project


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::rll_planning_project::Move > {
  static const char* value()
  {
    return "cfc42ebcb6ac1e961d822c446b9526a0";
  }

  static const char* value(const ::rll_planning_project::Move&) { return value(); }
};

template<>
struct DataType< ::rll_planning_project::Move > {
  static const char* value()
  {
    return "rll_planning_project/Move";
  }

  static const char* value(const ::rll_planning_project::Move&) { return value(); }
};


// service_traits::MD5Sum< ::rll_planning_project::MoveRequest> should match 
// service_traits::MD5Sum< ::rll_planning_project::Move > 
template<>
struct MD5Sum< ::rll_planning_project::MoveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::rll_planning_project::Move >::value();
  }
  static const char* value(const ::rll_planning_project::MoveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::rll_planning_project::MoveRequest> should match 
// service_traits::DataType< ::rll_planning_project::Move > 
template<>
struct DataType< ::rll_planning_project::MoveRequest>
{
  static const char* value()
  {
    return DataType< ::rll_planning_project::Move >::value();
  }
  static const char* value(const ::rll_planning_project::MoveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::rll_planning_project::MoveResponse> should match 
// service_traits::MD5Sum< ::rll_planning_project::Move > 
template<>
struct MD5Sum< ::rll_planning_project::MoveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::rll_planning_project::Move >::value();
  }
  static const char* value(const ::rll_planning_project::MoveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::rll_planning_project::MoveResponse> should match 
// service_traits::DataType< ::rll_planning_project::Move > 
template<>
struct DataType< ::rll_planning_project::MoveResponse>
{
  static const char* value()
  {
    return DataType< ::rll_planning_project::Move >::value();
  }
  static const char* value(const ::rll_planning_project::MoveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // RLL_PLANNING_PROJECT_MESSAGE_MOVE_H
