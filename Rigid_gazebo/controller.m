classdef controller
   methods
       function [control, error, mass_est , J_est, icl] = geometric_tracking_ctrl(obj, iter, multirotor, Xd_enu, b1d, icl, dt, select_force_feedforward, select_moment_feedforward, select_moment_adaptive_w_wo_ICL)
           % f, M
           control = zeros(4, 1);
           
           % xd, vd, ad, b1d, Wd
           xd_enu = Xd_enu(1:3, 1);
           vd_enu = Xd_enu(4:6, 1);
           ad_enu = Xd_enu(7:9, 1);
           Wd = [0; 0; 0];
           
           % now states
           x_enu = multirotor.x(:, iter-1);
           v_enu = multirotor.v(:, iter-1);
           R = reshape(multirotor.R(:, iter-1), 3, 3);
           W = multirotor.W(:, iter-1);
           e3 = multirotor.e3;

           % control gains
           kx = diag([25; 25; 30]);
           kv = diag([15; 15; 15]);
           kR = diag([30; 30; 30]);
           kW = diag([10; 10; 8]);
           
           % convert position and velocity from enu to ned
           x_ned = vec_enu_to_ned(x_enu);
           v_ned = vec_enu_to_ned(v_enu);
           xd_ned = vec_enu_to_ned(xd_enu);
           vd_ned = vec_enu_to_ned(vd_enu);
           ad_ned = vec_enu_to_ned(ad_enu);
           
           % error
           ex_ned = x_ned - xd_ned;
           ev_ned = v_ned - vd_ned;
           
           % prepare the mass estimated last time
           mass_est_last = multirotor.mass_estimation(:, iter-1);
           
           % select method to calculate force feedforward control
           force_feedforward_use_geometric = 1;
           force_feedforward_use_adaptive_ICL = 2;
           
           force_feedforward = feedforward_force_ctrl;
           if select_force_feedforward == force_feedforward_use_geometric
               [F_ff, mass_est] = force_feedforward.feedforward_force_use_geometric(ad_ned, multirotor);
           elseif select_force_feedforward == force_feedforward_use_adaptive_ICL
               [F_ff, mass_est, icl] = force_feedforward.feedforward_force_use_adaptive_ICL(ad_ned, multirotor,icl,  ex_ned, ev_ned, mass_est_last, dt);
           end
           
           % f

           A = (-kx*ex_ned - kv*ev_ned + F_ff);
           b3 = R*e3;
           f = -vec_dot(A, b3);

           A = vec_ned_to_enu(A);

           % Rd
           norm_A = norm(A);
           b3d = A/norm_A;
           b2d = vec_cross(b3d, b1d);
           norm_b2d = norm(b2d);
           b2d = b2d/norm_b2d;
           b1d_proj = vec_cross(b2d, b3d);
           Rd = [b1d_proj b2d b3d];

           % eR and eW
           eR = 1/2*vee_map(Rd'*R - R'*Rd);
           eW = W - R'*Rd*Wd;
           
           % prepare the moment of inertia estimated last time
           J_est_last = multirotor.inertia_estimation(:, iter-1);

           % select method to calculate moment feedforward control
           moment_feedforward_use_geometric = 1;
           moment_feedforward_use_adaptive_ICL = 2;
           
           moment_feedforward = feedforward_moment_ctrl;
           if select_moment_feedforward == moment_feedforward_use_geometric
               [M_ff, J_est] = moment_feedforward.feedforward_moment_use_geometric(W, multirotor);
           elseif select_moment_feedforward == moment_feedforward_use_adaptive_ICL
               [M_ff, J_est, icl] = moment_feedforward.feedforward_moment_use_adaptive_ICL(W, multirotor, eR, eW, J_est_last, icl, dt, iter, select_moment_adaptive_w_wo_ICL);
           end
           
           % M
           M_back = -kR*eR - kW*eW;
           M = M_back - M_ff;

           % f, M
           control(1) = f;
           control(2) = M(1);
           control(3) = M(2);
           control(4) = M(3);
           
           % ex, ev, eR, eW
           error(1:3) = ex_ned;
           error(4:6) = ev_ned;
           error(7:9) = eR;
           error(10:12) = eW;
       end
   end
end
