function [data, info] = runTaskServiceResponse
%RunTaskService gives an empty data for mav_state_machine_msgs/RunTaskServiceResponse
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_state_machine_msgs/RunTaskServiceResponse';
[data.Success, info.Success] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'mav_state_machine_msgs/RunTaskServiceResponse';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,1);
info.MatPath{1} = 'success';
