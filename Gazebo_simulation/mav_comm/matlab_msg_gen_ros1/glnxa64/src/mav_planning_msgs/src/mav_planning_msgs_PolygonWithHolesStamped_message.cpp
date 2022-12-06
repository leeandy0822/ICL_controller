// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/PolygonWithHolesStamped
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
#include "mav_planning_msgs/PolygonWithHolesStamped.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PolygonWithHolesStamped_common : public MATLABROSMsgInterface<mav_planning_msgs::PolygonWithHolesStamped> {
  public:
    virtual ~mav_planning_msgs_msg_PolygonWithHolesStamped_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PolygonWithHolesStamped* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PolygonWithHolesStamped* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PolygonWithHolesStamped_common::copy_from_struct(mav_planning_msgs::PolygonWithHolesStamped* msg, const matlab::data::Struct& arr,
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
        //altitude
        const matlab::data::TypedArray<double> altitude_arr = arr["Altitude"];
        msg->altitude = altitude_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Altitude' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Altitude' is wrong type; expected a double.");
    }
    try {
        //polygon
        const matlab::data::StructArray polygon_arr = arr["Polygon"];
        auto msgClassPtr_polygon = getCommonObject<mav_planning_msgs::PolygonWithHoles>("mav_planning_msgs_msg_PolygonWithHoles_common",loader);
        msgClassPtr_polygon->copy_from_struct(&msg->polygon,polygon_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Polygon' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Polygon' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PolygonWithHolesStamped_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PolygonWithHolesStamped* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Altitude","Polygon"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PolygonWithHolesStamped");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // altitude
    auto currentElement_altitude = (msg + ctr)->altitude;
    outArray[ctr]["Altitude"] = factory.createScalar(currentElement_altitude);
    // polygon
    auto currentElement_polygon = (msg + ctr)->polygon;
    auto msgClassPtr_polygon = getCommonObject<mav_planning_msgs::PolygonWithHoles>("mav_planning_msgs_msg_PolygonWithHoles_common",loader);
    outArray[ctr]["Polygon"] = msgClassPtr_polygon->get_arr(factory, &currentElement_polygon, loader);
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_PolygonWithHolesStamped_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_PolygonWithHolesStamped_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_PolygonWithHolesStamped_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_planning_msgs::PolygonWithHolesStamped,mav_planning_msgs_msg_PolygonWithHolesStamped_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_planning_msgs_PolygonWithHolesStamped_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PolygonWithHolesStamped,mav_planning_msgs::PolygonWithHolesStamped::ConstPtr,mav_planning_msgs_msg_PolygonWithHolesStamped_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_planning_msgs_PolygonWithHolesStamped_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PolygonWithHolesStamped,mav_planning_msgs_msg_PolygonWithHolesStamped_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PolygonWithHolesStamped_common, MATLABROSMsgInterface<mav_planning_msgs::PolygonWithHolesStamped>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_PolygonWithHolesStamped_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1