// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_state_machine_msgs/StartStopTask
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
#include "mav_state_machine_msgs/StartStopTask.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_STATE_MACHINE_MSGS_EXPORT mav_state_machine_msgs_msg_StartStopTask_common : public MATLABROSMsgInterface<mav_state_machine_msgs::StartStopTask> {
  public:
    virtual ~mav_state_machine_msgs_msg_StartStopTask_common(){}
    virtual void copy_from_struct(mav_state_machine_msgs::StartStopTask* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_state_machine_msgs::StartStopTask* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_state_machine_msgs_msg_StartStopTask_common::copy_from_struct(mav_state_machine_msgs::StartStopTask* msg, const matlab::data::Struct& arr,
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
        //task_name
        const matlab::data::CharArray task_name_arr = arr["TaskName"];
        msg->task_name = task_name_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'TaskName' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'TaskName' is wrong type; expected a string.");
    }
    try {
        //start
        const matlab::data::TypedArray<bool> start_arr = arr["Start"];
        msg->start = start_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Start' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Start' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_state_machine_msgs_msg_StartStopTask_common::get_arr(MDFactory_T& factory, const mav_state_machine_msgs::StartStopTask* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","TaskName","Start"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_state_machine_msgs/StartStopTask");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // task_name
    auto currentElement_task_name = (msg + ctr)->task_name;
    outArray[ctr]["TaskName"] = factory.createCharArray(currentElement_task_name);
    // start
    auto currentElement_start = (msg + ctr)->start;
    outArray[ctr]["Start"] = factory.createScalar(static_cast<bool>(currentElement_start));
    }
    return std::move(outArray);
  } 
class MAV_STATE_MACHINE_MSGS_EXPORT mav_state_machine_msgs_StartStopTask_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_state_machine_msgs_StartStopTask_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_state_machine_msgs_StartStopTask_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_state_machine_msgs::StartStopTask,mav_state_machine_msgs_msg_StartStopTask_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_state_machine_msgs_StartStopTask_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_state_machine_msgs::StartStopTask,mav_state_machine_msgs::StartStopTask::ConstPtr,mav_state_machine_msgs_msg_StartStopTask_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_state_machine_msgs_StartStopTask_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_state_machine_msgs::StartStopTask,mav_state_machine_msgs_msg_StartStopTask_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_state_machine_msgs_msg_StartStopTask_common, MATLABROSMsgInterface<mav_state_machine_msgs::StartStopTask>)
CLASS_LOADER_REGISTER_CLASS(mav_state_machine_msgs_StartStopTask_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1