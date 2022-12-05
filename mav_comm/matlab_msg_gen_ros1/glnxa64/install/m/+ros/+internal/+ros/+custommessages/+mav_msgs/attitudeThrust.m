function [data, info] = attitudeThrust
%AttitudeThrust gives an empty data for mav_msgs/AttitudeThrust
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_msgs/AttitudeThrust';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Attitude, info.Attitude] = ros.internal.ros.messages.geometry_msgs.quaternion;
info.Attitude.MLdataType = 'struct';
[data.Thrust, info.Thrust] = ros.internal.ros.messages.geometry_msgs.vector3;
info.Thrust.MLdataType = 'struct';
info.MessageType = 'mav_msgs/AttitudeThrust';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,15);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'attitude';
info.MatPath{8} = 'attitude.x';
info.MatPath{9} = 'attitude.y';
info.MatPath{10} = 'attitude.z';
info.MatPath{11} = 'attitude.w';
info.MatPath{12} = 'thrust';
info.MatPath{13} = 'thrust.x';
info.MatPath{14} = 'thrust.y';
info.MatPath{15} = 'thrust.z';
