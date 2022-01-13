classdef payload_trajectory
    methods
        function out = traj_generate(~, t)

            x = [25*sin(0.02*t) ; 25*cos(0.02*t); 3*sin(0.1*t)+2];
            v = [0.5*cos(0.02*t) ; -0.5*sin(0.02*t) ; 0.3*cos(0.1*t)];
            a = [0.01*sin(0.02*t) ; -0.01*cos(0.02*t) ; -0.1*0.1*sin(0.1*t)];

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
