// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_system_msgs/CpuInfo
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
#include "mav_system_msgs/CpuInfo.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_SYSTEM_MSGS_EXPORT mav_system_msgs_msg_CpuInfo_common : public MATLABROSMsgInterface<mav_system_msgs::CpuInfo> {
  public:
    virtual ~mav_system_msgs_msg_CpuInfo_common(){}
    virtual void copy_from_struct(mav_system_msgs::CpuInfo* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_system_msgs::CpuInfo* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_system_msgs_msg_CpuInfo_common::copy_from_struct(mav_system_msgs::CpuInfo* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //header
        const matlab::data::StructArray header_arr = arr["Header"];
        auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
        msgClassPtr_header->copy_from_struct(&msg->header,header_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Header' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Header' is wrong type; expected a struct.");
    }
    try {
        //cpu_percent
        const matlab::data::TypedArray<float> cpu_percent_arr = arr["CpuPercent"];
        size_t nelem = cpu_percent_arr.getNumberOfElements();
        	msg->cpu_percent.resize(nelem);
        	std::copy(cpu_percent_arr.begin(), cpu_percent_arr.begin()+nelem, msg->cpu_percent.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'CpuPercent' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'CpuPercent' is wrong type; expected a single.");
    }
    try {
        //heaviest_processes
        const matlab::data::StructArray heaviest_processes_arr = arr["HeaviestProcesses"];
        for (auto _heaviest_processesarr : heaviest_processes_arr) {
        	mav_system_msgs::ProcessInfo _val;
        auto msgClassPtr_heaviest_processes = getCommonObject<mav_system_msgs::ProcessInfo>("mav_system_msgs_msg_ProcessInfo_common",loader);
        msgClassPtr_heaviest_processes->copy_from_struct(&_val,_heaviest_processesarr,loader);
        	msg->heaviest_processes.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'HeaviestProcesses' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'HeaviestProcesses' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_system_msgs_msg_CpuInfo_common::get_arr(MDFactory_T& factory, const mav_system_msgs::CpuInfo* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","CpuPercent","HeaviestProcesses"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_system_msgs/CpuInfo");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // cpu_percent
    auto currentElement_cpu_percent = (msg + ctr)->cpu_percent;
    outArray[ctr]["CpuPercent"] = factory.createArray<mav_system_msgs::CpuInfo::_cpu_percent_type::const_iterator, float>({currentElement_cpu_percent.size(),1}, currentElement_cpu_percent.begin(), currentElement_cpu_percent.end());
    // heaviest_processes
    auto currentElement_heaviest_processes = (msg + ctr)->heaviest_processes;
    auto msgClassPtr_heaviest_processes = getCommonObject<mav_system_msgs::ProcessInfo>("mav_system_msgs_msg_ProcessInfo_common",loader);
    outArray[ctr]["HeaviestProcesses"] = msgClassPtr_heaviest_processes->get_arr(factory,&currentElement_heaviest_processes[0],loader,currentElement_heaviest_processes.size());
    }
    return std::move(outArray);
  } 
class MAV_SYSTEM_MSGS_EXPORT mav_system_msgs_CpuInfo_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_system_msgs_CpuInfo_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_system_msgs_CpuInfo_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_system_msgs::CpuInfo,mav_system_msgs_msg_CpuInfo_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_system_msgs_CpuInfo_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_system_msgs::CpuInfo,mav_system_msgs::CpuInfo::ConstPtr,mav_system_msgs_msg_CpuInfo_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_system_msgs_CpuInfo_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_system_msgs::CpuInfo,mav_system_msgs_msg_CpuInfo_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_system_msgs_msg_CpuInfo_common, MATLABROSMsgInterface<mav_system_msgs::CpuInfo>)
CLASS_LOADER_REGISTER_CLASS(mav_system_msgs_CpuInfo_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1