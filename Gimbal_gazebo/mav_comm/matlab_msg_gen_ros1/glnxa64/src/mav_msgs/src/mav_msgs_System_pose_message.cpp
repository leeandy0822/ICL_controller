// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/System_pose
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
#include "mav_msgs/System_pose.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_System_pose_common : public MATLABROSMsgInterface<mav_msgs::System_pose> {
  public:
    virtual ~mav_msgs_msg_System_pose_common(){}
    virtual void copy_from_struct(mav_msgs::System_pose* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::System_pose* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_System_pose_common::copy_from_struct(mav_msgs::System_pose* msg, const matlab::data::Struct& arr,
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
        //uav1
        const matlab::data::StructArray uav1_arr = arr["Uav1"];
        auto msgClassPtr_uav1 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_uav1->copy_from_struct(&msg->uav1,uav1_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav1' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav1' is wrong type; expected a struct.");
    }
    try {
        //uav1_acc
        const matlab::data::StructArray uav1_acc_arr = arr["Uav1Acc"];
        auto msgClassPtr_uav1_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_uav1_acc->copy_from_struct(&msg->uav1_acc,uav1_acc_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav1Acc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav1Acc' is wrong type; expected a struct.");
    }
    try {
        //uav2
        const matlab::data::StructArray uav2_arr = arr["Uav2"];
        auto msgClassPtr_uav2 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_uav2->copy_from_struct(&msg->uav2,uav2_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav2' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav2' is wrong type; expected a struct.");
    }
    try {
        //uav2_acc
        const matlab::data::StructArray uav2_acc_arr = arr["Uav2Acc"];
        auto msgClassPtr_uav2_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_uav2_acc->copy_from_struct(&msg->uav2_acc,uav2_acc_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav2Acc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav2Acc' is wrong type; expected a struct.");
    }
    try {
        //uav3
        const matlab::data::StructArray uav3_arr = arr["Uav3"];
        auto msgClassPtr_uav3 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_uav3->copy_from_struct(&msg->uav3,uav3_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav3' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav3' is wrong type; expected a struct.");
    }
    try {
        //uav3_acc
        const matlab::data::StructArray uav3_acc_arr = arr["Uav3Acc"];
        auto msgClassPtr_uav3_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_uav3_acc->copy_from_struct(&msg->uav3_acc,uav3_acc_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav3Acc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav3Acc' is wrong type; expected a struct.");
    }
    try {
        //uav4
        const matlab::data::StructArray uav4_arr = arr["Uav4"];
        auto msgClassPtr_uav4 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_uav4->copy_from_struct(&msg->uav4,uav4_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav4' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav4' is wrong type; expected a struct.");
    }
    try {
        //uav4_acc
        const matlab::data::StructArray uav4_acc_arr = arr["Uav4Acc"];
        auto msgClassPtr_uav4_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_uav4_acc->copy_from_struct(&msg->uav4_acc,uav4_acc_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Uav4Acc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Uav4Acc' is wrong type; expected a struct.");
    }
    try {
        //payload
        const matlab::data::StructArray payload_arr = arr["Payload"];
        auto msgClassPtr_payload = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
        msgClassPtr_payload->copy_from_struct(&msg->payload,payload_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'Payload' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'Payload' is wrong type; expected a struct.");
    }
    try {
        //payload_W
        const matlab::data::StructArray payload_W_arr = arr["PayloadW"];
        auto msgClassPtr_payload_W = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_payload_W->copy_from_struct(&msg->payload_W,payload_W_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'PayloadW' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'PayloadW' is wrong type; expected a struct.");
    }
    try {
        //payload_acc
        const matlab::data::StructArray payload_acc_arr = arr["PayloadAcc"];
        auto msgClassPtr_payload_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_payload_acc->copy_from_struct(&msg->payload_acc,payload_acc_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'PayloadAcc' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'PayloadAcc' is wrong type; expected a struct.");
    }
    try {
        //payload_vel
        const matlab::data::StructArray payload_vel_arr = arr["PayloadVel"];
        auto msgClassPtr_payload_vel = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_payload_vel->copy_from_struct(&msg->payload_vel,payload_vel_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'PayloadVel' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'PayloadVel' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_System_pose_common::get_arr(MDFactory_T& factory, const mav_msgs::System_pose* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","Uav1","Uav1Acc","Uav2","Uav2Acc","Uav3","Uav3Acc","Uav4","Uav4Acc","Payload","PayloadW","PayloadAcc","PayloadVel"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/System_pose");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // uav1
    auto currentElement_uav1 = (msg + ctr)->uav1;
    auto msgClassPtr_uav1 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Uav1"] = msgClassPtr_uav1->get_arr(factory, &currentElement_uav1, loader);
    // uav1_acc
    auto currentElement_uav1_acc = (msg + ctr)->uav1_acc;
    auto msgClassPtr_uav1_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Uav1Acc"] = msgClassPtr_uav1_acc->get_arr(factory, &currentElement_uav1_acc, loader);
    // uav2
    auto currentElement_uav2 = (msg + ctr)->uav2;
    auto msgClassPtr_uav2 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Uav2"] = msgClassPtr_uav2->get_arr(factory, &currentElement_uav2, loader);
    // uav2_acc
    auto currentElement_uav2_acc = (msg + ctr)->uav2_acc;
    auto msgClassPtr_uav2_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Uav2Acc"] = msgClassPtr_uav2_acc->get_arr(factory, &currentElement_uav2_acc, loader);
    // uav3
    auto currentElement_uav3 = (msg + ctr)->uav3;
    auto msgClassPtr_uav3 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Uav3"] = msgClassPtr_uav3->get_arr(factory, &currentElement_uav3, loader);
    // uav3_acc
    auto currentElement_uav3_acc = (msg + ctr)->uav3_acc;
    auto msgClassPtr_uav3_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Uav3Acc"] = msgClassPtr_uav3_acc->get_arr(factory, &currentElement_uav3_acc, loader);
    // uav4
    auto currentElement_uav4 = (msg + ctr)->uav4;
    auto msgClassPtr_uav4 = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Uav4"] = msgClassPtr_uav4->get_arr(factory, &currentElement_uav4, loader);
    // uav4_acc
    auto currentElement_uav4_acc = (msg + ctr)->uav4_acc;
    auto msgClassPtr_uav4_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["Uav4Acc"] = msgClassPtr_uav4_acc->get_arr(factory, &currentElement_uav4_acc, loader);
    // payload
    auto currentElement_payload = (msg + ctr)->payload;
    auto msgClassPtr_payload = getCommonObject<geometry_msgs::Pose>("geometry_msgs_msg_Pose_common",loader);
    outArray[ctr]["Payload"] = msgClassPtr_payload->get_arr(factory, &currentElement_payload, loader);
    // payload_W
    auto currentElement_payload_W = (msg + ctr)->payload_W;
    auto msgClassPtr_payload_W = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["PayloadW"] = msgClassPtr_payload_W->get_arr(factory, &currentElement_payload_W, loader);
    // payload_acc
    auto currentElement_payload_acc = (msg + ctr)->payload_acc;
    auto msgClassPtr_payload_acc = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["PayloadAcc"] = msgClassPtr_payload_acc->get_arr(factory, &currentElement_payload_acc, loader);
    // payload_vel
    auto currentElement_payload_vel = (msg + ctr)->payload_vel;
    auto msgClassPtr_payload_vel = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["PayloadVel"] = msgClassPtr_payload_vel->get_arr(factory, &currentElement_payload_vel, loader);
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_System_pose_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_System_pose_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_System_pose_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::System_pose,mav_msgs_msg_System_pose_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_System_pose_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::System_pose,mav_msgs::System_pose::ConstPtr,mav_msgs_msg_System_pose_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_System_pose_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::System_pose,mav_msgs_msg_System_pose_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_System_pose_common, MATLABROSMsgInterface<mav_msgs::System_pose>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_System_pose_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1