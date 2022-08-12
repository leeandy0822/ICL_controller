// Generated by gencpp from file mav_system_msgs/CpuInfo.msg
// DO NOT EDIT!


#ifndef MAV_SYSTEM_MSGS_MESSAGE_CPUINFO_H
#define MAV_SYSTEM_MSGS_MESSAGE_CPUINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <mav_system_msgs/ProcessInfo.h>

namespace mav_system_msgs
{
template <class ContainerAllocator>
struct CpuInfo_
{
  typedef CpuInfo_<ContainerAllocator> Type;

  CpuInfo_()
    : header()
    , cpu_percent()
    , heaviest_processes()  {
    }
  CpuInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , cpu_percent(_alloc)
    , heaviest_processes(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _cpu_percent_type;
  _cpu_percent_type cpu_percent;

   typedef std::vector< ::mav_system_msgs::ProcessInfo_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::mav_system_msgs::ProcessInfo_<ContainerAllocator> >::other >  _heaviest_processes_type;
  _heaviest_processes_type heaviest_processes;





  typedef boost::shared_ptr< ::mav_system_msgs::CpuInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_system_msgs::CpuInfo_<ContainerAllocator> const> ConstPtr;

}; // struct CpuInfo_

typedef ::mav_system_msgs::CpuInfo_<std::allocator<void> > CpuInfo;

typedef boost::shared_ptr< ::mav_system_msgs::CpuInfo > CpuInfoPtr;
typedef boost::shared_ptr< ::mav_system_msgs::CpuInfo const> CpuInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_system_msgs::CpuInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mav_system_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg', '/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg'], 'mav_system_msgs': ['/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_system_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_system_msgs::CpuInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_system_msgs::CpuInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_system_msgs::CpuInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d955ed6c182adaafbfa41e78710954d2";
  }

  static const char* value(const ::mav_system_msgs::CpuInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd955ed6c182adaafULL;
  static const uint64_t static_value2 = 0xbfa41e78710954d2ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_system_msgs/CpuInfo";
  }

  static const char* value(const ::mav_system_msgs::CpuInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Miscellaneous information about CPU status.\n"
"# Written by Marco Tranzatto (see: https://github.com/ethz-asl/mav_eurathlon/blob/master/mav_eurathlon_msgs/msg/CpuInfo.msg)\n"
"\n"
"Header header\n"
"\n"
"float32[] cpu_percent               # Current system-wide CPU utilization as a percentage, per CPU.\n"
"ProcessInfo[] heaviest_processes    # Info about heaviest running processes.\n"
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
"MSG: mav_system_msgs/ProcessInfo\n"
"# Miscellaneous information about process status.\n"
"# Written by Marco Tranzatto (see: https://github.com/ethz-asl/mav_eurathlon/blob/master/mav_eurathlon_msgs/msg/ProcessInfo.msg)\n"
"\n"
"uint32 pid              # Process PID\n"
"string name             # Process name\n"
"string username         # Name of the user that owns the process\n"
"float32 cpu_percent     # Process CPU utilization as a percentage\n"
;
  }

  static const char* value(const ::mav_system_msgs::CpuInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.cpu_percent);
      stream.next(m.heaviest_processes);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CpuInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_system_msgs::CpuInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_system_msgs::CpuInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "cpu_percent[]" << std::endl;
    for (size_t i = 0; i < v.cpu_percent.size(); ++i)
    {
      s << indent << "  cpu_percent[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.cpu_percent[i]);
    }
    s << indent << "heaviest_processes[]" << std::endl;
    for (size_t i = 0; i < v.heaviest_processes.size(); ++i)
    {
      s << indent << "  heaviest_processes[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::mav_system_msgs::ProcessInfo_<ContainerAllocator> >::stream(s, indent + "    ", v.heaviest_processes[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_SYSTEM_MSGS_MESSAGE_CPUINFO_H
