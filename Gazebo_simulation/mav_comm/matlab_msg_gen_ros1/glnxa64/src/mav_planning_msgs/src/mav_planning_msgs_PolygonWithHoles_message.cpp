// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/PolygonWithHoles
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
#include "mav_planning_msgs/PolygonWithHoles.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PolygonWithHoles_common : public MATLABROSMsgInterface<mav_planning_msgs::PolygonWithHoles> {
  public:
    virtual ~mav_planning_msgs_msg_PolygonWithHoles_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PolygonWithHoles* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PolygonWithHoles* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PolygonWithHoles_common::copy_from_struct(mav_planning_msgs::PolygonWithHoles* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //hull
        const matlab::data::StructArray hull_arr = arr["Hull"];
        auto msgClassPtr_hull = getCommonObject<mav_planning_msgs::Polygon2D>("mav_planning_msgs_msg_Polygon2D_common",loader);
        msgClassPtr_hull->copy_from_struct(&msg->hull,hull_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Hull' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Hull' is wrong type; expected a struct.");
    }
    try {
        //holes
        const matlab::data::StructArray holes_arr = arr["Holes"];
        for (auto _holesarr : holes_arr) {
        	mav_planning_msgs::Polygon2D _val;
        auto msgClassPtr_holes = getCommonObject<mav_planning_msgs::Polygon2D>("mav_planning_msgs_msg_Polygon2D_common",loader);
        msgClassPtr_holes->copy_from_struct(&_val,_holesarr,loader);
        	msg->holes.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Holes' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Holes' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PolygonWithHoles_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PolygonWithHoles* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Hull","Holes"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PolygonWithHoles");
    // hull
    auto currentElement_hull = (msg + ctr)->hull;
    auto msgClassPtr_hull = getCommonObject<mav_planning_msgs::Polygon2D>("mav_planning_msgs_msg_Polygon2D_common",loader);
    outArray[ctr]["Hull"] = msgClassPtr_hull->get_arr(factory, &currentElement_hull, loader);
    // holes
    auto currentElement_holes = (msg + ctr)->holes;
    auto msgClassPtr_holes = getCommonObject<mav_planning_msgs::Polygon2D>("mav_planning_msgs_msg_Polygon2D_common",loader);
    outArray[ctr]["Holes"] = msgClassPtr_holes->get_arr(factory,&currentElement_holes[0],loader,currentElement_holes.size());
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_PolygonWithHoles_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_PolygonWithHoles_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_PolygonWithHoles_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_planning_msgs::PolygonWithHoles,mav_planning_msgs_msg_PolygonWithHoles_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_planning_msgs_PolygonWithHoles_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PolygonWithHoles,mav_planning_msgs::PolygonWithHoles::ConstPtr,mav_planning_msgs_msg_PolygonWithHoles_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_planning_msgs_PolygonWithHoles_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PolygonWithHoles,mav_planning_msgs_msg_PolygonWithHoles_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PolygonWithHoles_common, MATLABROSMsgInterface<mav_planning_msgs::PolygonWithHoles>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_PolygonWithHoles_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1