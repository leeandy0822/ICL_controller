classdef trajectory
    methods
        function output = traj_gen(~,t)
            
        x0d = [1.2*sin(0.4*pi*t); 4.2*cos(0.2*pi*t); 3];
        x0d_dot = [0.48*pi*cos(0.4*pi*t) ; -0.84*pi*sin(0.2*pi*t) ; 0];
        x0d_double_dot = [ -0.192*pi*pi*sin(0.4*pi*t) ;-0.168*pi*pi*cos(0.2*pi*t) ; 0];
        % xd
        output(1) = x0d(1);
        output(2) = x0d(2);
        output(3) = x0d(3);
        % vd
        output(4) = x0d_dot(1);
        output(5) = x0d_dot(2);
        output(6) = x0d_dot(3);
        % ad
        output(7) = x0d_double_dot(1);
        output(8) = x0d_double_dot(2);
        output(9) = x0d_double_dot(3);
        % b1d
        output(10) = 1;
        output(11) = 0;
        output(12) = 0;
    end
    end
end
