function [data, info] = changeNameServiceRequest
%ChangeNameService gives an empty data for mav_planning_msgs/ChangeNameServiceRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/ChangeNameServiceRequest';
[data.Name, info.Name] = ros.internal.ros.messages.ros.char('string',0);
info.MessageType = 'mav_planning_msgs/ChangeNameServiceRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'name';
