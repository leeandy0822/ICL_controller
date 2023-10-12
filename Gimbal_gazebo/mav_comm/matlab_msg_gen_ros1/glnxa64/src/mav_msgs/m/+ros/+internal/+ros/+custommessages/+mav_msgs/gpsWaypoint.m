function [data, info] = gpsWaypoint
%GpsWaypoint gives an empty data for mav_msgs/GpsWaypoint
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_msgs/GpsWaypoint';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Latitude, info.Latitude] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Longitude, info.Longitude] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Altitude, info.Altitude] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Heading, info.Heading] = ros.internal.ros.messages.ros.default_type('double',1);
[data.MaxSpeed, info.MaxSpeed] = ros.internal.ros.messages.ros.default_type('double',1);
[data.MaxAcc, info.MaxAcc] = ros.internal.ros.messages.ros.default_type('double',1);
info.MessageType = 'mav_msgs/GpsWaypoint';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,12);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'latitude';
info.MatPath{8} = 'longitude';
info.MatPath{9} = 'altitude';
info.MatPath{10} = 'heading';
info.MatPath{11} = 'maxSpeed';
info.MatPath{12} = 'maxAcc';
