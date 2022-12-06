classdef trajectory
    methods
        function out = traj_generate(~, t, FLIGHT_MODE)
            % flight mode
            MODE_TRACKING = 0;
            MODE_HOVERING = 1;
            
            if FLIGHT_MODE == MODE_TRACKING
                % xd, vd, b1d
                out = zeros(12, 1);
                % frequency of trajectory
                f_x = 1.2;
                f_y = 1.0;
                % xd
                out(1) = sin(f_x*t);
                out(2) = sin(f_y*t);
                out(3) = 1;
                % vd
                out(4) = f_x*cos(f_x*t);
                out(5) = f_y*cos(f_y*t);
                out(6) = 0;
                % ad
                out(7) = -f_x*f_x*sin(f_x*t);
                out(8) = -f_y*f_y*sin(f_y*t);
                out(9) = 0;
                % b1d
                out(10) = 1;
                out(11) = 0;
                out(12) = 0;
            elseif FLIGHT_MODE == MODE_HOVERING
                % xd, vd, b1d
                out = zeros(12, 1);
                % xd
                out(1) = 1;
                out(2) = 1;
                out(3) = 0.05*t;
                if t > 20
                    out(3)= 1;
                end
                % vd
                out(4) = 0;
                out(5) = 0;
                out(6) = 0.05;
                if t > 20
                    out(6) = 0;
                end
                % ad
                out(7) = 0;
                out(8) = 0;
                out(9) = 0;
                % b1d
                out(10) = 1;
                out(11) = 0;
                out(12) = 0;
            end
        end
    end
end
