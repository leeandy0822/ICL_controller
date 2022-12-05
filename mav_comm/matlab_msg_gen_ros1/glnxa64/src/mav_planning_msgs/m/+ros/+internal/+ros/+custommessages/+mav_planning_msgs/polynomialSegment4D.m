function [data, info] = polynomialSegment4D
%PolynomialSegment4D gives an empty data for mav_planning_msgs/PolynomialSegment4D
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/PolynomialSegment4D';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.NumCoeffs, info.NumCoeffs] = ros.internal.ros.messages.ros.default_type('int32',1);
[data.SegmentTime, info.SegmentTime] = ros.internal.ros.messages.ros.duration;
info.SegmentTime.MLdataType = 'struct';
[data.X, info.X] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Y, info.Y] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Z, info.Z] = ros.internal.ros.messages.ros.default_type('double',NaN);
[data.Yaw, info.Yaw] = ros.internal.ros.messages.ros.default_type('double',NaN);
info.MessageType = 'mav_planning_msgs/PolynomialSegment4D';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,14);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'num_coeffs';
info.MatPath{8} = 'segment_time';
info.MatPath{9} = 'segment_time.sec';
info.MatPath{10} = 'segment_time.nsec';
info.MatPath{11} = 'x';
info.MatPath{12} = 'y';
info.MatPath{13} = 'z';
info.MatPath{14} = 'yaw';
