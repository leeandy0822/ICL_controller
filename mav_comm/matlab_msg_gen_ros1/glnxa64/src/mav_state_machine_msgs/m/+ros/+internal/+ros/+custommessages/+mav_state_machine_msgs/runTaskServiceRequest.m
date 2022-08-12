function [data, info] = runTaskServiceRequest
%RunTaskService gives an empty data for mav_state_machine_msgs/RunTaskServiceRequest
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_state_machine_msgs/RunTaskServiceRequest';
[data.TaskName, info.TaskName] = ros.internal.ros.messages.ros.char('string',0);
[data.Start, info.Start] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'mav_state_machine_msgs/RunTaskServiceRequest';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,2);
info.MatPath{1} = 'task_name';
info.MatPath{2} = 'start';
