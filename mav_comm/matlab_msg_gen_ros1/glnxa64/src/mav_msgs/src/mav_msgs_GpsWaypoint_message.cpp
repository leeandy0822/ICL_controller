// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/GpsWaypoint
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
#include "mav_msgs/GpsWaypoint.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_GpsWaypoint_common : public MATLABROSMsgInterface<mav_msgs::GpsWaypoint> {
  public:
    virtual ~mav_msgs_msg_GpsWaypoint_common(){}
    virtual void copy_from_struct(mav_msgs::GpsWaypoint* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::GpsWaypoint* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_GpsWaypoint_common::copy_from_struct(mav_msgs::GpsWaypoint* msg, const matlab::data::Struct& arr,
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
        //latitude
        const matlab::data::TypedArray<double> latitude_arr = arr["Latitude"];
        msg->latitude = latitude_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Latitude' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Latitude' is wrong type; expected a double.");
    }
    try {
        //longitude
        const matlab::data::TypedArray<double> longitude_arr = arr["Longitude"];
        msg->longitude = longitude_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Longitude' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Longitude' is wrong type; expected a double.");
    }
    try {
        //altitude
        const matlab::data::TypedArray<double> altitude_arr = arr["Altitude"];
        msg->altitude = altitude_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Altitude' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Altitude' is wrong type; expected a double.");
    }
    try {
        //heading
        const matlab::data::TypedArray<double> heading_arr = arr["Heading"];
        msg->heading = heading_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Heading' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Heading' is wrong type; expected a double.");
    }
    try {
        //maxSpeed
        const matlab::data::TypedArray<double> maxSpeed_arr = arr["MaxSpeed"];
        msg->maxSpeed = maxSpeed_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'MaxSpeed' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'MaxSpeed' is wrong type; expected a double.");
    }
    try {
        //maxAcc
        const matlab::data::TypedArray<double> maxAcc_arr = arr["MaxAcc"];
        msg->maxAcc = maxAcc_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'MaxAcc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'MaxAcc' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_GpsWaypoint_common::get_arr(MDFactory_T& factory, const mav_msgs::GpsWaypoint* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Latitude","Longitude","Altitude","Heading","MaxSpeed","MaxAcc"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/GpsWaypoint");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // latitude
    auto currentElement_latitude = (msg + ctr)->latitude;
    outArray[ctr]["Latitude"] = factory.createScalar(currentElement_latitude);
    // longitude
    auto currentElement_longitude = (msg + ctr)->longitude;
    outArray[ctr]["Longitude"] = factory.createScalar(currentElement_longitude);
    // altitude
    auto currentElement_altitude = (msg + ctr)->altitude;
    outArray[ctr]["Altitude"] = factory.createScalar(currentElement_altitude);
    // heading
    auto currentElement_heading = (msg + ctr)->heading;
    outArray[ctr]["Heading"] = factory.createScalar(currentElement_heading);
    // maxSpeed
    auto currentElement_maxSpeed = (msg + ctr)->maxSpeed;
    outArray[ctr]["MaxSpeed"] = factory.createScalar(currentElement_maxSpeed);
    // maxAcc
    auto currentElement_maxAcc = (msg + ctr)->maxAcc;
    outArray[ctr]["MaxAcc"] = factory.createScalar(currentElement_maxAcc);
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_GpsWaypoint_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_GpsWaypoint_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_GpsWaypoint_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::GpsWaypoint,mav_msgs_msg_GpsWaypoint_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_GpsWaypoint_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::GpsWaypoint,mav_msgs::GpsWaypoint::ConstPtr,mav_msgs_msg_GpsWaypoint_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_GpsWaypoint_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::GpsWaypoint,mav_msgs_msg_GpsWaypoint_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_GpsWaypoint_common, MATLABROSMsgInterface<mav_msgs::GpsWaypoint>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_GpsWaypoint_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1