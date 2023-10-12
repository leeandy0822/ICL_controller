#ifndef MAV_PLANNING_MSGS__VISIBILITY_CONTROL_H_
#define MAV_PLANNING_MSGS__VISIBILITY_CONTROL_H_
#if defined _WIN32 || defined __CYGWIN__
  #ifdef __GNUC__
    #define MAV_PLANNING_MSGS_EXPORT __attribute__ ((dllexport))
    #define MAV_PLANNING_MSGS_IMPORT __attribute__ ((dllimport))
  #else
    #define MAV_PLANNING_MSGS_EXPORT __declspec(dllexport)
    #define MAV_PLANNING_MSGS_IMPORT __declspec(dllimport)
  #endif
  #ifdef MAV_PLANNING_MSGS_BUILDING_LIBRARY
    #define MAV_PLANNING_MSGS_PUBLIC MAV_PLANNING_MSGS_EXPORT
  #else
    #define MAV_PLANNING_MSGS_PUBLIC MAV_PLANNING_MSGS_IMPORT
  #endif
  #define MAV_PLANNING_MSGS_PUBLIC_TYPE MAV_PLANNING_MSGS_PUBLIC
  #define MAV_PLANNING_MSGS_LOCAL
#else
  #define MAV_PLANNING_MSGS_EXPORT __attribute__ ((visibility("default")))
  #define MAV_PLANNING_MSGS_IMPORT
  #if __GNUC__ >= 4
    #define MAV_PLANNING_MSGS_PUBLIC __attribute__ ((visibility("default")))
    #define MAV_PLANNING_MSGS_LOCAL  __attribute__ ((visibility("hidden")))
  #else
    #define MAV_PLANNING_MSGS_PUBLIC
    #define MAV_PLANNING_MSGS_LOCAL
  #endif
  #define MAV_PLANNING_MSGS_PUBLIC_TYPE
#endif
#endif  // MAV_PLANNING_MSGS__VISIBILITY_CONTROL_H_
// Generated 12-Oct-2023 15:57:50
// Copyright 2019-2020 The MathWorks, Inc.
