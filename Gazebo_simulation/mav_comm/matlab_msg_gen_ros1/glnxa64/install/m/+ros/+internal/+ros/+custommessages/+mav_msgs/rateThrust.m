function [data, info] = rateThrust
%RateThrust gives an empty data for mav_msgs/RateThrust
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_msgs/RateThrust';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.AngularRates, info.AngularRates] = ros.internal.ros.messages.geometry_msgs.vector3;
info.AngularRates.MLdataType = 'struct';
[data.Thrust, info.Thrust] = ros.internal.ros.messages.geometry_msgs.vector3;
info.Thrust.MLdataType = 'struct';
info.MessageType = 'mav_msgs/RateThrust';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,14);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'angular_rates';
info.MatPath{8} = 'angular_rates.x';
info.MatPath{9} = 'angular_rates.y';
info.MatPath{10} = 'angular_rates.z';
info.MatPath{11} = 'thrust';
info.MatPath{12} = 'thrust.x';
info.MatPath{13} = 'thrust.y';
info.MatPath{14} = 'thrust.z';
