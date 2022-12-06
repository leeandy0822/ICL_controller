// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/PolynomialSegment4D
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
#include "mav_planning_msgs/PolynomialSegment4D.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PolynomialSegment4D_common : public MATLABROSMsgInterface<mav_planning_msgs::PolynomialSegment4D> {
  public:
    virtual ~mav_planning_msgs_msg_PolynomialSegment4D_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PolynomialSegment4D* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PolynomialSegment4D* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PolynomialSegment4D_common::copy_from_struct(mav_planning_msgs::PolynomialSegment4D* msg, const matlab::data::Struct& arr,
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
        //num_coeffs
        const matlab::data::TypedArray<int32_t> num_coeffs_arr = arr["NumCoeffs"];
        msg->num_coeffs = num_coeffs_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'NumCoeffs' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'NumCoeffs' is wrong type; expected a int32.");
    }
    try {
        //segment_time
        const matlab::data::StructArray segment_time_arr = arr["SegmentTime"];
        auto msgClassPtr_segment_time = getCommonObject<ros::Duration>("ros_msg_Duration_common",loader);
        msgClassPtr_segment_time->copy_from_struct(&msg->segment_time,segment_time_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'SegmentTime' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'SegmentTime' is wrong type; expected a struct.");
    }
    try {
        //x
        const matlab::data::TypedArray<double> x_arr = arr["X"];
        size_t nelem = x_arr.getNumberOfElements();
        	msg->x.resize(nelem);
        	std::copy(x_arr.begin(), x_arr.begin()+nelem, msg->x.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'X' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'X' is wrong type; expected a double.");
    }
    try {
        //y
        const matlab::data::TypedArray<double> y_arr = arr["Y"];
        size_t nelem = y_arr.getNumberOfElements();
        	msg->y.resize(nelem);
        	std::copy(y_arr.begin(), y_arr.begin()+nelem, msg->y.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Y' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Y' is wrong type; expected a double.");
    }
    try {
        //z
        const matlab::data::TypedArray<double> z_arr = arr["Z"];
        size_t nelem = z_arr.getNumberOfElements();
        	msg->z.resize(nelem);
        	std::copy(z_arr.begin(), z_arr.begin()+nelem, msg->z.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Z' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Z' is wrong type; expected a double.");
    }
    try {
        //yaw
        const matlab::data::TypedArray<double> yaw_arr = arr["Yaw"];
        size_t nelem = yaw_arr.getNumberOfElements();
        	msg->yaw.resize(nelem);
        	std::copy(yaw_arr.begin(), yaw_arr.begin()+nelem, msg->yaw.begin());
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Yaw' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Yaw' is wrong type; expected a double.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PolynomialSegment4D_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PolynomialSegment4D* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","NumCoeffs","SegmentTime","X","Y","Z","Yaw"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PolynomialSegment4D");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // num_coeffs
    auto currentElement_num_coeffs = (msg + ctr)->num_coeffs;
    outArray[ctr]["NumCoeffs"] = factory.createScalar(currentElement_num_coeffs);
    // segment_time
    auto currentElement_segment_time = (msg + ctr)->segment_time;
    auto msgClassPtr_segment_time = getCommonObject<ros::Duration>("ros_msg_Duration_common",loader);
    outArray[ctr]["SegmentTime"] = msgClassPtr_segment_time->get_arr(factory, &currentElement_segment_time, loader);
    // x
    auto currentElement_x = (msg + ctr)->x;
    outArray[ctr]["X"] = factory.createArray<mav_planning_msgs::PolynomialSegment4D::_x_type::const_iterator, double>({currentElement_x.size(),1}, currentElement_x.begin(), currentElement_x.end());
    // y
    auto currentElement_y = (msg + ctr)->y;
    outArray[ctr]["Y"] = factory.createArray<mav_planning_msgs::PolynomialSegment4D::_y_type::const_iterator, double>({currentElement_y.size(),1}, currentElement_y.begin(), currentElement_y.end());
    // z
    auto currentElement_z = (msg + ctr)->z;
    outArray[ctr]["Z"] = factory.createArray<mav_planning_msgs::PolynomialSegment4D::_z_type::const_iterator, double>({currentElement_z.size(),1}, currentElement_z.begin(), currentElement_z.end());
    // yaw
    auto currentElement_yaw = (msg + ctr)->yaw;
    outArray[ctr]["Yaw"] = factory.createArray<mav_planning_msgs::PolynomialSegment4D::_yaw_type::const_iterator, double>({currentElement_yaw.size(),1}, currentElement_yaw.begin(), currentElement_yaw.end());
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_PolynomialSegment4D_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_PolynomialSegment4D_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_PolynomialSegment4D_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_planning_msgs::PolynomialSegment4D,mav_planning_msgs_msg_PolynomialSegment4D_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_planning_msgs_PolynomialSegment4D_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PolynomialSegment4D,mav_planning_msgs::PolynomialSegment4D::ConstPtr,mav_planning_msgs_msg_PolynomialSegment4D_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_planning_msgs_PolynomialSegment4D_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PolynomialSegment4D,mav_planning_msgs_msg_PolynomialSegment4D_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PolynomialSegment4D_common, MATLABROSMsgInterface<mav_planning_msgs::PolynomialSegment4D>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_PolynomialSegment4D_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1