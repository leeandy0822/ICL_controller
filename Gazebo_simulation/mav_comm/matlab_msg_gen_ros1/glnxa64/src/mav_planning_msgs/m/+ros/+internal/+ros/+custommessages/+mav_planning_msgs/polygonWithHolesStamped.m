function [data, info] = polygonWithHolesStamped
%PolygonWithHolesStamped gives an empty data for mav_planning_msgs/PolygonWithHolesStamped
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/PolygonWithHolesStamped';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Altitude, info.Altitude] = ros.internal.ros.messages.ros.default_type('double',1);
[data.Polygon, info.Polygon] = ros.internal.ros.custommessages.mav_planning_msgs.polygonWithHoles;
info.Polygon.MLdataType = 'struct';
info.MessageType = 'mav_planning_msgs/PolygonWithHolesStamped';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,16);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'altitude';
info.MatPath{8} = 'polygon';
info.MatPath{9} = 'polygon.hull';
info.MatPath{10} = 'polygon.hull.points';
info.MatPath{11} = 'polygon.hull.points.x';
info.MatPath{12} = 'polygon.hull.points.y';
info.MatPath{13} = 'polygon.holes';
info.MatPath{14} = 'polygon.holes.points';
info.MatPath{15} = 'polygon.holes.points.x';
info.MatPath{16} = 'polygon.holes.points.y';
