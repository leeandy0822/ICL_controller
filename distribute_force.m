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
                
                Fd_desire = u1 + u2 + u3;
                Md_desire = hat_map(payload.p1)*R'* u1 + hat_map(payload.p2)*R'* u2 + hat_map(payload.p3)*R'* u3 ;


                Fd_error = Fd_desire - Fd;
                Md_error = Md_desire - Md;

                % Add the CoG effect
                W = payload.W(:,iter-1);
                dW = payload.dW(:,iter-1);
                Fd_new =  u1 +  u2 +  u3 ;
                alpha_relative = hat_map(dW)*payload.body2CoG + hat_map(W)*hat_map(W)*payload.body2CoG;
                Fd_new = Fd_new - payload.m*R*alpha_relative;
                Md_new = hat_map(payload.p1 + payload.body2CoG)*R'* u1 + hat_map(payload.p2+ payload.body2CoG)*R'* u2 + hat_map(payload.p3+ payload.body2CoG)*R'* u3 ;


        end
    end
end

            