// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_planning_msgs/PlannerServiceRequest
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
#include "mav_planning_msgs/PlannerService.h"
#include "visibility_control.h"
#include "ROSPubSubTemplates.hpp"
#include "ROSServiceTemplates.hpp"
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PlannerServiceRequest_common : public MATLABROSMsgInterface<mav_planning_msgs::PlannerService::Request> {
  public:
    virtual ~mav_planning_msgs_msg_PlannerServiceRequest_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PlannerService::Request* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PlannerService::Request* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PlannerServiceRequest_common::copy_from_struct(mav_planning_msgs::PlannerService::Request* msg, const matlab::data::Struct& arr,
               MultiLibLoader loader) {
    try {
        //start_pose
        const matlab::data::StructArray start_pose_arr = arr["StartPose"];
        auto msgClassPtr_start_pose = getCommonObject<geometry_msgs::PoseStamped>("geometry_msgs_msg_PoseStamped_common",loader);
        msgClassPtr_start_pose->copy_from_struct(&msg->start_pose,start_pose_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'StartPose' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'StartPose' is wrong type; expected a struct.");
    }
    try {
        //start_velocity
        const matlab::data::StructArray start_velocity_arr = arr["StartVelocity"];
        auto msgClassPtr_start_velocity = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_start_velocity->copy_from_struct(&msg->start_velocity,start_velocity_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'StartVelocity' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'StartVelocity' is wrong type; expected a struct.");
    }
    try {
        //goal_pose
        const matlab::data::StructArray goal_pose_arr = arr["GoalPose"];
        auto msgClassPtr_goal_pose = getCommonObject<geometry_msgs::PoseStamped>("geometry_msgs_msg_PoseStamped_common",loader);
        msgClassPtr_goal_pose->copy_from_struct(&msg->goal_pose,goal_pose_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'GoalPose' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'GoalPose' is wrong type; expected a struct.");
    }
    try {
        //goal_velocity
        const matlab::data::StructArray goal_velocity_arr = arr["GoalVelocity"];
        auto msgClassPtr_goal_velocity = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_goal_velocity->copy_from_struct(&msg->goal_velocity,goal_velocity_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'GoalVelocity' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'GoalVelocity' is wrong type; expected a struct.");
    }
    try {
        //bounding_box
        const matlab::data::StructArray bounding_box_arr = arr["BoundingBox"];
        auto msgClassPtr_bounding_box = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
        msgClassPtr_bounding_box->copy_from_struct(&msg->bounding_box,bounding_box_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'BoundingBox' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'BoundingBox' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PlannerServiceRequest_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PlannerService::Request* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","StartPose","StartVelocity","GoalPose","GoalVelocity","BoundingBox"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PlannerServiceRequest");
    // start_pose
    auto currentElement_start_pose = (msg + ctr)->start_pose;
    auto msgClassPtr_start_pose = getCommonObject<geometry_msgs::PoseStamped>("geometry_msgs_msg_PoseStamped_common",loader);
    outArray[ctr]["StartPose"] = msgClassPtr_start_pose->get_arr(factory, &currentElement_start_pose, loader);
    // start_velocity
    auto currentElement_start_velocity = (msg + ctr)->start_velocity;
    auto msgClassPtr_start_velocity = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["StartVelocity"] = msgClassPtr_start_velocity->get_arr(factory, &currentElement_start_velocity, loader);
    // goal_pose
    auto currentElement_goal_pose = (msg + ctr)->goal_pose;
    auto msgClassPtr_goal_pose = getCommonObject<geometry_msgs::PoseStamped>("geometry_msgs_msg_PoseStamped_common",loader);
    outArray[ctr]["GoalPose"] = msgClassPtr_goal_pose->get_arr(factory, &currentElement_goal_pose, loader);
    // goal_velocity
    auto currentElement_goal_velocity = (msg + ctr)->goal_velocity;
    auto msgClassPtr_goal_velocity = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["GoalVelocity"] = msgClassPtr_goal_velocity->get_arr(factory, &currentElement_goal_velocity, loader);
    // bounding_box
    auto currentElement_bounding_box = (msg + ctr)->bounding_box;
    auto msgClassPtr_bounding_box = getCommonObject<geometry_msgs::Vector3>("geometry_msgs_msg_Vector3_common",loader);
    outArray[ctr]["BoundingBox"] = msgClassPtr_bounding_box->get_arr(factory, &currentElement_bounding_box, loader);
    }
    return std::move(outArray);
  }
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_msg_PlannerServiceResponse_common : public MATLABROSMsgInterface<mav_planning_msgs::PlannerService::Response> {
  public:
    virtual ~mav_planning_msgs_msg_PlannerServiceResponse_common(){}
    virtual void copy_from_struct(mav_planning_msgs::PlannerService::Response* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_planning_msgs::PlannerService::Response* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_planning_msgs_msg_PlannerServiceResponse_common::copy_from_struct(mav_planning_msgs::PlannerService::Response* msg, const matlab::data::Struct& arr,
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
        //polynomial_plan
        const matlab::data::StructArray polynomial_plan_arr = arr["PolynomialPlan"];
        auto msgClassPtr_polynomial_plan = getCommonObject<mav_planning_msgs::PolynomialTrajectory>("mav_planning_msgs_msg_PolynomialTrajectory_common",loader);
        msgClassPtr_polynomial_plan->copy_from_struct(&msg->polynomial_plan,polynomial_plan_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'PolynomialPlan' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'PolynomialPlan' is wrong type; expected a struct.");
    }
    try {
        //polynomial_plan_4D
        const matlab::data::StructArray polynomial_plan_4D_arr = arr["PolynomialPlan4D"];
        auto msgClassPtr_polynomial_plan_4D = getCommonObject<mav_planning_msgs::PolynomialTrajectory4D>("mav_planning_msgs_msg_PolynomialTrajectory4D_common",loader);
        msgClassPtr_polynomial_plan_4D->copy_from_struct(&msg->polynomial_plan_4D,polynomial_plan_4D_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'PolynomialPlan4D' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'PolynomialPlan4D' is wrong type; expected a struct.");
    }
    try {
        //sampled_plan
        const matlab::data::StructArray sampled_plan_arr = arr["SampledPlan"];
        auto msgClassPtr_sampled_plan = getCommonObject<trajectory_msgs::MultiDOFJointTrajectory>("trajectory_msgs_msg_MultiDOFJointTrajectory_common",loader);
        msgClassPtr_sampled_plan->copy_from_struct(&msg->sampled_plan,sampled_plan_arr[0],loader);
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'SampledPlan' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'SampledPlan' is wrong type; expected a struct.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_planning_msgs_msg_PlannerServiceResponse_common::get_arr(MDFactory_T& factory, const mav_planning_msgs::PlannerService::Response* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Success","PolynomialPlan","PolynomialPlan4D","SampledPlan"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_planning_msgs/PlannerServiceResponse");
    // success
    auto currentElement_success = (msg + ctr)->success;
    outArray[ctr]["Success"] = factory.createScalar(static_cast<bool>(currentElement_success));
    // polynomial_plan
    auto currentElement_polynomial_plan = (msg + ctr)->polynomial_plan;
    auto msgClassPtr_polynomial_plan = getCommonObject<mav_planning_msgs::PolynomialTrajectory>("mav_planning_msgs_msg_PolynomialTrajectory_common",loader);
    outArray[ctr]["PolynomialPlan"] = msgClassPtr_polynomial_plan->get_arr(factory, &currentElement_polynomial_plan, loader);
    // polynomial_plan_4D
    auto currentElement_polynomial_plan_4D = (msg + ctr)->polynomial_plan_4D;
    auto msgClassPtr_polynomial_plan_4D = getCommonObject<mav_planning_msgs::PolynomialTrajectory4D>("mav_planning_msgs_msg_PolynomialTrajectory4D_common",loader);
    outArray[ctr]["PolynomialPlan4D"] = msgClassPtr_polynomial_plan_4D->get_arr(factory, &currentElement_polynomial_plan_4D, loader);
    // sampled_plan
    auto currentElement_sampled_plan = (msg + ctr)->sampled_plan;
    auto msgClassPtr_sampled_plan = getCommonObject<trajectory_msgs::MultiDOFJointTrajectory>("trajectory_msgs_msg_MultiDOFJointTrajectory_common",loader);
    outArray[ctr]["SampledPlan"] = msgClassPtr_sampled_plan->get_arr(factory, &currentElement_sampled_plan, loader);
    }
    return std::move(outArray);
  } 
class MAV_PLANNING_MSGS_EXPORT mav_planning_msgs_PlannerService_service : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_planning_msgs_PlannerService_service(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
    virtual std::shared_ptr<MATLABSvcServerInterface> generateSvcServerInterface();
    virtual std::shared_ptr<MATLABSvcClientInterface> generateSvcClientInterface();
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_planning_msgs_PlannerService_service::generatePublisherInterface(ElementType type){
    std::shared_ptr<MATLABPublisherInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSPublisherImpl<mav_planning_msgs::PlannerService::Request,mav_planning_msgs_msg_PlannerServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSPublisherImpl<mav_planning_msgs::PlannerService::Response,mav_planning_msgs_msg_PlannerServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSubscriberInterface> 
          mav_planning_msgs_PlannerService_service::generateSubscriberInterface(ElementType type){
    std::shared_ptr<MATLABSubscriberInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PlannerService::Request,mav_planning_msgs::PlannerService::Request::ConstPtr,mav_planning_msgs_msg_PlannerServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSSubscriberImpl<mav_planning_msgs::PlannerService::Response,mav_planning_msgs::PlannerService::Response::ConstPtr,mav_planning_msgs_msg_PlannerServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
  std::shared_ptr<MATLABSvcServerInterface> 
          mav_planning_msgs_PlannerService_service::generateSvcServerInterface(){
    return std::make_shared<ROSSvcServerImpl<mav_planning_msgs::PlannerService::Request,mav_planning_msgs::PlannerService::Response,mav_planning_msgs_msg_PlannerServiceRequest_common,mav_planning_msgs_msg_PlannerServiceResponse_common>>();
  }
  std::shared_ptr<MATLABSvcClientInterface> 
          mav_planning_msgs_PlannerService_service::generateSvcClientInterface(){
    return std::make_shared<ROSSvcClientImpl<mav_planning_msgs::PlannerService,mav_planning_msgs::PlannerService::Request,mav_planning_msgs::PlannerService::Response,mav_planning_msgs_msg_PlannerServiceRequest_common,mav_planning_msgs_msg_PlannerServiceResponse_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface> 
          mav_planning_msgs_PlannerService_service::generateRosbagWriterInterface(ElementType type){
    std::shared_ptr<MATLABRosbagWriterInterface> ptr;
    if(type == eRequest){
        ptr = std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PlannerService::Request,mav_planning_msgs_msg_PlannerServiceRequest_common>>();
    }else if(type == eResponse){
        ptr = std::make_shared<ROSBagWriterImpl<mav_planning_msgs::PlannerService::Response,mav_planning_msgs_msg_PlannerServiceResponse_common>>();
    }else{
        throw std::invalid_argument("Wrong input, Expected 'Request' or 'Response'");
    }
    return ptr;
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PlannerServiceRequest_common, MATLABROSMsgInterface<mav_planning_msgs::PlannerService::Request>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_msg_PlannerServiceResponse_common, MATLABROSMsgInterface<mav_planning_msgs::PlannerService::Response>)
CLASS_LOADER_REGISTER_CLASS(mav_planning_msgs_PlannerService_service, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1
