classdef payload_trajectory
    methods
        function out = traj_generate(~, t)

%             % eight
%             x = [3*sin(0.2*pi*t) ; 7*cos(0.1*pi*t); 0];
%             v = [3*0.2*pi*cos(0.2*pi*t) ; -7*0.1*pi*sin(0.1*pi*t) ; 0];
%             a = [-3*0.2*0.2*pi*pi*sin(0.2*pi*t) ; -7*0.1*0.1*pi*pi*cos(0.1*pi*t) ; 0];
%             
%             % circle
%             x = [ 2*sin(2*t) ;  2*cos(2*t);   -0.3 - 0.2*t];
%             v = [ 4*cos(2*t) ; -4*sin(2*t) ;  -0.2];
%             a = [-8*sin(2*t) ; -8*cos(2*t) ; 0];
% 
            % hover
            x = [0 ; 0 ; -0.01*t];
            v = [0; 0; -0.01];
            a = [0 ; 0 ;0 ];

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
