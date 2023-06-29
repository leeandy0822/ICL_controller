classdef trajectory
    methods
        function out = traj_generate(~, t, FLIGHT_MODE)
            % flight mode
            MODE_TRACKING = 0;
            MODE_HOVERING = 1;
            
            height = 1; 
            if FLIGHT_MODE == MODE_TRACKING

                if t > 0
                x = [0.08*t ; 0 ; 0.2*t];
                v = [0.08 ; 0; 0.2];
                a = [0 ; 0 ;0 ];
                end
                if t > 5 
                    t = t - 5;

                    freq = 0.04;
                    radius = 2;
                    x = [radius*sin(freq*pi*t)+0.4; radius*cos(freq*pi*t)-radius; height];
                    v = [radius*freq*pi*cos(freq*pi*t) ; -radius*freq*pi*sin(freq*pi*t) ; 0];
                    a = [-radius*freq*freq*pi*pi*sin(freq*pi*t) ; -radius*freq*freq*pi*pi*cos(freq*pi*t) ;0];
                end

                % xd, vd, ad
                out = zeros(12, 1);
    
                % xd
                out(1) = x(1);
                out(2) = x(2);
                out(3) = x(3);
                % vd
                out(4) = v(1);
                out(5) = v(2);
                out(6) = v(3);
                % ad
                out(7) = a(1);
                out(8) = a(2);
                out(9) = a(3);
    
                % Rd 
                out(10) = 1;
                out(11) = 0;
                out(12) = 0;


            elseif FLIGHT_MODE == MODE_HOVERING

                % xd, vd, b1d
                out = zeros(12, 1);
                % xd
                out(1) = 0.5;
                out(2) = 0;
                out(3) = 0.6;

                % vd
                out(4) = 0;
                out(5) = 0;
                out(6) = 0;

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