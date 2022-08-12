// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_state_machine_msgs/RunTaskServiceRequest
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
#include "mav_state_machine_msgs/RunTaskService.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class MAV_STATE_MACHINE_MSGS_EXPORT mav_state_machine_msgs_msg_RunTaskServiceRequest_common : public MATLABROSMsgInterface<mav_state_machine_msgs::RunTaskService::Request> {
  public:
    virtual ~mav_state_machine_msgs_msg_RunTaskServiceRequest_common(){}
    virtual void copy_from_struct(mav_state_machine_msgs::RunTaskService::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_state_machine_msgs::RunTaskService::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_state_machine_msgs_msg_RunTaskServiceRequest_common::copy_from_struct(mav_state_machine_msgs::RunTaskService::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
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
  MDArray_T mav_state_machine_msgs_msg_RunTaskServiceRequest_common::get_arr(MDFactory_T& factory, const mav_state_machine_msgs::RunTaskService::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","TaskName","Start"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_state_machine_msgs/RunTaskServiceRequest");
    // task_name
    auto currentElement_task_name = (msg + ctr)->task_name;
    outArray[ctr]["TaskName"] = factory.createCharArray(currentElement_task_name);
    // start
    auto currentElement_start = (msg + ctr)->start;
    outArray[ctr]["Start"] = factory.createScalar(static_cast<bool>(currentElement_start));
    }
    return std::move(outArray);
  }
class MAV_STATE_MACHINE_MSGS_EXPORT mav_state_machine_msgs_msg_RunTaskServiceResponse_common : public MATLABROSMsgInterface<mav_state_machine_msgs::RunTaskService::Response> {
  public:
    virtual ~mav_state_machine_msgs_msg_RunTaskServiceResponse_common(){}
    virtual void copy_from_struct(mav_state_machine_msgs::RunTaskService::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_state_machine_msgs::RunTaskService::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_state_machine_msgs_msg_RunTaskServiceResponse_common::copy_from_struct(mav_state_machine_msgs::RunTaskService::Response* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //success
        const matlab::data::TypedArray<bool> success_arr = arr["Success"];
        msg->success = success_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Success' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Success' is wrong type; expected a logical.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_state_machine_msgs_msg_RunTaskServiceResponse_common::get_arr(MDFactory_T& factory, const mav_state_machine_msgs::RunTaskService::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Success"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_state_machine_msgs/RunTaskServiceResponse");
    // success
    auto currentElement_success = (msg + ctr)->success;
    outArray[ctr]["Success"] = factory.createScalar(static_cast<bool>(currentElement_success));
    }
    return std::move(outArray);
  } 
class MAV_STATE_MACHINE_MSGS_EXPORT mav_state_machine_msgs_RunTaskService_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_state_machine_msgs_RunTaskService_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_state_machine_msgs_RunTaskService_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<mav_state_machine_msgs::RunTaskService::Request,mav_state_machine_msgs_msg_RunTaskServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<mav_state_machine_msgs::RunTaskService::Response,mav_state_machine_msgs_msg_RunTaskServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          mav_state_machine_msgs_RunTaskService_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<mav_state_machine_msgs::RunTaskService::Request,mav_state_machine_msgs::RunTaskService::Request::ConstPtr,mav_state_machine_msgs_msg_RunTaskServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<mav_state_machine_msgs::RunTaskService::Response,mav_state_machine_msgs::RunTaskService::Response::ConstPtr,mav_state_machine_msgs_msg_RunTaskServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          mav_state_machine_msgs_RunTaskService_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<mav_state_machine_msgs::RunTaskService::Request,mav_state_machine_msgs::RunTaskService::Response,mav_state_machine_msgs_msg_RunTaskServiceRequest_common,mav_state_machine_msgs_msg_RunTaskServiceResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          mav_state_machine_msgs_RunTaskService_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<mav_state_machine_msgs::RunTaskService,mav_state_machine_msgs::RunTaskService::Request,mav_state_machine_msgs::RunTaskService::Response,mav_state_machine_msgs_msg_RunTaskServiceRequest_common,mav_state_machine_msgs_msg_RunTaskServiceResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          mav_state_machine_msgs_RunTaskService_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<mav_state_machine_msgs::RunTaskService::Request,mav_state_machine_msgs_msg_RunTaskServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<mav_state_machine_msgs::RunTaskService::Response,mav_state_machine_msgs_msg_RunTaskServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_state_machine_msgs_msg_RunTaskServiceRequest_common, MATLABROSMsgInterface<mav_state_machine_msgs::RunTaskService::Request>)
CLASS_LOADER_REGISTER_CLASS(mav_state_machine_msgs_msg_RunTaskServiceResponse_common, MATLABROSMsgInterface<mav_state_machine_msgs::RunTaskService::Response>)
CLASS_LOADER_REGISTER_CLASS(mav_state_machine_msgs_RunTaskService_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
