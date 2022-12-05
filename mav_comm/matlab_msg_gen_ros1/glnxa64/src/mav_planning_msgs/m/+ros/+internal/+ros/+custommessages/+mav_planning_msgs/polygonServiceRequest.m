function [data, info] = polygonServiceRequest
%PolygonService gives an empty data for mav_planning_msgs/PolygonServiceRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/PolygonServiceRequest';
[data.Polygon, info.Polygon] = ros.internal.ros.custommessages.mav_planning_msgs.polygonWithHolesStamped;
info.Polygon.MLdataType = 'struct';
info.MessageType = 'mav_planning_msgs/PolygonServiceRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,17);
info.MatPath{1} = 'polygon';
info.MatPath{2} = 'polygon.header';
info.MatPath{3} = 'polygon.header.seq';
info.MatPath{4} = 'polygon.header.stamp';
info.MatPath{5} = 'polygon.header.stamp.sec';
info.MatPath{6} = 'polygon.header.stamp.nsec';
info.MatPath{7} = 'polygon.header.frame_id';
info.MatPath{8} = 'polygon.altitude';
info.MatPath{9} = 'polygon.polygon';
info.MatPath{10} = 'polygon.polygon.hull';
info.MatPath{11} = 'polygon.polygon.hull.points';
info.MatPath{12} = 'polygon.polygon.hull.points.x';
info.MatPath{13} = 'polygon.polygon.hull.points.y';
info.MatPath{14} = 'polygon.polygon.holes';
info.MatPath{15} = 'polygon.polygon.holes.points';
info.MatPath{16} = 'polygon.polygon.holes.points.x';
info.MatPath{17} = 'polygon.polygon.holes.points.y';
