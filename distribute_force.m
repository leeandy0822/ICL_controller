classdef distribute_force

    methods
        function [Fd_new, Md_new, u] = cal_u(~, payload, Fd, Md, iter)

                R = reshape(payload.R(:,iter-1),3,3);
                
                % turn into body frame
                temp_f = R'*Fd;
                temp_m = Md;

                % distributed in body frame then to world frame
                grasp_term = payload.B'/(payload.B*payload.B');

                toworld = [R zeros(3) zeros(3) ; zeros(3) R zeros(3); zeros(3) zeros(3) R];
                u = toworld*grasp_term*[temp_f ; temp_m];
                u1 = u(1:3);
                u2 = u(4:6); 
                u3 = u(7:9);
                

                % but remember the moment should allocate at the body frame
                % so do R'
                Fd_new =  u1 +  u2 +  u3;
                Md_new = hat_map(payload.p1 + payload.body2CoG)*R'* u1 + hat_map(payload.p2+ payload.body2CoG)*R'* u2 + hat_map(payload.p3+ payload.body2CoG)*R'* u3 ;


        end
    end
end

            