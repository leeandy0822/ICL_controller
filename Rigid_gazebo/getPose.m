function [uav1,uav2,uav3, uav4, multirotor] = getPose(uav1,uav2,uav3,uav4, multirotor,system_pose,i)

    % subscribers get data
    
    System_pose = receive(system_pose,2);
    pose_payload_data = System_pose.Payload;
    pose_payload_acc = System_pose.PayloadAcc;
    pose_payload_vel = System_pose.PayloadVel;
    pose_uav1_data = System_pose.Uav1;
    pose_uav2_data = System_pose.Uav2;
    pose_uav3_data = System_pose.Uav3;
    pose_uav4_data = System_pose.Uav4;

    %% Get payload position and orientation
    multirotor.x(:,i) = [ pose_payload_data.Position.X; pose_payload_data.Position.Y;pose_payload_data.Position.Z];
    q =  [pose_payload_data.Orientation.W pose_payload_data.Orientation.X pose_payload_data.Orientation.Y pose_payload_data.Orientation.Z];
    temp_R = quat2rotm(q);
    multirotor.a = pose_payload_acc;
    multirotor.v(:,i) = [pose_payload_vel.X ;pose_payload_vel.Y ;pose_payload_vel.Z];
    multirotor.R(:,i) = reshape(temp_R,[9,1]);
    multirotor.W(:,i) = [System_pose.PayloadW.X ; System_pose.PayloadW.Y; System_pose.PayloadW.Z];
    %% Get UAV1 payload position and orientation
    uav1.x = [pose_uav1_data.Position.X;pose_uav1_data.Position.Y; pose_uav1_data.Position.Z];    

    %% Get UAV2 payload position and orientation
    uav2.x = [pose_uav2_data.Position.X; pose_uav2_data.Position.Y; pose_uav2_data.Position.Z];

    %% Get UAV3 payload position and orientation    
    uav3.x = [pose_uav3_data.Position.X; pose_uav3_data.Position.Y; pose_uav3_data.Position.Z];

    %% Get UAV3 payload position and orientation    
    uav4.x = [pose_uav4_data.Position.X; pose_uav4_data.Position.Y; pose_uav4_data.Position.Z];


end