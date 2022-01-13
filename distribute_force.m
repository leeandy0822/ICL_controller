classdef distribute_force

    methods
        function [Fd_new, Md_new, u] = cal_u(~, payload, Fd, Md, iter)

                R = reshape(payload.R(:,iter-1),3,3);

                temp_f = R'*Fd;
                temp_m = Md;
                grasp_term = payload.grasp_matrix'/(payload.grasp_matrix*payload.grasp_matrix');
                rotation_term = [R zeros(3) zeros(3) ; zeros(3) R zeros(3); zeros(3) zeros(3) R];
                
                u = rotation_term*grasp_term*[temp_f;temp_m];

                 u1 = u(1:3);
                 u2 = u(4:6);
                 u3 = u(7:9);
                    
                Fd_new =  u1 +  u2 +  u3;
                Md_new = hat_map(payload.p1)*R'* u1 + hat_map(payload.p2)*R'* u2 + hat_map(payload.p3)*R'* u3 ;
                
                Fd_error = Fd - Fd_new;
                Md_error = Md - Md_new;

                disp(Fd_error);
                disp(Md_error);
        end
    end
end

            