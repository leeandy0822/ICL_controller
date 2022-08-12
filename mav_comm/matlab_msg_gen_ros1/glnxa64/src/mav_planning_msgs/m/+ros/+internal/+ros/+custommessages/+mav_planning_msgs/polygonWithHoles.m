function [data, info] = polygonWithHoles
%PolygonWithHoles gives an empty data for mav_planning_msgs/PolygonWithHoles
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/PolygonWithHoles';
[data.Hull, info.Hull] = ros.internal.ros.custommessages.mav_planning_msgs.polygon2D;
info.Hull.MLdataType = 'struct';
[data.Holes, info.Holes] = ros.internal.ros.custommessages.mav_planning_msgs.polygon2D;
info.Holes.MLdataType = 'struct';
info.Holes.MaxLen = NaN;
info.Holes.MinLen = 0;
data.Holes = data.Holes([],1);
info.MessageType = 'mav_planning_msgs/PolygonWithHoles';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,8);
info.MatPath{1} = 'hull';
info.MatPath{2} = 'hull.points';
info.MatPath{3} = 'hull.points.x';
info.MatPath{4} = 'hull.points.y';
info.MatPath{5} = 'holes';
info.MatPath{6} = 'holes.points';
info.MatPath{7} = 'holes.points.x';
info.MatPath{8} = 'holes.points.y';
