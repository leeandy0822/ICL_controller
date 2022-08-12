// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/PolynomialTrajectory4D
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
#include "mav_planning_msgs/PolynomialTrajectory4D.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PolynomialTrajectory4D_common : public MATLABROSMsgInterface<mav_planning_msgs::PolynomialTrajectory4D> {
  public:
    virtual ~mav_planning_msgs_msg_PolynomialTrajectory4D_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PolynomialTrajectory4D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PolynomialTrajectory4D* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PolynomialTrajectory4D_common::copy_from_struct(mav_planning_msgs::PolynomialTrajectory4D* msg, const matlab::data::Struct& arr,
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
        //segments
        const matlab::data::StructArray segments_arr = arr["Segments"];
        for (auto _segmentsarr : segments_arr) {
        	mav_planning_msgs::PolynomialSegment4D _val;
        auto msgClassPtr_segments = getCommonObject<mav_planning_msgs::PolynomialSegment4D>("mav_planning_msgs_msg_PolynomialSegment4D_common",loader);
        msgClassPtr_segments->copy_from_struct(&_val,_segmentsarr,loader);
        	msg->segments.push_back(_val);
        }
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Segments' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Segments' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PolynomialTrajectory4D_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PolynomialTrajectory4D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Segments"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PolynomialTrajectory4D");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // segments
    auto currentElement_segments = (msg + ctr)->segments;
    auto msgClassPtr_segments = getCommonObject<mav_planning_msgs::PolynomialSegment4D>("mav_planning_msgs_msg_PolynomialSegment4D_common",loader);
    outArray[ctr]["Segments"] = msgClassPtr_segments->get_arr(factory,&currentElement_segments[0],loader,currentElement_segments.size());
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_PolynomialTrajectory4D_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_PolynomialTrajectory4D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_PolynomialTrajectory4D_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_planning_msgs::PolynomialTrajectory4D,mav_planning_msgs_msg_PolynomialTrajectory4D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_planning_msgs_PolynomialTrajectory4D_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PolynomialTrajectory4D,mav_planning_msgs::PolynomialTrajectory4D::ConstPtr,mav_planning_msgs_msg_PolynomialTrajectory4D_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_planning_msgs_PolynomialTrajectory4D_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PolynomialTrajectory4D,mav_planning_msgs_msg_PolynomialTrajectory4D_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PolynomialTrajectory4D_common, MATLABROSMsgInterface<mav_planning_msgs::PolynomialTrajectory4D>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_PolynomialTrajectory4D_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1