
classdef FilteredSensorData < ros.Message
    %FilteredSensorData MATLAB implementation of mav_msgs/FilteredSensorData
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'mav_msgs/FilteredSensorData' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'a9b51fae1f4ed3a8a0522b4ffe61659f' % The MD5 Checksum of the message definition
        PropertyList = { 'Header' 'Accelerometer' 'Gyroscope' 'Magnetometer' 'Barometer' } % List of non-constant message properties
        ROSPropertyList = { 'header' 'accelerometer' 'gyroscope' 'magnetometer' 'barometer' } % List of non-constant ROS message properties
        PropertyMessageTypes = { 'ros.msggen.std_msgs.Header' ...
            'ros.msggen.geometry_msgs.Vector3' ...
            'ros.msggen.geometry_msgs.Vector3' ...
            'ros.msggen.geometry_msgs.Vector3' ...
            '' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Header
        Accelerometer
        Gyroscope
        Magnetometer
        Barometer
    end
    methods
        function set.Header(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.std_msgs.Header'};
            validateattributes(val, validClasses, validAttributes, 'FilteredSensorData', 'Header')
            obj.Header = val;
        end
        function set.Accelerometer(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.geometry_msgs.Vector3'};
            validateattributes(val, validClasses, validAttributes, 'FilteredSensorData', 'Accelerometer')
            obj.Accelerometer = val;
        end
        function set.Gyroscope(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.geometry_msgs.Vector3'};
            validateattributes(val, validClasses, validAttributes, 'FilteredSensorData', 'Gyroscope')
            obj.Gyroscope = val;
        end
        function set.Magnetometer(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.geometry_msgs.Vector3'};
            validateattributes(val, validClasses, validAttributes, 'FilteredSensorData', 'Magnetometer')
            obj.Magnetometer = val;
        end
        function set.Barometer(obj, val)
            validClasses = {'numeric'};
            validAttributes = {'nonempty', 'scalar'};
            validateattributes(val, validClasses, validAttributes, 'FilteredSensorData', 'Barometer');
            obj.Barometer = double(val);
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.mav_msgs.FilteredSensorData.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.mav_msgs.FilteredSensorData(strObj);
        end
    end
end
