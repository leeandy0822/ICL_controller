classdef payload_trajectory
    methods
        function out = traj_generate(~, t)

            x = [12*sin(t); 5*cos(t); 0.2*sin(t)];
            v = [12*cos(t) ; -5*sin(t) ; 0.2*cos(t)];
            a = [-12*sin(t) ; -5*cos(t) ; 0.2*-sin(t)];

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
