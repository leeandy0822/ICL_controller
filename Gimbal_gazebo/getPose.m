function [uav1,uav2,uav3,payload] = getPose(uav1,uav2,uav3,payload,system_pose,i)

    % subscribers get data
    
    System_pose = receive(system_pose,2);
    pose_payload_data = System_pose.Payload;
    pose_payload_acc = System_pose.PayloadAcc;
    pose_payload_vel = System_pose.PayloadVel;
    pose_uav1_data = System_pose.Uav1;
    pose_uav1_a = System_pose.Uav1Acc;

    pose_uav2_data = System_pose.Uav2;
    pose_uav2_a = System_pose.Uav2Acc;

    pose_uav3_data = System_pose.Uav3;
    pose_uav3_a = System_pose.Uav3Acc;

    pose_uav4_data = System_pose.Uav4;
    pose_uav4_a = System_pose.Uav4Acc;


    %% Get payload position and orientation
    payload.x(:,i) = [ pose_payload_data.Position.X; pose_payload_data.Position.Y;pose_payload_data.Position.Z];
    q =  [pose_payload_data.Orientation.W pose_payload_data.Orientation.X pose_payload_data.Orientation.Y pose_payload_data.Orientation.Z];
    temp_R = quat2rotm(q);
    payload.a = pose_payload_acc;
    payload.v(:,i) = [pose_payload_vel.X ;pose_payload_vel.Y ;pose_payload_vel.Z];
    payload.R(:,i) = reshape(temp_R,[9,1]);
    payload.W(:,i) = [System_pose.PayloadW.X ; System_pose.PayloadW.Y; System_pose.PayloadW.Z];
    %% Get UAV1 payload position and orientation
    uav1.x = [pose_uav1_data.Position.X;pose_uav1_data.Position.Y; pose_uav1_data.Position.Z];    
    uav1.q = [pose_uav1_data.Orientation.W pose_uav1_data.Orientation.X pose_uav1_data.Orientation.Y pose_uav1_data.Orientation.Z];
    uav1.R = quat2rotm(uav1.q);
    uav1.eul = quat2eul(uav1.q);
    uav1.a = pose_uav1_a;

    %% Get UAV2 payload position and orientation
    uav2.x = [pose_uav2_data.Position.X; pose_uav2_data.Position.Y; pose_uav2_data.Position.Z];
    uav2.q = [pose_uav2_data.Orientation.W pose_uav2_data.Orientation.X pose_uav2_data.Orientation.Y pose_uav2_data.Orientation.Z];
    uav2.R = quat2rotm(uav2.q);
    uav2.eul = quat2eul(uav2.q);
    uav2.a = pose_uav2_a;

    %% Get UAV3 payload position and orientation    
    uav3.x = [pose_uav3_data.Position.X; pose_uav3_data.Position.Y; pose_uav3_data.Position.Z];
    uav3.q = [pose_uav3_data.Orientation.W pose_uav3_data.Orientation.X pose_uav3_data.Orientation.Y pose_uav3_data.Orientation.Z];
    uav3.R = quat2rotm(uav3.q);
    uav3.eul = quat2eul(uav3.q);
    uav3.a = pose_uav3_a;

end