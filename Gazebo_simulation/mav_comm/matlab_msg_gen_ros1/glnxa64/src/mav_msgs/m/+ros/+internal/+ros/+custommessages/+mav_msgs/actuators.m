function [data, info] = actuators
%Actuators gives an empty data for mav_msgs/Actuators
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_msgs/Actuators';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Angles, info.Angles] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.AngularVelocities, info.AngularVelocities] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Normalized, info.Normalized] = ros.internal.ros.messages.ros.default_type('double',NaN);
info.MessageType = 'mav_msgs/Actuators';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,9);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'angles';
info.MatPath{8} = 'angular_velocities';
info.MatPath{9} = 'normalized';
