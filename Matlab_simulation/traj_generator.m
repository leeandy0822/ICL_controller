classdef traj_generator < handle
    properties
        % trajectory duration
        duration;
        
        % waypoints and trajectory number
        traj_num;
        waypoints_num;
        waypoints;
        
        % time array
        t_arr;
        
        % polynomial order
        order;
        
        % Q matrix
        Q;
        
        % A matrix
        A;
        
        % b matrix
        b_x;
        b_y;
        
        % coefficients of polynomial trajectory
        x_coefficients;
        y_coefficients;
        
        % trajectory
        dt;
        t_array;
        x_pos_trajectory_part;
        y_pos_trajectory_part;
        x_pos_trajectory;
        y_pos_trajectory;
        
        % velocity
        x_vel_trajectory;
        y_vel_trajectory;
        
        % acceleration
        x_acc_trajectory;
        y_acc_trajectory;
    end
    
    methods
        function compute_Q(obj)
            obj.Q = zeros(obj.traj_num*8, obj.traj_num*8);
            b0 = 24;
            b1 = 120;
            b2 = 360;
            b3 = 840;
            t = obj.duration;
            q = [b0*b0,           b0*b1*(1/2)*t^2, b0*b2*(1/3)*t^3, b0*b3*(1/4)*t^4;
                 b0*b1*(1/2)*t^2, b1*b1*(1/3)*t^3, b1*b2*(1/4)*t^4, b1*b3*(1/5)*t^5;
                 b0*b2*(1/3)*t^3, b1*b2*(1/4)*t^4, b2*b2*(1/5)*t^5, b2*b3*(1/6)*t^6;
                 b0*b3*(1/4)*t^4, b1*b3*(1/5)*t^5, b2*b3*(1/6)*t^6, b3*b3*(1/7)*t^7];
            for i = 1:obj.traj_num
                obj.Q(5+8*(i-1):8+8*(i-1), 5+8*(i-1):8+8*(i-1)) = q;
            end
        end
        
        function compute_A(obj)
            obj.A = zeros(4*obj.waypoints_num+obj.traj_num-1, 8*(obj.traj_num));
            
            % position, velocity, acceleration continuity constraints
            t = obj.duration;
            con = [1, t, t^2,   t^3,    t^4,     t^5,     t^6,     t^7;
                   0, 1, 2*t, 3*t^2,  4*t^3,   5*t^4,   6*t^5,   7*t^6;
                   0, 0,   2,   6*t, 12*t^2,  20*t^3,  30*t^4,  42*t^5;
                   0, 0,   0,     6,    24*t, 60*t^2, 120*t^3, 210*t^4];
            
            pre = [1, 0, 0, 0;
                   0, 1, 0, 0;
                   0, 0, 2, 0;
                   0, 0, 0, 6];
            
            next = [0,  0,  0,  0;
                    0, -1,  0,  0;
                    0,  0, -2,  0;
                    0,  0,  0, -6];
            
            % A matrix
            obj.A(1:4, 1:4) = pre;
            obj.A(5:8, 1:8) = con;
            for i = 1:obj.traj_num-1
                obj.A(1+4*i : 4+4*i, 1+8*i : 4+8*i) = next;
                obj.A(5+4*i : 8+4*i, 1+8*i : 8+8*i) = con;
                obj.A(4*obj.waypoints_num+i, 1+8*i) = 1;
            end
        end
        
        function compute_b(obj)
            obj.b_x = zeros(4*obj.waypoints_num+obj.traj_num-1, 1);
            obj.b_y = zeros(4*obj.waypoints_num+obj.traj_num-1, 1);
            velo = 0;
            acce = 0;
            jerk = 0;
            
            % position, velocity, acceleration continuity constraints
            for i = 1:obj.traj_num
                obj.b_x(1+4*(i-1)) = obj.waypoints(i, 1);
                obj.b_x(2+4*(i-1)) = velo;
                obj.b_x(3+4*(i-1)) = acce;
                obj.b_x(4+4*(i-1)) = jerk;
                obj.b_y(1+4*(i-1)) = obj.waypoints(i, 2);
                obj.b_y(2+4*(i-1)) = velo;
                obj.b_y(3+4*(i-1)) = acce;
                obj.b_y(4+4*(i-1)) = jerk;
            end
            
            % intermediate constraints
            for i = 1:obj.traj_num-1
                obj.b_x(4*obj.waypoints_num+i) = obj.waypoints(i+1, 1);
                obj.b_y(4*obj.waypoints_num+i) = obj.waypoints(i+1, 2);
            end
        end
        
        function get_traj_coefficients(obj)
            f = [];
            A_ieq = [];
            b_ieq = [];
            qp_coefficients_x = quadprog(obj.Q, f, A_ieq, b_ieq, obj.A, obj.b_x);
            qp_coefficients_y = quadprog(obj.Q, f, A_ieq, b_ieq, obj.A, obj.b_y);
            obj.x_coefficients = reshape(qp_coefficients_x, obj.order+1, obj.traj_num);
            obj.y_coefficients = reshape(qp_coefficients_y, obj.order+1, obj.traj_num);
        end
        
        function get_trajectory(obj)
            t = 0:obj.dt:obj.duration;
            obj.t_array = 0:obj.dt:obj.duration*obj.traj_num;
            obj.x_pos_trajectory = zeros(length(obj.t_array), 1);
            obj.y_pos_trajectory = zeros(length(obj.t_array), 1);
            l = length(t)-1;
            obj.x_pos_trajectory_part = zeros(length(t), 1);
            for j = 1:obj.traj_num
                % get each part of the trajectory
                for i = 1:length(t)
                    obj.x_pos_trajectory_part(i) = obj.x_coefficients(1, j) ...
                                               + obj.x_coefficients(2, j)*t(i) ...
                                               + obj.x_coefficients(3, j)*t(i)^2 ...
                                               + obj.x_coefficients(4, j)*t(i)^3 ...
                                               + obj.x_coefficients(5, j)*t(i)^4 ...
                                               + obj.x_coefficients(6, j)*t(i)^5 ...
                                               + obj.x_coefficients(7, j)*t(i)^6 ...
                                               + obj.x_coefficients(8, j)*t(i)^7;
                                           
                    obj.y_pos_trajectory_part(i) = obj.y_coefficients(1, j) ...
                                               + obj.y_coefficients(2, j)*t(i) ...
                                               + obj.y_coefficients(3, j)*t(i)^2 ...
                                               + obj.y_coefficients(4, j)*t(i)^3 ...
                                               + obj.y_coefficients(5, j)*t(i)^4 ...
                                               + obj.y_coefficients(6, j)*t(i)^5 ...
                                               + obj.y_coefficients(7, j)*t(i)^6 ...
                                               + obj.y_coefficients(8, j)*t(i)^7;
                end
                % connect the parts of the trajectory
                obj.x_pos_trajectory(1+(j-1)*l:101+(j-1)*l, 1) = obj.x_pos_trajectory_part;
                obj.y_pos_trajectory(1+(j-1)*l:101+(j-1)*l, 1) = obj.y_pos_trajectory_part;
            end
        end
        
        function get_velocity(obj)
            obj.x_vel_trajectory = zeros(length(obj.t_array), 1);
            obj.y_vel_trajectory = zeros(length(obj.t_array), 1);
            
            for i = 2:length(obj.t_array)
                obj.x_vel_trajectory(i) = (obj.x_pos_trajectory(i) - obj.x_pos_trajectory(i-1))/obj.dt;
                obj.y_vel_trajectory(i) = (obj.y_pos_trajectory(i) - obj.y_pos_trajectory(i-1))/obj.dt;
            end
        end
        
        function get_acceleration(obj)
            obj.x_acc_trajectory = zeros(length(obj.t_array), 1);
            obj.y_acc_trajectory = zeros(length(obj.t_array), 1);
            
            for i = 3:length(obj.t_array)
                obj.x_acc_trajectory(i) = (obj.x_vel_trajectory(i) - obj.x_vel_trajectory(i-1))/obj.dt;
                obj.y_acc_trajectory(i) = (obj.y_vel_trajectory(i) - obj.y_vel_trajectory(i-1))/obj.dt;
            end
        end
        
        function plot_trajectory(obj)
            figure(1);
            plot(obj.waypoints(:, 1), obj.waypoints(:, 2), 'r*');
            hold on;
            plot(obj.x_pos_trajectory, obj.y_pos_trajectory);
            legend('$waypoints$', '$trajectory$', 'Interpreter', 'latex');
            xlabel('$X(m)$', 'Interpreter', 'latex');
            y_label = ylabel('$Y(m)$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            title('$Trajectory$', 'Interpreter', 'latex');
            grid on;
            
            figure(2);
            subplot(211);
            plot(obj.t_array, obj.x_pos_trajectory);
            y_label = ylabel('$X$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            title('$Trajectory$ $(m)$', 'Interpreter', 'latex');
            grid on;
            subplot(212);
            plot(obj.t_array, obj.y_pos_trajectory);
            y_label = ylabel('$Y$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            xlabel('$time(sec)$', 'Interpreter', 'latex');
            grid on;
            
            figure(3);
            subplot(211);
            plot(obj.t_array, obj.x_vel_trajectory);
            y_label = ylabel('$V_{x}$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            title('$Velocity$ $(m/s)$', 'Interpreter', 'latex');
            grid on;
            subplot(212);
            plot(obj.t_array, obj.y_vel_trajectory);
            y_label = ylabel('$V_{y}$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            xlabel('$time(sec)$', 'Interpreter', 'latex');
            grid on;
            
            figure(4);
            subplot(211);
            plot(obj.t_array, obj.x_acc_trajectory);
            y_label = ylabel('$a_{x}$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            title('$Acceleration$ $(m/s^{2})$', 'Interpreter', 'latex');
            grid on;
            subplot(212);
            plot(obj.t_array, obj.y_acc_trajectory);
            y_label = ylabel('$a_{y}$', 'Interpreter', 'latex', 'rotation', 0);
            set(y_label, 'Units', 'Normalized', 'Position', [-0.1, 0.47]);
            xlabel('$time(sec)$', 'Interpreter', 'latex');
            grid on;
        end
    end
end
