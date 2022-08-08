clear all, close all, clc;

addpath('./tools/')
addpath('./rosutilities/')

setenv('ROS_IP','127.0.0.1')
rosinit

% --- now launch the gazebo files ---

% get topic from payload and uavs
pose = rossubscriber("/sensor_pack/payload_POSE_GT","DataFormat","struct");
uav1_pose = rossubscriber("/firefly1/ground_truth/position","DataFormat","struct");
uav2_pose = rossubscriber("/firefly2/ground_truth/position","DataFormat","struct");
uav3_pose = rossubscriber("/firefly3/ground_truth/position","DataFormat","struct");
uav4_pose = rossubscriber("/firefly4/ground_truth/position","DataFormat","struct");
uav1_command = rossubscriber("firefly1/roll_pitch_yawrate_thrust_controller_node","DataFormat","struct");
pause(1);


% Get the groundtruth of the payload position and orientation
while true

    pose_data = receive(pose,10);
    pose_uav1 = receive(uav1_pose,10);
    pose_uav2 = receive(uav2_pose,10);
    pose_uav3 = receive(uav3_pose,10);
    pose_uav4 = receive(uav4_pose,10);
    uav1_data = receive(uav1_command, 10);
    pose_x = pose_data.Pose.Pose.Position.X;
    pose_y = pose_data.Pose.Pose.Position.Y;
    pose_z = pose_data.Pose.Pose.Position.Z;
    q_x = pose_data.Pose.Pose.Orientation.X;
    q_y = pose_data.Pose.Pose.Orientation.Y;
    q_z = pose_data.Pose.Pose.Orientation.Z;
    q_w = pose_data.Pose.Pose.Orientation.W;
    
    q = [q_w q_x q_y q_z];
    position_world = [pose_x pose_y pose_z];
    body2world = quat2rotm(q);
end

>>>>>>> 7b112258313b5a71842f7783de6938e145984ace
