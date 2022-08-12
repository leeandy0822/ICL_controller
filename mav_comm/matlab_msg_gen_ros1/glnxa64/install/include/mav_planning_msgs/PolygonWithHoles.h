// Generated by gencpp from file mav_planning_msgs/PolygonWithHoles.msg
// DO NOT EDIT!


#ifndef MAV_PLANNING_MSGS_MESSAGE_POLYGONWITHHOLES_H
#define MAV_PLANNING_MSGS_MESSAGE_POLYGONWITHHOLES_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <mav_planning_msgs/Polygon2D.h>
#include <mav_planning_msgs/Polygon2D.h>

namespace mav_planning_msgs
{
template <class ContainerAllocator>
struct PolygonWithHoles_
{
  typedef PolygonWithHoles_<ContainerAllocator> Type;

  PolygonWithHoles_()
    : hull()
    , holes()  {
    }
  PolygonWithHoles_(const ContainerAllocator& _alloc)
    : hull(_alloc)
    , holes(_alloc)  {
  (void)_alloc;
    }



   typedef  ::mav_planning_msgs::Polygon2D_<ContainerAllocator>  _hull_type;
  _hull_type hull;

   typedef std::vector< ::mav_planning_msgs::Polygon2D_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::mav_planning_msgs::Polygon2D_<ContainerAllocator> >::other >  _holes_type;
  _holes_type holes;





  typedef boost::shared_ptr< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> const> ConstPtr;

}; // struct PolygonWithHoles_

typedef ::mav_planning_msgs::PolygonWithHoles_<std::allocator<void> > PolygonWithHoles;

typedef boost::shared_ptr< ::mav_planning_msgs::PolygonWithHoles > PolygonWithHolesPtr;
typedef boost::shared_ptr< ::mav_planning_msgs::PolygonWithHoles const> PolygonWithHolesConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace mav_planning_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'mav_planning_msgs': ['/home/leeandy/Desktop/ICL_controller/mav_comm/matlab_msg_gen_ros1/glnxa64/src/mav_planning_msgs/msg'], 'geometry_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/geometry_msgs/cmake/../msg'], 'trajectory_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg', '/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/home/leeandy/MATLAB/sys/ros1/glnxa64/ros1/share/sensor_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
{
  static const char* value()
  {
    return "df7f266352dfcf3e4d29156dd85febf9";
  }

  static const char* value(const ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdf7f266352dfcf3eULL;
  static const uint64_t static_value2 = 0x4d29156dd85febf9ULL;
};

template<class ContainerAllocator>
struct DataType< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mav_planning_msgs/PolygonWithHoles";
  }

  static const char* value(const ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# A message to define a 2D polygon with holes.\n"
"mav_planning_msgs/Polygon2D hull\n"
"mav_planning_msgs/Polygon2D[] holes\n"
"\n"
"================================================================================\n"
"MSG: mav_planning_msgs/Polygon2D\n"
"# A specification of a 2D polygon where the first and last points are assumed to be connected.\n"
"mav_planning_msgs/Point2D[] points\n"
"\n"
"================================================================================\n"
"MSG: mav_planning_msgs/Point2D\n"
"# This contains the position of a 2D point.\n"
"float64 x\n"
"float64 y\n"
;
  }

  static const char* value(const ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.hull);
      stream.next(m.holes);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PolygonWithHoles_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mav_planning_msgs::PolygonWithHoles_<ContainerAllocator>& v)
  {
    s << indent << "hull: ";
    s << std::endl;
    Printer< ::mav_planning_msgs::Polygon2D_<ContainerAllocator> >::stream(s, indent + "  ", v.hull);
    s << indent << "holes[]" << std::endl;
    for (size_t i = 0; i < v.holes.size(); ++i)
    {
      s << indent << "  holes[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::mav_planning_msgs::Polygon2D_<ContainerAllocator> >::stream(s, indent + "    ", v.holes[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAV_PLANNING_MSGS_MESSAGE_POLYGONWITHHOLES_H
