
classdef PolynomialSegment4D < ros.Message
    %PolynomialSegment4D MATLAB implementation of mav_planning_msgs/PolynomialSegment4D
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'mav_planning_msgs/PolynomialSegment4D' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'c85fa40c94ff35d242df13d4d3a57809' % The MD5 Checksum of the message definition
        PropertyList = { 'Header' 'SegmentTime' 'NumCoeffs' 'X' 'Y' 'Z' 'Yaw' } % List of non-constant message properties
        ROSPropertyList = { 'header' 'segment_time' 'num_coeffs' 'x' 'y' 'z' 'yaw' } % List of non-constant ROS message properties
        PropertyMessageTypes = { 'ros.msggen.std_msgs.Header' ...
            'ros.msg.Duration' ...
            '' ...
            '' ...
            '' ...
            '' ...
            '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Header
        SegmentTime
        NumCoeffs
        X
        Y
        Z
        Yaw
    end
    methods
        function set.Header(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.std_msgs.Header'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'Header')
            obj.Header = val;
        end
        function set.SegmentTime(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msg.Duration'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'SegmentTime')
            obj.SegmentTime = val;
        end
        function set.NumCoeffs(obj, val)
            validClasses = {'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'NumCoeffs');
            obj.NumCoeffs = int32(val);
        end
        function set.X(obj, val)
            validClasses = {'numeric'};
            if isempty(val)
                % Allow empty [] input
                val = double.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'X');
            obj.X = double(val);
        end
        function set.Y(obj, val)
            validClasses = {'numeric'};
            if isempty(val)
                % Allow empty [] input
                val = double.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'Y');
            obj.Y = double(val);
        end
        function set.Z(obj, val)
            validClasses = {'numeric'};
            if isempty(val)
                % Allow empty [] input
                val = double.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'Z');
            obj.Z = double(val);
        end
        function set.Yaw(obj, val)
            validClasses = {'numeric'};
            if isempty(val)
                % Allow empty [] input
                val = double.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validateattributes(val, validClasses, validAttributes, 'PolynomialSegment4D', 'Yaw');
            obj.Yaw = double(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.mav_planning_msgs.PolynomialSegment4D.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.mav_planning_msgs.PolynomialSegment4D(strObj);
        end
    end
end
