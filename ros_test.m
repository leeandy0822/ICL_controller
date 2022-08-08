clear all, close all, clc;


%  rosinit('127.0.0.1')

% --- now launch the gazebo files ---

% get topic from payload and uavs
payload_pose = rossubscriber("/sensor_pack/groundtruth/pose","DataFormat","struct");
uav1_pose = rossubscriber("/firefly1/ground_truth/pose","DataFormat","struct");
uav2_pose = rossubscriber("/firefly2/ground_truth/pose","DataFormat","struct");
uav3_pose = rossubscriber("/firefly3/ground_truth/pose","DataFormat","struct");
uav4_pose = rossubscriber("/firefly4/ground_truth/pose","DataFormat","struct");

[pub1, msg1] = rospublisher("/firefly1/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");


thrust = rosmessage('geometry_msgs/Vector3');


pause(1);

payload = rigidbody_dynamics;
uav1 = rigidbody_dynamics;
uav2 = rigidbody_dynamics;
uav3 = rigidbody_dynamics;
uav4 = rigidbody_dynamics;

% Get the groundtruth of the payload position and orientation
while true

    % subscribers get data
    pose_payload_data = receive(payload_pose,10);
    pose_uav1_data = receive(uav1_pose,10);
    pose_uav2_data = receive(uav2_pose,10);
    pose_uav3_data = receive(uav3_pose,10);
    pose_uav4_data = receive(uav4_pose,10);

    %% Get payload position and orientation
    payload.pos_x = pose_payload_data.Pose.Pose.Position.X;
    payload.pos_y = pose_payload_data.Pose.Pose.Position.Y;
    payload.pos_z = pose_payload_data.Pose.Pose.Position.Z;
    payload.q_x = pose_payload_data.Pose.Pose.Orientation.X;
    payload.q_y = pose_payload_data.Pose.Pose.Orientation.Y;
    payload.q_z = pose_payload_data.Pose.Pose.Orientation.Z;
    payload.q_w = pose_payload_data.Pose.Pose.Orientation.W;
    payload.q = [payload.q_w payload.q_x payload.q_y payload.q_z];

    payload.pos = [payload.pos_x payload.pos_y payload.pos_z];
    payload.R = quat2rotm(payload.q);
    payload.eul = quat2eul(payload.q);


    %% Get UAV1 payload position and orientation
    uav1.pos_x = pose_uav1_data.Position.X;
    uav1.pos_y = pose_uav1_data.Position.Y;
    uav1.pos_z = pose_uav1_data.Position.Z;
    uav1.q_x = pose_uav1_data.Orientation.X;
    uav1.q_y = pose_uav1_data.Orientation.Y;
    uav1.q_z = pose_uav1_data.Orientation.Z;
    uav1.q_w = pose_uav1_data.Orientation.W;

    uav1.q = [uav1.q_w uav1.q_x uav1.q_y uav1.q_z];
    uav1.pos = [uav1.pos_x uav1.pos_y uav1.pos_z];
    uav1.R = quat2rotm(uav1.q);
    uav1.eul = quat2eul(uav1.q);
    u1 = [ 5 0 22];

    [R1,P1,T1] = force_to_uav(u1,uav1,payload);
    msg1.Roll = R1;
    msg1.Pitch = P1;
    msg1.Thrust = T1;
    send(pub1,msg1);

    %% Get UAV2 payload position and orientation
    uav2.pos_x = pose_uav2_data.Position.X;
    uav2.pos_y = pose_uav2_data.Position.Y;
    uav2.pos_z = pose_uav2_data.Position.Z;
    uav2.q_x = pose_uav2_data.Orientation.X;
    uav2.q_y = pose_uav2_data.Orientation.Y;
    uav2.q_z = pose_uav2_data.Orientation.Z;
    uav2.q_w = pose_uav2_data.Orientation.W;

    uav2.q = [uav2.q_w uav2.q_x uav2.q_y uav2.q_z];
    uav2.pos = [uav2.pos_x uav2.pos_y uav2.pos_z];
    uav2.R = quat2rotm(uav2.q);
    uav2.eul = quat2eul(uav2.q);

    %% Get UAV3 payload position and orientation
    uav3.pos_x = pose_uav3_data.Position.X;
    uav3.pos_y = pose_uav3_data.Position.Y;
    uav3.pos_z = pose_uav3_data.Position.Z;
    uav3.q_x = pose_uav3_data.Orientation.X;
    uav3.q_y = pose_uav3_data.Orientation.Y;
    uav3.q_z = pose_uav3_data.Orientation.Z;
    uav3.q_w = pose_uav3_data.Orientation.W;

    uav3.q = [uav3.q_w uav3.q_x uav3.q_y uav3.q_z];
    uav3.pos = [uav3.pos_x uav3.pos_y uav3.pos_z];
    uav3.R = quat2rotm(uav3.q);
    uav3.eul = quat2eul(uav3.q);


    %% Get UAV4 payload position and orientation
    uav4.pos_x = pose_uav4_data.Position.X;
    uav4.pos_y = pose_uav4_data.Position.Y;
    uav4.pos_z = pose_uav4_data.Position.Z;
    uav4.q_x = pose_uav4_data.Orientation.X;
    uav4.q_y = pose_uav4_data.Orientation.Y;
    uav4.q_z = pose_uav4_data.Orientation.Z;
    uav4.q_w = pose_uav4_data.Orientation.W;

    uav4.q = [uav4.q_w uav4.q_x uav4.q_y uav4.q_z];
    uav4.pos = [uav4.pos_x uav4.pos_y uav4.pos_z];
    uav4.R = quat2rotm(uav4.q);
    uav4.eul = quat2eul(uav4.q);

end

function [roll,pitch,thrust] = force_to_uav(force,uav,payload)
    
    thrust = rosmessage('geometry_msgs/Vector3');
    yaw_R = rotz(rad2deg(uav.eul(1)));
    force_temp = 1/norm(force)*yaw_R'*payload.R*force';
    roll = -asin(force_temp(2));
    pitch = atan(force_temp(1)/force_temp(3));
    thrust.Z = norm(force);

end

