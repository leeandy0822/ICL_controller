// Generated by gencpp from file mav_msgs/RollPitchYawrateThrust.msg
// DO NOT EDIT!


#ifndef MAV_MSGS_MESSAGE_ROLLPITCHYAWRATETHRUST_H
#define MAV_MSGS_MESSAGE_ROLLPITCHYAWRATETHRUST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Vector3.h>

namespace mav_msgs
{
template <class ContainerAllocator>
struct RollPitchYawrateThrust_
{
  typedef RollPitchYawrateThrust_<ContainerAllocator> Type;

  RollPitchYawrateThrust_()
    : header()
    , roll(0.0)
    , pitch(0.0)
    , yaw_rate(0.0)
    , thrust()  {
    }
  RollPitchYawrateThrust_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , roll(0.0)
    , pitch(0.0)
    , yaw_rate(0.0)
    , thrust(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _roll_type;
  _roll_type roll;

   typedef double _pitch_type;
  _pitch_type pitch;

   typedef double _yaw_rate_type;
  _yaw_rate_type yaw_rate;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _thrust_type;
  _thrust_type thrust;





  typedef boost::shared_ptr< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> const> ConstPtr;

}; // struct RollPitchYawrateThrust_

typedef ::mav_msgs::RollPitchYawrateThrust_<std::allocator<void> > RollPitchYawrateThrust;

typedef boost::shared_ptr< ::mav_msgs::RollPitchYawrateThrust > RollPitchYawrateThrustPtr;
typedef boost::shared_ptr< ::mav_msgs::RollPitchYawrateThrust const> RollPitchYawrateThrustConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mav_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg', '/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg'], 'mav_msgs': ['/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
{
  static const char* value()
  {
    return "10a56a30857affade0889a3662fc2bc9";
  }

  static const char* value(const ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x10a56a30857affadULL;
  static const uint64_t static_value2 = 0xe0889a3662fc2bc9ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_msgs/RollPitchYawrateThrust";
  }

  static const char* value(const ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"\n"
"# We use the coordinate frames with the following convention:\n"
"#   x: forward\n"
"#   y: left\n"
"#   z: up\n"
"\n"
"# rotation convention (z-y'-x''):\n"
"# yaw rotates around fixed frame's z axis\n"
"# pitch rotates around new y-axis (y')\n"
"# roll rotates around new x-axis (x'')\n"
"\n"
"# This is a convenience-message to support that low-level (microcontroller-based) state\n"
"# estimators may not have knowledge about the absolute yaw.\n"
"# Roll- and pitch-angle should be specified in the header/frame_id frame\n"
"float64 roll                   # Roll angle [rad]\n"
"float64 pitch                  # Pitch angle  [rad]\n"
"float64 yaw_rate               # Yaw rate around z-axis [rad/s]\n"
"\n"
"geometry_msgs/Vector3 thrust   # Thrust [N] expressed in the body frame.\n"
"                               # For a fixed-wing, usually the x-component is used.\n"
"                               # For a multi-rotor, usually the z-component is used.\n"
"                               # Set all un-used components to 0.\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.roll);
      stream.next(m.pitch);
      stream.next(m.yaw_rate);
      stream.next(m.thrust);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RollPitchYawrateThrust_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_msgs::RollPitchYawrateThrust_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "roll: ";
    Printer<double>::stream(s, indent + "  ", v.roll);
    s << indent << "pitch: ";
    Printer<double>::stream(s, indent + "  ", v.pitch);
    s << indent << "yaw_rate: ";
    Printer<double>::stream(s, indent + "  ", v.yaw_rate);
    s << indent << "thrust: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.thrust);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_MSGS_MESSAGE_ROLLPITCHYAWRATETHRUST_H
