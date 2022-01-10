classdef controller
    methods
        function [control, error, mass_est, icl] = tracking_ctrl(obj, iter, payload, Xd, icl, dt)

            % xd,vd,ad
            xd = Xd(1:3,1);
            vd = Xd(4:6,1);
            ad = Xd(7:9,1);

            % states
            x = payload.x(:,iter-1);
            v = payload.v(:,iter-1);


            ex = x - xd;
            ev = v - vd;
            
            % prepare the mass estimated last time
            mass_est_last = payload.mass_estimation(:, iter-1);
            
            force_feedforward = feedforward_force_ctrl;

            [F_ff, mass_est, icl] = force_feedforward.feedforward_force_use_adaptive_ICL(v,ad,payload,ex,ev,mass_est_last,dt,icl);

            kx = 10;
            kv = 10;

            control = -kx*ex - kv*ev - F_ff;
            error(1:3) = ex;
            error(4:6) = ev;
        end
    end
end
