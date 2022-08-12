// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/FilteredSensorData
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
#include "mav_msgs/FilteredSensorData.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_FilteredSensorData_common : public MATLABROSMsgInterface<mav_msgs::FilteredSensorData> {
  public:
    virtual ~mav_msgs_msg_FilteredSensorData_common(){}
    virtual void copy_from_struct(mav_msgs::FilteredSensorData* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::FilteredSensorData* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_FilteredSensorData_common::copy_from_struct(mav_msgs::FilteredSensorData* msg, const matlab::data::Struct& arr,
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
        //accelerometer
        const matlab::data::StructArray accelerometer_arr = arr["Accelerometer"];
        auto msgClassPtr_accelerometer = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_accelerometer->copy_from_struct(&msg->accelerometer,accelerometer_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Accelerometer' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Accelerometer' is wrong type; expected a struct.");
    }
    try {
        //gyroscope
        const matlab::data::StructArray gyroscope_arr = arr["Gyroscope"];
        auto msgClassPtr_gyroscope = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_gyroscope->copy_from_struct(&msg->gyroscope,gyroscope_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Gyroscope' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Gyroscope' is wrong type; expected a struct.");
    }
    try {
        //magnetometer
        const matlab::data::StructArray magnetometer_arr = arr["Magnetometer"];
        auto msgClassPtr_magnetometer = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_magnetometer->copy_from_struct(&msg->magnetometer,magnetometer_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Magnetometer' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Magnetometer' is wrong type; expected a struct.");
    }
    try {
        //barometer
        const matlab::data::TypedArray<double> barometer_arr = arr["Barometer"];
        msg->barometer = barometer_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Barometer' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Barometer' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_FilteredSensorData_common::get_arr(MDFactory_T& factory, const mav_msgs::FilteredSensorData* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Accelerometer","Gyroscope","Magnetometer","Barometer"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/FilteredSensorData");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // accelerometer
    auto currentElement_accelerometer = (msg + ctr)->accelerometer;
    auto msgClassPtr_accelerometer = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Accelerometer"] = msgClassPtr_accelerometer->get_arr(factory, &currentElement_accelerometer, loader);
    // gyroscope
    auto currentElement_gyroscope = (msg + ctr)->gyroscope;
    auto msgClassPtr_gyroscope = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Gyroscope"] = msgClassPtr_gyroscope->get_arr(factory, &currentElement_gyroscope, loader);
    // magnetometer
    auto currentElement_magnetometer = (msg + ctr)->magnetometer;
    auto msgClassPtr_magnetometer = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Magnetometer"] = msgClassPtr_magnetometer->get_arr(factory, &currentElement_magnetometer, loader);
    // barometer
    auto currentElement_barometer = (msg + ctr)->barometer;
    outArray[ctr]["Barometer"] = factory.createScalar(currentElement_barometer);
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_FilteredSensorData_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_FilteredSensorData_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_FilteredSensorData_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::FilteredSensorData,mav_msgs_msg_FilteredSensorData_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_FilteredSensorData_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::FilteredSensorData,mav_msgs::FilteredSensorData::ConstPtr,mav_msgs_msg_FilteredSensorData_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_FilteredSensorData_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::FilteredSensorData,mav_msgs_msg_FilteredSensorData_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_FilteredSensorData_common, MATLABROSMsgInterface<mav_msgs::FilteredSensorData>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_FilteredSensorData_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1