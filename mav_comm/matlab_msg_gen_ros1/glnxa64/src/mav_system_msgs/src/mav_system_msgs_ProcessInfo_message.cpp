// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_system_msgs/ProcessInfo
#include "boost/date_time.hpp"
#include "boost/shared_array.hpp"
#ifdef _MSC_VER
#pragma warning(push)
#pragma warning(disable : 4244)
#pragma warning(disable : 4265)
#pragma warning(disable : 4458)
#pragma warning(disable : 4100)
#pragma warning(disable : 4127)
#pragma warning(disable : 4267)
#pragma warning(disable : 4068)
#pragma warning(disable : 4245)
#else
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wpedantic"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wredundant-decls"
#pragma GCC diagnostic ignored "-Wnon-virtual-dtor"
#pragma GCC diagnostic ignored "-Wdelete-non-virtual-dtor"
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wshadow"
#endif //_MSC_VER
#include "ros/ros.h"
#include "mav_system_msgs/ProcessInfo.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_SYSTEM_MSGS_EXPORT mav_system_msgs_msg_ProcessInfo_common : public MATLABROSMsgInterface<mav_system_msgs::ProcessInfo> {
  public:
    virtual ~mav_system_msgs_msg_ProcessInfo_common(){}
    virtual void copy_from_struct(mav_system_msgs::ProcessInfo* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_system_msgs::ProcessInfo* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_system_msgs_msg_ProcessInfo_common::copy_from_struct(mav_system_msgs::ProcessInfo* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //pid
        const matlab::data::TypedArray<uint32_t> pid_arr = arr["Pid"];
        msg->pid = pid_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Pid' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Pid' is wrong type; expected a uint32.");
    }
    try {
        //name
        const matlab::data::CharArray name_arr = arr["Name"];
        msg->name = name_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Name' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Name' is wrong type; expected a string.");
    }
    try {
        //username
        const matlab::data::CharArray username_arr = arr["Username"];
        msg->username = username_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Username' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Username' is wrong type; expected a string.");
    }
    try {
        //cpu_percent
        const matlab::data::TypedArray<float> cpu_percent_arr = arr["CpuPercent"];
        msg->cpu_percent = cpu_percent_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'CpuPercent' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'CpuPercent' is wrong type; expected a single.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_system_msgs_msg_ProcessInfo_common::get_arr(MDFactory_T& factory, const mav_system_msgs::ProcessInfo* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Pid","Name","Username","CpuPercent"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_system_msgs/ProcessInfo");
    // pid
    auto currentElement_pid = (msg + ctr)->pid;
    outArray[ctr]["Pid"] = factory.createScalar(currentElement_pid);
    // name
    auto currentElement_name = (msg + ctr)->name;
    outArray[ctr]["Name"] = factory.createCharArray(currentElement_name);
    // username
    auto currentElement_username = (msg + ctr)->username;
    outArray[ctr]["Username"] = factory.createCharArray(currentElement_username);
    // cpu_percent
    auto currentElement_cpu_percent = (msg + ctr)->cpu_percent;
    outArray[ctr]["CpuPercent"] = factory.createScalar(currentElement_cpu_percent);
    }
    return std::move(outArray);
  } 
class MAV_SYSTEM_MSGS_EXPORT mav_system_msgs_ProcessInfo_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_system_msgs_ProcessInfo_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_system_msgs_ProcessInfo_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_system_msgs::ProcessInfo,mav_system_msgs_msg_ProcessInfo_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_system_msgs_ProcessInfo_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_system_msgs::ProcessInfo,mav_system_msgs::ProcessInfo::ConstPtr,mav_system_msgs_msg_ProcessInfo_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_system_msgs_ProcessInfo_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_system_msgs::ProcessInfo,mav_system_msgs_msg_ProcessInfo_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_system_msgs_msg_ProcessInfo_common, MATLABROSMsgInterface<mav_system_msgs::ProcessInfo>)
CLASS_LOADER_REGISTER_CLASS(mav_system_msgs_ProcessInfo_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1