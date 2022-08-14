classdef gazebo_trajectory
    properties
        traj
    end
    methods
        function out = traj_generate(~, t,mode)

            % eight
            if mode=="eight"
                x = [3*sin(0.12*pi*t) ; 7*cos(0.06*pi*t)-7; 0];
                v = [3*0.12*pi*cos(0.12*pi*t) ; -7*0.06*pi*sin(0.06*pi*t) ; 0];
                a = [-3*0.12*0.12*pi*pi*sin(0.12*pi*t) ; -7*0.06*0.06*pi*pi*cos(0.06*pi*t) ; 0];
            else
                x = [0 ; 0 ; -0.05*t];
                v = [0; 0; -0.05];
                a = [0 ; 0 ;0 ];
            end
        
            % xd, vd, ad
            out = zeros(9, 1);

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

        end
   end
end
