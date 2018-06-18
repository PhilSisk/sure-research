// Generated by gencpp from file rctestpkg/TestTalkerMsg.msg
// DO NOT EDIT!


#ifndef RCTESTPKG_MESSAGE_TESTTALKERMSG_H
#define RCTESTPKG_MESSAGE_TESTTALKERMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rctestpkg
{
template <class ContainerAllocator>
struct TestTalkerMsg_
{
  typedef TestTalkerMsg_<ContainerAllocator> Type;

  TestTalkerMsg_()
    : TestTalkerString()
    , TestTalkerInt(0)  {
    }
  TestTalkerMsg_(const ContainerAllocator& _alloc)
    : TestTalkerString(_alloc)
    , TestTalkerInt(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _TestTalkerString_type;
  _TestTalkerString_type TestTalkerString;

   typedef int64_t _TestTalkerInt_type;
  _TestTalkerInt_type TestTalkerInt;




  typedef boost::shared_ptr< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> const> ConstPtr;

}; // struct TestTalkerMsg_

typedef ::rctestpkg::TestTalkerMsg_<std::allocator<void> > TestTalkerMsg;

typedef boost::shared_ptr< ::rctestpkg::TestTalkerMsg > TestTalkerMsgPtr;
typedef boost::shared_ptr< ::rctestpkg::TestTalkerMsg const> TestTalkerMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rctestpkg::TestTalkerMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rctestpkg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'rctestpkg': ['/home/ubuntu/phil_catkin_ws/src/rctestpkg/msg'], 'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f02eee63b61a8f52d495bcf6a0b81c9a";
  }

  static const char* value(const ::rctestpkg::TestTalkerMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf02eee63b61a8f52ULL;
  static const uint64_t static_value2 = 0xd495bcf6a0b81c9aULL;
};

template<class ContainerAllocator>
struct DataType< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rctestpkg/TestTalkerMsg";
  }

  static const char* value(const ::rctestpkg::TestTalkerMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string TestTalkerString\n\
int64 TestTalkerInt\n\
";
  }

  static const char* value(const ::rctestpkg::TestTalkerMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.TestTalkerString);
      stream.next(m.TestTalkerInt);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TestTalkerMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rctestpkg::TestTalkerMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rctestpkg::TestTalkerMsg_<ContainerAllocator>& v)
  {
    s << indent << "TestTalkerString: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.TestTalkerString);
    s << indent << "TestTalkerInt: ";
    Printer<int64_t>::stream(s, indent + "  ", v.TestTalkerInt);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RCTESTPKG_MESSAGE_TESTTALKERMSG_H
