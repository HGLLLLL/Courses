// Generated by gencpp from file ball_detect/BoundingBoxArray.msg
// DO NOT EDIT!


#ifndef BALL_DETECT_MESSAGE_BOUNDINGBOXARRAY_H
#define BALL_DETECT_MESSAGE_BOUNDINGBOXARRAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <ball_detect/BoundingBox.h>

namespace ball_detect
{
template <class ContainerAllocator>
struct BoundingBoxArray_
{
  typedef BoundingBoxArray_<ContainerAllocator> Type;

  BoundingBoxArray_()
    : header()
    , bounding_boxes()  {
    }
  BoundingBoxArray_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , bounding_boxes(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::ball_detect::BoundingBox_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::ball_detect::BoundingBox_<ContainerAllocator> >> _bounding_boxes_type;
  _bounding_boxes_type bounding_boxes;





  typedef boost::shared_ptr< ::ball_detect::BoundingBoxArray_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ball_detect::BoundingBoxArray_<ContainerAllocator> const> ConstPtr;

}; // struct BoundingBoxArray_

typedef ::ball_detect::BoundingBoxArray_<std::allocator<void> > BoundingBoxArray;

typedef boost::shared_ptr< ::ball_detect::BoundingBoxArray > BoundingBoxArrayPtr;
typedef boost::shared_ptr< ::ball_detect::BoundingBoxArray const> BoundingBoxArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ball_detect::BoundingBoxArray_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ball_detect::BoundingBoxArray_<ContainerAllocator1> & lhs, const ::ball_detect::BoundingBoxArray_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.bounding_boxes == rhs.bounding_boxes;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ball_detect::BoundingBoxArray_<ContainerAllocator1> & lhs, const ::ball_detect::BoundingBoxArray_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ball_detect

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ball_detect::BoundingBoxArray_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ball_detect::BoundingBoxArray_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ball_detect::BoundingBoxArray_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "10d92d3fbeeda5f8ba80518596202d8b";
  }

  static const char* value(const ::ball_detect::BoundingBoxArray_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x10d92d3fbeeda5f8ULL;
  static const uint64_t static_value2 = 0xba80518596202d8bULL;
};

template<class ContainerAllocator>
struct DataType< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ball_detect/BoundingBoxArray";
  }

  static const char* value(const ::ball_detect::BoundingBoxArray_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"BoundingBox[] bounding_boxes\n"
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
"MSG: ball_detect/BoundingBox\n"
"float32 x\n"
"float32 y\n"
"float32 w\n"
"float32 h\n"
"string bbox_class\n"
"float32 confidence\n"
"\n"
"\n"
;
  }

  static const char* value(const ::ball_detect::BoundingBoxArray_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.bounding_boxes);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BoundingBoxArray_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ball_detect::BoundingBoxArray_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ball_detect::BoundingBoxArray_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "bounding_boxes[]" << std::endl;
    for (size_t i = 0; i < v.bounding_boxes.size(); ++i)
    {
      s << indent << "  bounding_boxes[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::ball_detect::BoundingBox_<ContainerAllocator> >::stream(s, indent + "    ", v.bounding_boxes[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BALL_DETECT_MESSAGE_BOUNDINGBOXARRAY_H
