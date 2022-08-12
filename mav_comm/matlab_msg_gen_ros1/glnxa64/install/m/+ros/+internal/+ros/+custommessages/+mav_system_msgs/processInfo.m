function [data, info] = processInfo
%ProcessInfo gives an empty data for mav_system_msgs/ProcessInfo
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_system_msgs/ProcessInfo';
[data.Pid, info.Pid] = ros.internal.ros.messages.ros.default_type('uint32',1);
[data.Name, info.Name] = ros.internal.ros.messages.ros.char('string',0);
[data.Username, info.Username] = ros.internal.ros.messages.ros.char('string',0);
[data.CpuPercent, info.CpuPercent] = ros.internal.ros.messages.ros.default_type('single',1);
info.MessageType = 'mav_system_msgs/ProcessInfo';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,4);
info.MatPath{1} = 'pid';
info.MatPath{2} = 'name';
info.MatPath{3} = 'username';
info.MatPath{4} = 'cpu_percent';
