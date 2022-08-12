function [uav1,uav2,uav3,uav4,payload] = getPose(uav1,uav2,uav3,uav4,payload,system_pose)

    % subscribers get data

    System_pose = receive(system_pose,2);

    pose_payload_data = System_pose.Payload;
    pose_uav1_data = System_pose.Uav1;
    pose_uav2_data = System_pose.Uav2;
    pose_uav3_data = System_pose.Uav3;
    pose_uav4_data = System_pose.Uav4;

    %% Get payload position and orientation
    payload.pos_x = pose_payload_data.Position.X;
    payload.pos_y = pose_payload_data.Position.Y;
    payload.pos_z = pose_payload_data.Position.Z;
    payload.q = [pose_payload_data.Orientation.W pose_payload_data.Orientation.X pose_payload_data.Orientation.Y pose_payload_data.Orientation.Z];
    payload.pos = [payload.pos_x payload.pos_y payload.pos_z];
    payload.R = quat2rotm(payload.q);
    payload.eul = quat2eul(payload.q);

    %% Get UAV1 payload position and orientation
    uav1.pos_x = pose_uav1_data.Position.X;
    uav1.pos_y = pose_uav1_data.Position.Y;
    uav1.pos_z = pose_uav1_data.Position.Z;
    uav1.q = [pose_uav1_data.Orientation.W pose_uav1_data.Orientation.X pose_uav1_data.Orientation.Y pose_uav1_data.Orientation.Z];
    uav1.pos = [uav1.pos_x uav1.pos_y uav1.pos_z];
    uav1.R = quat2rotm(uav1.q);
    uav1.eul = quat2eul(uav1.q);

    %% Get UAV2 payload position and orientation
    uav2.pos_x = pose_uav2_data.Position.X;
    uav2.pos_y = pose_uav2_data.Position.Y;
    uav2.pos_z = pose_uav2_data.Position.Z;
    uav2.q = [pose_uav2_data.Orientation.W pose_uav2_data.Orientation.X pose_uav2_data.Orientation.Y pose_uav2_data.Orientation.Z];
    uav2.pos = [uav2.pos_x uav2.pos_y uav2.pos_z];
    uav2.R = quat2rotm(uav2.q);
    uav2.eul = quat2eul(uav2.q);

    %% Get UAV3 payload position and orientation
    uav3.pos_x = pose_uav3_data.Position.X;
    uav3.pos_y = pose_uav3_data.Position.Y;
    uav3.pos_z = pose_uav3_data.Position.Z;
    uav3.q = [pose_uav3_data.Orientation.W pose_uav3_data.Orientation.X pose_uav3_data.Orientation.Y pose_uav3_data.Orientation.Z];
    uav3.pos = [uav3.pos_x uav3.pos_y uav3.pos_z];
    uav3.R = quat2rotm(uav3.q);
    uav3.eul = quat2eul(uav3.q);

    %% Get UAV4 payload position and orientation
    uav4.pos_x = pose_uav4_data.Position.X;
    uav4.pos_y = pose_uav4_data.Position.Y;
    uav4.pos_z = pose_uav4_data.Position.Z;
    uav4.q = [pose_uav4_data.Orientation.W pose_uav4_data.Orientation.X pose_uav4_data.Orientation.Y pose_uav4_data.Orientation.Z];
    uav4.pos = [uav4.pos_x uav4.pos_y uav4.pos_z];
    uav4.R = quat2rotm(uav4.q);
    uav4.eul = quat2eul(uav4.q);
end