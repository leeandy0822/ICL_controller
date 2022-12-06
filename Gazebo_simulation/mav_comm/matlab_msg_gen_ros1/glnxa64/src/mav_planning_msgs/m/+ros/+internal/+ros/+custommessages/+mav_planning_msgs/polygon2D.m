function [data, info] = polygon2D
%Polygon2D gives an empty data for mav_planning_msgs/Polygon2D
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/Polygon2D';
[data.Points, info.Points] = ros.internal.ros.custommessages.mav_planning_msgs.point2D;
info.Points.MLdataType = 'struct';
info.Points.MaxLen = NaN;
info.Points.MinLen = 0;
data.Points = data.Points([],1);
info.MessageType = 'mav_planning_msgs/Polygon2D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,3);
info.MatPath{1} = 'points';
info.MatPath{2} = 'points.x';
info.MatPath{3} = 'points.y';
