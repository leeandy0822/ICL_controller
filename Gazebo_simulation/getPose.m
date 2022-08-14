function [uav1,uav2,uav3,uav4,payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose)

    % subscribers get data
    System_pose = receive(system_pose,2);

    
    pose_payload_data = System_pose.Payload;
    pose_uav1_data = System_pose.Uav1;
    pose_uav2_data = System_pose.Uav2;
    pose_uav3_data = System_pose.Uav3;
    pose_uav4_data = System_pose.Uav4;

    %% Get payload position and orientation
    payload.x = [ pose_payload_data.Position.X; pose_payload_data.Position.Y;pose_payload_data.Position.Z;];
    payload.q = [pose_payload_data.Orientation.W pose_payload_data.Orientation.X pose_payload_data.Orientation.Y pose_payload_data.Orientation.Z];
    payload.R = quat2rotm(payload.q);
    payload.eul = quat2eul(payload.q);

    %% Get UAV1 payload position and orientation
    uav1.x = [pose_uav1_data.Position.X;pose_uav1_data.Position.Y; pose_uav1_data.Position.Z];    
    uav1.q = [pose_uav1_data.Orientation.W pose_uav1_data.Orientation.X pose_uav1_data.Orientation.Y pose_uav1_data.Orientation.Z];
    uav1.R = quat2rotm(uav1.q);
    uav1.eul = quat2eul(uav1.q);

    %% Get UAV2 payload position and orientation
    uav2.x = [pose_uav2_data.Position.X; pose_uav2_data.Position.Y; pose_uav2_data.Position.Z];
    uav2.q = [pose_uav2_data.Orientation.W pose_uav2_data.Orientation.X pose_uav2_data.Orientation.Y pose_uav2_data.Orientation.Z];
    uav2.R = quat2rotm(uav2.q);
    uav2.eul = quat2eul(uav2.q);

    %% Get UAV3 payload position and orientation    
    uav3.x = [pose_uav3_data.Position.X; pose_uav3_data.Position.Y; pose_uav3_data.Position.Z];
    uav3.q = [pose_uav3_data.Orientation.W pose_uav3_data.Orientation.X pose_uav3_data.Orientation.Y pose_uav3_data.Orientation.Z];
    uav3.R = quat2rotm(uav3.q);
    uav3.eul = quat2eul(uav3.q);

    %% Get UAV4 payload position and orientation
    uav4.x = [pose_uav4_data.Position.X; pose_uav4_data.Position.Y; pose_uav4_data.Position.Z];
    uav4.q = [pose_uav4_data.Orientation.W pose_uav4_data.Orientation.X pose_uav4_data.Orientation.Y pose_uav4_data.Orientation.Z];
    uav4.R = quat2rotm(uav4.q);
    uav4.eul = quat2eul(uav4.q);
end