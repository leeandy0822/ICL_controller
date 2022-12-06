function [data, info] = rollPitchYawrateThrust
%RollPitchYawrateThrust gives an empty data for mav_msgs/RollPitchYawrateThrust
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_msgs/RollPitchYawrateThrust';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Roll, info.Roll] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Pitch, info.Pitch] = ros.internal.ros.messages.ros.default_type('double',1);
[data.YawRate, info.YawRate] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Thrust, info.Thrust] = ros.internal.ros.messages.geometry_msgs.vector3;
info.Thrust.MLdataType = 'struct';
info.MessageType = 'mav_msgs/RollPitchYawrateThrust';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,13);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'roll';
info.MatPath{8} = 'pitch';
info.MatPath{9} = 'yaw_rate';
info.MatPath{10} = 'thrust';
info.MatPath{11} = 'thrust.x';
info.MatPath{12} = 'thrust.y';
info.MatPath{13} = 'thrust.z';
