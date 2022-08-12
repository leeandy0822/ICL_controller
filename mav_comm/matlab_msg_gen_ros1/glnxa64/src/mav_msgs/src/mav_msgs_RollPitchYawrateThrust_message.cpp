// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/RollPitchYawrateThrust
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
#include "mav_msgs/RollPitchYawrateThrust.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_RollPitchYawrateThrust_common : public MATLABROSMsgInterface<mav_msgs::RollPitchYawrateThrust> {
  public:
    virtual ~mav_msgs_msg_RollPitchYawrateThrust_common(){}
    virtual void copy_from_struct(mav_msgs::RollPitchYawrateThrust* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::RollPitchYawrateThrust* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_RollPitchYawrateThrust_common::copy_from_struct(mav_msgs::RollPitchYawrateThrust* msg, const matlab::data::Struct& arr,
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
        //roll
        const matlab::data::TypedArray<double> roll_arr = arr["Roll"];
        msg->roll = roll_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Roll' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Roll' is wrong type; expected a double.");
    }
    try {
        //pitch
        const matlab::data::TypedArray<double> pitch_arr = arr["Pitch"];
        msg->pitch = pitch_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Pitch' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Pitch' is wrong type; expected a double.");
    }
    try {
        //yaw_rate
        const matlab::data::TypedArray<double> yaw_rate_arr = arr["YawRate"];
        msg->yaw_rate = yaw_rate_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'YawRate' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'YawRate' is wrong type; expected a double.");
    }
    try {
        //thrust
        const matlab::data::StructArray thrust_arr = arr["Thrust"];
        auto msgClassPtr_thrust = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_thrust->copy_from_struct(&msg->thrust,thrust_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Thrust' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Thrust' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_RollPitchYawrateThrust_common::get_arr(MDFactory_T& factory, const mav_msgs::RollPitchYawrateThrust* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Roll","Pitch","YawRate","Thrust"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/RollPitchYawrateThrust");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // roll
    auto currentElement_roll = (msg + ctr)->roll;
    outArray[ctr]["Roll"] = factory.createScalar(currentElement_roll);
    // pitch
    auto currentElement_pitch = (msg + ctr)->pitch;
    outArray[ctr]["Pitch"] = factory.createScalar(currentElement_pitch);
    // yaw_rate
    auto currentElement_yaw_rate = (msg + ctr)->yaw_rate;
    outArray[ctr]["YawRate"] = factory.createScalar(currentElement_yaw_rate);
    // thrust
    auto currentElement_thrust = (msg + ctr)->thrust;
    auto msgClassPtr_thrust = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Thrust"] = msgClassPtr_thrust->get_arr(factory, &currentElement_thrust, loader);
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_RollPitchYawrateThrust_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_RollPitchYawrateThrust_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_RollPitchYawrateThrust_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::RollPitchYawrateThrust,mav_msgs_msg_RollPitchYawrateThrust_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_RollPitchYawrateThrust_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::RollPitchYawrateThrust,mav_msgs::RollPitchYawrateThrust::ConstPtr,mav_msgs_msg_RollPitchYawrateThrust_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_RollPitchYawrateThrust_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::RollPitchYawrateThrust,mav_msgs_msg_RollPitchYawrateThrust_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_RollPitchYawrateThrust_common, MATLABROSMsgInterface<mav_msgs::RollPitchYawrateThrust>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_RollPitchYawrateThrust_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1