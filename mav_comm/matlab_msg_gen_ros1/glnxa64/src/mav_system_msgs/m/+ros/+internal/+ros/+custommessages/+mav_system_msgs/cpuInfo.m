function [data, info] = cpuInfo
%CpuInfo gives an empty data for mav_system_msgs/CpuInfo
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_system_msgs/CpuInfo';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.CpuPercent, info.CpuPercent] = ros.internal.ros.messages.ros.default_type('single',NaN);
[data.HeaviestProcesses, info.HeaviestProcesses] = ros.internal.ros.custommessages.mav_system_msgs.processInfo;
info.HeaviestProcesses.MLdataType = 'struct';
info.HeaviestProcesses.MaxLen = NaN;
info.HeaviestProcesses.MinLen = 0;
data.HeaviestProcesses = data.HeaviestProcesses([],1);
info.MessageType = 'mav_system_msgs/CpuInfo';
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
info.MatPath{7} = 'cpu_percent';
info.MatPath{8} = 'heaviest_processes';
info.MatPath{9} = 'heaviest_processes.pid';
info.MatPath{10} = 'heaviest_processes.name';
info.MatPath{11} = 'heaviest_processes.username';
info.MatPath{12} = 'heaviest_processes.cpu_percent';
