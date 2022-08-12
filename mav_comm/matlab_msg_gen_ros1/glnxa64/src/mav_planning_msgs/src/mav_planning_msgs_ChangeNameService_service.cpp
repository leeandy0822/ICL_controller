// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/ChangeNameServiceRequest
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
#include "mav_planning_msgs/ChangeNameService.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_ChangeNameServiceRequest_common : public MATLABROSMsgInterface<mav_planning_msgs::ChangeNameService::Request> {
  public:
    virtual ~mav_planning_msgs_msg_ChangeNameServiceRequest_common(){}
    virtual void copy_from_struct(mav_planning_msgs::ChangeNameService::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::ChangeNameService::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_ChangeNameServiceRequest_common::copy_from_struct(mav_planning_msgs::ChangeNameService::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //name
        const matlab::data::CharArray name_arr = arr["Name"];
        msg->name = name_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Name' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Name' is wrong type; expected a string.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_ChangeNameServiceRequest_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::ChangeNameService::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Name"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/ChangeNameServiceRequest");
    // name
    auto currentElement_name = (msg + ctr)->name;
    outArray[ctr]["Name"] = factory.createCharArray(currentElement_name);
    }
    return std::move(outArray);
  }
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_ChangeNameServiceResponse_common : public MATLABROSMsgInterface<mav_planning_msgs::ChangeNameService::Response> {
  public:
    virtual ~mav_planning_msgs_msg_ChangeNameServiceResponse_common(){}
    virtual void copy_from_struct(mav_planning_msgs::ChangeNameService::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::ChangeNameService::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_ChangeNameServiceResponse_common::copy_from_struct(mav_planning_msgs::ChangeNameService::Response* msg, const matlab::data::Struct& arr,
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
    try {
        //message
        const matlab::data::CharArray message_arr = arr["Message"];
        msg->message = message_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Message' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Message' is wrong type; expected a string.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_ChangeNameServiceResponse_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::ChangeNameService::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Success","Message"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/ChangeNameServiceResponse");
    // success
    auto currentElement_success = (msg + ctr)->success;
    outArray[ctr]["Success"] = factory.createScalar(static_cast<bool>(currentElement_success));
    // message
    auto currentElement_message = (msg + ctr)->message;
    outArray[ctr]["Message"] = factory.createCharArray(currentElement_message);
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_ChangeNameService_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_ChangeNameService_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_ChangeNameService_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<mav_planning_msgs::ChangeNameService::Request,mav_planning_msgs_msg_ChangeNameServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<mav_planning_msgs::ChangeNameService::Response,mav_planning_msgs_msg_ChangeNameServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          mav_planning_msgs_ChangeNameService_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<mav_planning_msgs::ChangeNameService::Request,mav_planning_msgs::ChangeNameService::Request::ConstPtr,mav_planning_msgs_msg_ChangeNameServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<mav_planning_msgs::ChangeNameService::Response,mav_planning_msgs::ChangeNameService::Response::ConstPtr,mav_planning_msgs_msg_ChangeNameServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          mav_planning_msgs_ChangeNameService_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<mav_planning_msgs::ChangeNameService::Request,mav_planning_msgs::ChangeNameService::Response,mav_planning_msgs_msg_ChangeNameServiceRequest_common,mav_planning_msgs_msg_ChangeNameServiceResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          mav_planning_msgs_ChangeNameService_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<mav_planning_msgs::ChangeNameService,mav_planning_msgs::ChangeNameService::Request,mav_planning_msgs::ChangeNameService::Response,mav_planning_msgs_msg_ChangeNameServiceRequest_common,mav_planning_msgs_msg_ChangeNameServiceResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          mav_planning_msgs_ChangeNameService_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<mav_planning_msgs::ChangeNameService::Request,mav_planning_msgs_msg_ChangeNameServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<mav_planning_msgs::ChangeNameService::Response,mav_planning_msgs_msg_ChangeNameServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_ChangeNameServiceRequest_common, MATLABROSMsgInterface<mav_planning_msgs::ChangeNameService::Request>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_ChangeNameServiceResponse_common, MATLABROSMsgInterface<mav_planning_msgs::ChangeNameService::Response>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_ChangeNameService_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
