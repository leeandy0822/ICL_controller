classdef trajectory
    methods
        function out = traj_generate(~, t, FLIGHT_MODE)
            % flight mode
            MODE_TRACKING = 0;
            MODE_HOVERING = 1;
            
            height = 1; 
            if FLIGHT_MODE == MODE_TRACKING
                x = [0.5 ; 0 ; 0.025*t];
                v = [0 ; 0; 0.025];
                a = [0 ; 0 ;0 ];
            
                if t > 40 
                    t = t - 40;
                    x = [0.5 + 0.3*t ; 0 ; height];
                    v = [0.3       ; 0   ; 0];
                    a = [0          ; 0     ; 0];
                    
                    freq = 0.06;
                    radius = 1.5;
                    x = [radius*sin(freq*pi*t)+0.5 ; radius*cos(freq*pi*t)-radius; height];
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
                out(3) = 1;
                if t > 20
                    out(3)= 1;
                end
                % vd
                out(4) = 0;
                out(5) = 0;
                out(6) = 0;
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