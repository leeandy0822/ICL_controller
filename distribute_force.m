classdef distribute_force
    
    properties
       u1_bar
       u2_bar
       u3_bar
       u1
       u2
       u3
       Z
       B
       p_i
       spherical_constraint
    end
    methods

        function [Fd_new, Md_new, u] = cal_u(~, payload, Fd, Md, iter)

                R = reshape(payload.R(:,iter-1),3,3);
                
                %% upper bound
                Fd_direction = Fd/norm(Fd);
                
                Fd_up = 2*9.8*3;
                Fd_real = min(Fd_up, norm(Fd));

                Fd = Fd_real*Fd_direction;

                % turn into body frame
                temp_f = R'*Fd;
                temp_m = Md;

                % distributed in body frame then to world frame
                
                obj.B = payload.B;
                obj.Z = null(obj.B);

                %% Analytical Solution of distributed force
                analytical_sol = obj.B'/(obj.B*obj.B');
                toworld = [R zeros(3) zeros(3) ; zeros(3) R zeros(3); zeros(3) zeros(3) R];
                
                obj.u_bar = toworld*analytical_sol*[temp_f ; temp_m];                
                obj.u1_bar = obj.u_bar(1:3);
                obj.u2_bar = obj.u_bar(4:6); 
                obj.u3_bar = obj.u_bar(7:9);
                
                %% Because of gimbal constraint, decide gamma input for null(B) 
                gamma = [-0.5; -0.5; -0.5];  
                obj.p_i = [0 ; 0 ; -1];
                obj.spherical_contraint = cos(deg2rad(90))*cos(deg2rad(90))*eye(3) - obj.p_i*obj.p_i'; 

                options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
                
                gamma_new = fminunc(@func, gamma, options);
                % Total null space force
                nullspace_f = obj.Z*gamma_new;
                obj.u1 = obj.u1_bar + nullspace_f(1:3);
                obj.u2 = obj.u2_bar + nullspace_f(4:6);
                obj.u3 = obj.u3_bar + nullspace_f(7:9);

                Fd_desire = obj.u1 + obj.u2 + obj.u3;
                Md_desire = hat_map(payload.p1)*R'* obj.u1 + hat_map(payload.p2)*R'* obj.u2 + hat_map(payload.p3)*R'* obj.u3 ;

                
                % Add the CoG effect
                W = payload.W(:,iter-1);
                dW = payload.dW(:,iter-1);
                Fd_new =  obj.u1 +  obj.u2 +  obj.u3 ;
                alpha_relative = hat_map(dW)*payload.body2CoG + hat_map(W)*hat_map(W)*payload.body2CoG;
                Fd_new = Fd_new + payload.m*R*alpha_relative;
                Md_new = hat_map(payload.p1 + payload.body2CoG)*R'* obj.u1 + hat_map(payload.p2+ payload.body2CoG)*R'* obj.u2 + hat_map(payload.p3+ payload.body2CoG)*R'* obj.u3 ;

                u = [obj.u1; obj.u2; obj.u3];
                function cost = func(gamma)
            
                    s = 10;
                    upperbound = 50;
                    
                    Z1 = obj.Z(1:3,:);
                    Z2 = obj.Z(4:6,:);
                    Z3 = obj.Z(7:9,:);
        
                    F1 = obj.u1_bar + Z1*gamma;
                    F2 = obj.u2_bar + Z2*gamma;
                    F3 = obj.u3_bar + Z3*gamma;

                    c11 = F1'*(obj.spherical_contraint)*F1;
                    c21 = F1'*F1 - upperbound^2;
                    result1 = 0.5*s*(F1'*F1) + ( -log(-c11) - log(-c21) );
                
                    c12 = F2'*(obj.spherical_contraint)*F2;
                    c22 = F2'*F2 - upperbound^2;
                    result2 = 0.5*s*(F2'*F2) + ( -log(-c12) - log(-c22) );
                
                    c13 = F3'*(obj.spherical_contraint)*F3;
                    c23 = F3'*F3 - upperbound^2;
                    result3 = 0.5*s*(F3'*F3) + ( -log(-c13) - log(-c23) );
                        
                    cost = result1 + result2 + result3;
                end
        end


        
        
    end
end

            