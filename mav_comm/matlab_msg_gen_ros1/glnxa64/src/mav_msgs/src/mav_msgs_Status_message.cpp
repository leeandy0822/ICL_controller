// Copyright 2019-2021 The MathWorks, Inc.
// Common copy functions for mav_msgs/Status
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
#include "mav_msgs/Status.h"
#include "visibility_control.h"
#include "MATLABROSMsgInterface.hpp"
#include "ROSPubSubTemplates.hpp"
class MAV_MSGS_EXPORT mav_msgs_msg_Status_common : public MATLABROSMsgInterface<mav_msgs::Status> {
  public:
    virtual ~mav_msgs_msg_Status_common(){}
    virtual void copy_from_struct(mav_msgs::Status* msg, const matlab::data::Struct& arr, MultiLibLoader loader); 
    //----------------------------------------------------------------------------
    virtual MDArray_T get_arr(MDFactory_T& factory, const mav_msgs::Status* msg, MultiLibLoader loader, size_t size = 1);
};
  void mav_msgs_msg_Status_common::copy_from_struct(mav_msgs::Status* msg, const matlab::data::Struct& arr,
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
        //vehicle_name
        const matlab::data::CharArray vehicle_name_arr = arr["VehicleName"];
        msg->vehicle_name = vehicle_name_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'VehicleName' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'VehicleName' is wrong type; expected a string.");
    }
    try {
        //vehicle_type
        const matlab::data::CharArray vehicle_type_arr = arr["VehicleType"];
        msg->vehicle_type = vehicle_type_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'VehicleType' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'VehicleType' is wrong type; expected a string.");
    }
    try {
        //battery_voltage
        const matlab::data::TypedArray<float> battery_voltage_arr = arr["BatteryVoltage"];
        msg->battery_voltage = battery_voltage_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'BatteryVoltage' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'BatteryVoltage' is wrong type; expected a single.");
    }
    try {
        //rc_command_mode
        const matlab::data::CharArray rc_command_mode_arr = arr["RcCommandMode"];
        msg->rc_command_mode = rc_command_mode_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'RcCommandMode' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'RcCommandMode' is wrong type; expected a string.");
    }
    try {
        //command_interface_enabled
        const matlab::data::TypedArray<bool> command_interface_enabled_arr = arr["CommandInterfaceEnabled"];
        msg->command_interface_enabled = command_interface_enabled_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'CommandInterfaceEnabled' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'CommandInterfaceEnabled' is wrong type; expected a logical.");
    }
    try {
        //flight_time
        const matlab::data::TypedArray<float> flight_time_arr = arr["FlightTime"];
        msg->flight_time = flight_time_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'FlightTime' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'FlightTime' is wrong type; expected a single.");
    }
    try {
        //system_uptime
        const matlab::data::TypedArray<float> system_uptime_arr = arr["SystemUptime"];
        msg->system_uptime = system_uptime_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'SystemUptime' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'SystemUptime' is wrong type; expected a single.");
    }
    try {
        //cpu_load
        const matlab::data::TypedArray<float> cpu_load_arr = arr["CpuLoad"];
        msg->cpu_load = cpu_load_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'CpuLoad' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'CpuLoad' is wrong type; expected a single.");
    }
    try {
        //motor_status
        const matlab::data::CharArray motor_status_arr = arr["MotorStatus"];
        msg->motor_status = motor_status_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'MotorStatus' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'MotorStatus' is wrong type; expected a string.");
    }
    try {
        //in_air
        const matlab::data::TypedArray<bool> in_air_arr = arr["InAir"];
        msg->in_air = in_air_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'InAir' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'InAir' is wrong type; expected a logical.");
    }
    try {
        //gps_status
        const matlab::data::CharArray gps_status_arr = arr["GpsStatus"];
        msg->gps_status = gps_status_arr.toAscii();
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'GpsStatus' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'GpsStatus' is wrong type; expected a string.");
    }
    try {
        //gps_num_satellites
        const matlab::data::TypedArray<int32_t> gps_num_satellites_arr = arr["GpsNumSatellites"];
        msg->gps_num_satellites = gps_num_satellites_arr[0];
    } catch (matlab::data::InvalidFieldNameException&) {
        throw std::invalid_argument("Field 'GpsNumSatellites' is missing.");
    } catch (matlab::Exception&) {
        throw std::invalid_argument("Field 'GpsNumSatellites' is wrong type; expected a int32.");
    }
  }
  //----------------------------------------------------------------------------
  MDArray_T mav_msgs_msg_Status_common::get_arr(MDFactory_T& factory, const mav_msgs::Status* msg,
       MultiLibLoader loader, size_t size) {
    auto outArray = factory.createStructArray({size,1},{"MessageType","Header","VehicleName","VehicleType","BatteryVoltage","RcCommandMode","CommandInterfaceEnabled","FlightTime","SystemUptime","CpuLoad","MotorStatus","InAir","GpsStatus","GpsNumSatellites","RCCOMMANDATTITUDE","RCCOMMANDATTITUDEHEIGHT","RCCOMMANDPOSITION","MOTORSTATUSRUNNING","MOTORSTATUSSTOPPED","MOTORSTATUSSTARTING","MOTORSTATUSSTOPPING","GPSSTATUSLOCK","GPSSTATUSNOLOCK"});
    for(size_t ctr = 0; ctr < size; ctr++){
    outArray[ctr]["MessageType"] = factory.createCharArray("mav_msgs/Status");
    // header
    auto currentElement_header = (msg + ctr)->header;
    auto msgClassPtr_header = getCommonObject<std_msgs::Header>("std_msgs_msg_Header_common",loader);
    outArray[ctr]["Header"] = msgClassPtr_header->get_arr(factory, &currentElement_header, loader);
    // vehicle_name
    auto currentElement_vehicle_name = (msg + ctr)->vehicle_name;
    outArray[ctr]["VehicleName"] = factory.createCharArray(currentElement_vehicle_name);
    // vehicle_type
    auto currentElement_vehicle_type = (msg + ctr)->vehicle_type;
    outArray[ctr]["VehicleType"] = factory.createCharArray(currentElement_vehicle_type);
    // battery_voltage
    auto currentElement_battery_voltage = (msg + ctr)->battery_voltage;
    outArray[ctr]["BatteryVoltage"] = factory.createScalar(currentElement_battery_voltage);
    // rc_command_mode
    auto currentElement_rc_command_mode = (msg + ctr)->rc_command_mode;
    outArray[ctr]["RcCommandMode"] = factory.createCharArray(currentElement_rc_command_mode);
    // command_interface_enabled
    auto currentElement_command_interface_enabled = (msg + ctr)->command_interface_enabled;
    outArray[ctr]["CommandInterfaceEnabled"] = factory.createScalar(static_cast<bool>(currentElement_command_interface_enabled));
    // flight_time
    auto currentElement_flight_time = (msg + ctr)->flight_time;
    outArray[ctr]["FlightTime"] = factory.createScalar(currentElement_flight_time);
    // system_uptime
    auto currentElement_system_uptime = (msg + ctr)->system_uptime;
    outArray[ctr]["SystemUptime"] = factory.createScalar(currentElement_system_uptime);
    // cpu_load
    auto currentElement_cpu_load = (msg + ctr)->cpu_load;
    outArray[ctr]["CpuLoad"] = factory.createScalar(currentElement_cpu_load);
    // motor_status
    auto currentElement_motor_status = (msg + ctr)->motor_status;
    outArray[ctr]["MotorStatus"] = factory.createCharArray(currentElement_motor_status);
    // in_air
    auto currentElement_in_air = (msg + ctr)->in_air;
    outArray[ctr]["InAir"] = factory.createScalar(static_cast<bool>(currentElement_in_air));
    // gps_status
    auto currentElement_gps_status = (msg + ctr)->gps_status;
    outArray[ctr]["GpsStatus"] = factory.createCharArray(currentElement_gps_status);
    // gps_num_satellites
    auto currentElement_gps_num_satellites = (msg + ctr)->gps_num_satellites;
    outArray[ctr]["GpsNumSatellites"] = factory.createScalar(currentElement_gps_num_satellites);
    // RC_COMMAND_ATTITUDE
    auto currentElement_RC_COMMAND_ATTITUDE = (msg + ctr)->RC_COMMAND_ATTITUDE;
    outArray[ctr]["RCCOMMANDATTITUDE"] = factory.createCharArray(currentElement_RC_COMMAND_ATTITUDE);
    // RC_COMMAND_ATTITUDE_HEIGHT
    auto currentElement_RC_COMMAND_ATTITUDE_HEIGHT = (msg + ctr)->RC_COMMAND_ATTITUDE_HEIGHT;
    outArray[ctr]["RCCOMMANDATTITUDEHEIGHT"] = factory.createCharArray(currentElement_RC_COMMAND_ATTITUDE_HEIGHT);
    // RC_COMMAND_POSITION
    auto currentElement_RC_COMMAND_POSITION = (msg + ctr)->RC_COMMAND_POSITION;
    outArray[ctr]["RCCOMMANDPOSITION"] = factory.createCharArray(currentElement_RC_COMMAND_POSITION);
    // MOTOR_STATUS_RUNNING
    auto currentElement_MOTOR_STATUS_RUNNING = (msg + ctr)->MOTOR_STATUS_RUNNING;
    outArray[ctr]["MOTORSTATUSRUNNING"] = factory.createCharArray(currentElement_MOTOR_STATUS_RUNNING);
    // MOTOR_STATUS_STOPPED
    auto currentElement_MOTOR_STATUS_STOPPED = (msg + ctr)->MOTOR_STATUS_STOPPED;
    outArray[ctr]["MOTORSTATUSSTOPPED"] = factory.createCharArray(currentElement_MOTOR_STATUS_STOPPED);
    // MOTOR_STATUS_STARTING
    auto currentElement_MOTOR_STATUS_STARTING = (msg + ctr)->MOTOR_STATUS_STARTING;
    outArray[ctr]["MOTORSTATUSSTARTING"] = factory.createCharArray(currentElement_MOTOR_STATUS_STARTING);
    // MOTOR_STATUS_STOPPING
    auto currentElement_MOTOR_STATUS_STOPPING = (msg + ctr)->MOTOR_STATUS_STOPPING;
    outArray[ctr]["MOTORSTATUSSTOPPING"] = factory.createCharArray(currentElement_MOTOR_STATUS_STOPPING);
    // GPS_STATUS_LOCK
    auto currentElement_GPS_STATUS_LOCK = (msg + ctr)->GPS_STATUS_LOCK;
    outArray[ctr]["GPSSTATUSLOCK"] = factory.createCharArray(currentElement_GPS_STATUS_LOCK);
    // GPS_STATUS_NO_LOCK
    auto currentElement_GPS_STATUS_NO_LOCK = (msg + ctr)->GPS_STATUS_NO_LOCK;
    outArray[ctr]["GPSSTATUSNOLOCK"] = factory.createCharArray(currentElement_GPS_STATUS_NO_LOCK);
    }
    return std::move(outArray);
  } 
class MAV_MSGS_EXPORT mav_msgs_Status_message : public ROSMsgElementInterfaceFactory {
  public:
    virtual ~mav_msgs_Status_message(){}
    virtual std::shared_ptr<MATLABPublisherInterface> generatePublisherInterface(ElementType type);
    virtual std::shared_ptr<MATLABSubscriberInterface> generateSubscriberInterface(ElementType type);
    virtual std::shared_ptr<MATLABRosbagWriterInterface> generateRosbagWriterInterface(ElementType type);
};  
  std::shared_ptr<MATLABPublisherInterface> 
          mav_msgs_Status_message::generatePublisherInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSPublisherImpl<mav_msgs::Status,mav_msgs_msg_Status_common>>();
  }
  std::shared_ptr<MATLABSubscriberInterface> 
         mav_msgs_Status_message::generateSubscriberInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSSubscriberImpl<mav_msgs::Status,mav_msgs::Status::ConstPtr,mav_msgs_msg_Status_common>>();
  }
#include "ROSbagTemplates.hpp" 
  std::shared_ptr<MATLABRosbagWriterInterface>
         mav_msgs_Status_message::generateRosbagWriterInterface(ElementType type){
    if(type != eMessage){
        throw std::invalid_argument("Wrong input, Expected eMessage");
    }
    return std::make_shared<ROSBagWriterImpl<mav_msgs::Status,mav_msgs_msg_Status_common>>();
  }
#include "register_macro.hpp"
// Register the component with class_loader.
// This acts as a sort of entry point, allowing the component to be discoverable when its library
// is being loaded into a running process.
CLASS_LOADER_REGISTER_CLASS(mav_msgs_msg_Status_common, MATLABROSMsgInterface<mav_msgs::Status>)
CLASS_LOADER_REGISTER_CLASS(mav_msgs_Status_message, ROSMsgElementInterfaceFactory)
#ifdef _MSC_VER
#pragma warning(pop)
#else
#pragma GCC diagnostic pop
#endif //_MSC_VER
//gen-1