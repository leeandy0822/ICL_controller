function [uav1,uav2,uav3,uav4,payload] = getPose(uav1,uav2,uav3,uav4,payload)

    % subscribers get data
    pose_payload_data = receive(payload.sub,10);
    pose_uav1_data = receive(uav1.sub,10);
    pose_uav2_data = receive(uav2.sub,10);
    pose_uav3_data = receive(uav3.sub,10);
    pose_uav4_data = receive(uav4.sub,10);

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