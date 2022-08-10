function [uav1,uav2,uav3,uav4,payload] = getPose(uav1,uav2,uav3,uav4,payload)

    % subscribers get data
    tic
    pose_payload_data = receive(payload.sub,1);
    pose_uav1_data = receive(uav1.sub,1);
    pose_uav2_data = receive(uav2.sub,1);
    pose_uav3_data = receive(uav3.sub,1);
    pose_uav4_data = receive(uav4.sub,1);
    toc
    %% Get payload position and orientation
    tic
    payload.q = [pose_payload_data.Pose.Pose.Orientation.W pose_payload_data.Pose.Pose.Orientation.X pose_payload_data.Pose.Pose.Orientation.Y pose_payload_data.Pose.Pose.Orientation.Z];
    payload.pos = [pose_payload_data.Pose.Pose.Position.X pose_payload_data.Pose.Pose.Position.Y pose_payload_data.Pose.Pose.Position.Z];
    payload.R = quat2rotm(payload.q);
    payload.eul = quat2eul(payload.q);
    toc
    %% Get UAV1 payload position and orientation
    uav1.q = [pose_uav1_data.Orientation.W pose_uav1_data.Orientation.X pose_uav1_data.Orientation.Y pose_uav1_data.Orientation.Z];
%     uav1.pos = [uav1.pos_x uav1.pos_y uav1.pos_z];
    uav1.R = quat2rotm(uav1.q);
    uav1.eul = quat2eul(uav1.q);

    %% Get UAV2 payload position and orientation
%     uav2.pos_x = pose_uav2_data.Position.X;
%     uav2.pos_y = pose_uav2_data.Position.Y;
%     uav2.pos_z = pose_uav2_data.Position.Z;
    uav2.q = [pose_uav2_data.Orientation.W pose_uav2_data.Orientation.X pose_uav2_data.Orientation.Y pose_uav2_data.Orientation.Z];

%     uav2.pos = [uav2.pos_x uav2.pos_y uav2.pos_z];
    uav2.R = quat2rotm(uav2.q);
    uav2.eul = quat2eul(uav2.q);

    %% Get UAV3 payload position and orientation
%     uav3.pos_x = pose_uav3_data.Position.X;
%     uav3.pos_y = pose_uav3_data.Position.Y;
%     uav3.pos_z = pose_uav3_data.Position.Z;
    uav3.q = [pose_uav3_data.Orientation.W pose_uav3_data.Orientation.X pose_uav3_data.Orientation.Y pose_uav3_data.Orientation.Z];

%     uav3.pos = [uav3.pos_x uav3.pos_y uav3.pos_z];
    uav3.R = quat2rotm(uav3.q);
    uav3.eul = quat2eul(uav3.q);

    %% Get UAV4 payload position and orientation
%     uav4.pos_x = pose_uav4_data.Position.X;
%     uav4.pos_y = pose_uav4_data.Position.Y;
%     uav4.pos_z = pose_uav4_data.Position.Z;
    uav4.q = [pose_uav4_data.Orientation.W pose_uav4_data.Orientation.X pose_uav4_data.Orientation.Y pose_uav4_data.Orientation.Z];
%     uav4.pos = [uav4.pos_x uav4.pos_y uav4.pos_z];
    uav4.R = quat2rotm(uav4.q);
    uav4.eul = quat2eul(uav4.q);
end