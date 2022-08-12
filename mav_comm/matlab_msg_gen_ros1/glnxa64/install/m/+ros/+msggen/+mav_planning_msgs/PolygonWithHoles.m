
classdef PolygonWithHoles < ros.Message
    %PolygonWithHoles MATLAB implementation of mav_planning_msgs/PolygonWithHoles
    %   This class was automatically generated by
    %   ros.internal.pubsubEmitter.
    %   Copyright 2014-2020 The MathWorks, Inc.
    properties (Constant)
        MessageType = 'mav_planning_msgs/PolygonWithHoles' % The ROS message type
    end
    properties (Constant, Hidden)
        MD5Checksum = 'df7f266352dfcf3e4d29156dd85febf9' % The MD5 Checksum of the message definition
        PropertyList = { 'Hull' 'Holes' } % List of non-constant message properties
        ROSPropertyList = { 'hull' 'holes' } % List of non-constant ROS message properties
        PropertyMessageTypes = { 'ros.msggen.mav_planning_msgs.Polygon2D' ...
            'ros.msggen.mav_planning_msgs.Polygon2D' ...
            } % Types of contained nested messages
    end
    properties (Constant)
    end
    properties
        Hull
        Holes
    end
    methods
        function set.Hull(obj, val)
            validAttributes = {'nonempty', 'scalar'};
            validClasses = {'ros.msggen.mav_planning_msgs.Polygon2D'};
            validateattributes(val, validClasses, validAttributes, 'PolygonWithHoles', 'Hull')
            obj.Hull = val;
        end
        function set.Holes(obj, val)
            if isempty(val)
                % Allow empty [] input
                val = ros.msggen.mav_planning_msgs.Polygon2D.empty(0, 1);
            end
            val = val(:);
            validAttributes = {'vector'};
            validClasses = {'ros.msggen.mav_planning_msgs.Polygon2D'};
            validateattributes(val, validClasses, validAttributes, 'PolygonWithHoles', 'Holes')
            obj.Holes = val;
        end
    end
    methods (Static, Access = {?matlab.unittest.TestCase, ?ros.Message})
        function obj = loadobj(strObj)
        %loadobj Implements loading of message from MAT file
        % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = ros.msggen.mav_planning_msgs.PolygonWithHoles.empty(0,1);
                return
            end
            % Create an empty message object
            obj = ros.msggen.mav_planning_msgs.PolygonWithHoles(strObj);
        end
    end
end
