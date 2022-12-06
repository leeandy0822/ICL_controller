// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/Actuators
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
#include "mav_msgs/Actuators.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_Actuators_common : public MATLABROSMsgInterface<mav_msgs::Actuators> {
  public:
    virtual ~mav_msgs_msg_Actuators_common(){}
    virtual void copy_from_struct(mav_msgs::Actuators* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::Actuators* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_Actuators_common::copy_from_struct(mav_msgs::Actuators* msg, const matlab::data::Struct& arr,
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
        //angles
        const matlab::data::TypedArray<double> angles_arr = arr["Angles"];
        size_t nelem = angles_arr.getNumberOfElements();
        	msg->angles.resize(nelem);
        	std::copy(angles_arr.begin(), angles_arr.begin()+nelem, msg->angles.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Angles' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Angles' is wrong type; expected a double.");
    }
    try {
        //angular_velocities
        const matlab::data::TypedArray<double> angular_velocities_arr = arr["AngularVelocities"];
        size_t nelem = angular_velocities_arr.getNumberOfElements();
        	msg->angular_velocities.resize(nelem);
        	std::copy(angular_velocities_arr.begin(), angular_velocities_arr.begin()+nelem, msg->angular_velocities.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'AngularVelocities' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'AngularVelocities' is wrong type; expected a double.");
    }
    try {
        //normalized
        const matlab::data::TypedArray<double> normalized_arr = arr["Normalized"];
        size_t nelem = normalized_arr.getNumberOfElements();
        	msg->normalized.resize(nelem);
        	std::copy(normalized_arr.begin(), normalized_arr.begin()+nelem, msg->normalized.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Normalized' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Normalized' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_Actuators_common::get_arr(MDFactory_T& factory, const mav_msgs::Actuators* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Angles","AngularVelocities","Normalized"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/Actuators");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // angles
    auto currentElement_angles = (msg + ctr)->angles;
    outArray[ctr]["Angles"] = factory.createArray<mav_msgs::Actuators::_angles_type::const_iterator, double>({currentElement_angles.size(),1}, currentElement_angles.begin(), currentElement_angles.end());
    // angular_velocities
    auto currentElement_angular_velocities = (msg + ctr)->angular_velocities;
    outArray[ctr]["AngularVelocities"] = factory.createArray<mav_msgs::Actuators::_angular_velocities_type::const_iterator, double>({currentElement_angular_velocities.size(),1}, currentElement_angular_velocities.begin(), currentElement_angular_velocities.end());
    // normalized
    auto currentElement_normalized = (msg + ctr)->normalized;
    outArray[ctr]["Normalized"] = factory.createArray<mav_msgs::Actuators::_normalized_type::const_iterator, double>({currentElement_normalized.size(),1}, currentElement_normalized.begin(), currentElement_normalized.end());
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_Actuators_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_Actuators_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_Actuators_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::Actuators,mav_msgs_msg_Actuators_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_Actuators_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::Actuators,mav_msgs::Actuators::ConstPtr,mav_msgs_msg_Actuators_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_Actuators_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::Actuators,mav_msgs_msg_Actuators_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_Actuators_common, MATLABROSMsgInterface<mav_msgs::Actuators>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_Actuators_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1