function [data, info] = polynomialTrajectory
%PolynomialTrajectory gives an empty data for mav_planning_msgs/PolynomialTrajectory
% Copyright 2019-2020 The MathWorks, Inc.
%#codegen
data = struct();
data.MessageType = 'mav_planning_msgs/PolynomialTrajectory';
[data.Header, info.Header] = ros.internal.ros.messages.std_msgs.header;
info.Header.MLdataType = 'struct';
[data.Segments, info.Segments] = ros.internal.ros.custommessages.mav_planning_msgs.polynomialSegment;
info.Segments.MLdataType = 'struct';
info.Segments.MaxLen = NaN;
info.Segments.MinLen = 0;
data.Segments = data.Segments([],1);
info.MessageType = 'mav_planning_msgs/PolynomialTrajectory';
info.constant = 0;
info.default = 0;
info.maxstrlen = NaN;
info.MaxLen = 1;
info.MinLen = 1;
info.MatPath = cell(1,24);
info.MatPath{1} = 'header';
info.MatPath{2} = 'header.seq';
info.MatPath{3} = 'header.stamp';
info.MatPath{4} = 'header.stamp.sec';
info.MatPath{5} = 'header.stamp.nsec';
info.MatPath{6} = 'header.frame_id';
info.MatPath{7} = 'segments';
info.MatPath{8} = 'segments.header';
info.MatPath{9} = 'segments.header.seq';
info.MatPath{10} = 'segments.header.stamp';
info.MatPath{11} = 'segments.header.stamp.sec';
info.MatPath{12} = 'segments.header.stamp.nsec';
info.MatPath{13} = 'segments.header.frame_id';
info.MatPath{14} = 'segments.num_coeffs';
info.MatPath{15} = 'segments.segment_time';
info.MatPath{16} = 'segments.segment_time.sec';
info.MatPath{17} = 'segments.segment_time.nsec';
info.MatPath{18} = 'segments.x';
info.MatPath{19} = 'segments.y';
info.MatPath{20} = 'segments.z';
info.MatPath{21} = 'segments.rx';
info.MatPath{22} = 'segments.ry';
info.MatPath{23} = 'segments.rz';
info.MatPath{24} = 'segments.yaw';
