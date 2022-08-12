function [data, info] = startStopTask
%StartStopTask gives an empty data for mav_state_machine_msgs/StartStopTask
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_state_machine_msgs/StartStopTask';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.TaskName, info.TaskName] = ros.internal.ros.messages.ros.char('string',0);
[data.Start, info.Start] = ros.internal.ros.messages.ros.default_type('logical',1);
info.MessageType = 'mav_state_machine_msgs/StartStopTask';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,8);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'task_name';
info.MatPath{8} = 'start';
