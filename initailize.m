function [payload, icl_trans, icl_rot, ctrl]= initailize(mode,optim_mode, dt,sim_t)

    payload = payload_dynamics;
    payload.dt = dt;
    payload.sim_t = sim_t;
    payload.t = 0:dt:sim_t;
    payload.traj_mode = mode;
    %% Physical property
    payload.m = 5;
    payload.J = [0.030, 0, 0;
                    0, 0.03, 0;
                    0, 0, 0.0500];
    
    payload.x = zeros(3,length(payload.t));
    payload.v = zeros(3,length(payload.t));
    payload.R = zeros(9, length(payload.t));
    payload.Rd = zeros(9, length(payload.t));
    payload.W = zeros(3, length(payload.t));
    payload.dW = zeros(3, length(payload.t));
    payload.ex = zeros(3, length(payload.t));
    payload.ev = zeros(3, length(payload.t));
    payload.force = zeros(3,length(payload.t));
    payload.energy = zeros(3,length(payload.t));
    payload.moment = zeros(3,length(payload.t));
    
    % translation: m m*CoG  rotation: CoG J3x1 (todo: 6x1)
    payload.translation_estimation = zeros(4, length(payload.t));
    payload.rotation_estimation = zeros(6, length(payload.t));
    
    %% Grasp position 
    
    payload.B = [eye(3) eye(3) eye(3); hat_map(payload.p1) hat_map(payload.p2) hat_map(payload.p3)];
    payload.B_real =  payload.B(4:6,:) + [hat_map(payload.body2CoG) hat_map(payload.body2CoG) hat_map(payload.body2CoG)];
    payload.B_real = [eye(3) eye(3) eye(3) ; payload.B_real];
    payload.u1 = zeros(3, length(payload.t));
    payload.u2 = zeros(3, length(payload.t));
    payload.u3 = zeros(3, length(payload.t));
    
    
    %% Optimal Grasp Position
    if optim_mode == 1
        payload.body2CoG =[0.08; 0.08; 0.00];
        payload.p1 = [-0.16; 0.3; 0];
        payload.p2 = [-0.23; -0.2; 0];
        payload.p3 = [0.15; -0.34; 0];
    end
    
    %initial condition
    eul = [0 0 0];
    R0 = eul2rotm(eul);
    payload.R(:,1) = reshape(R0,9,1);
    payload.W(:,1) = [0, 0, 0];
    % initial theta guess
    payload.translation_estimation(:,1) = [3; 0.05 ; 0.05 ; 0.05 ];
    payload.rotation_estimation(:, 1) = [0.01; 0.01; 0.01; 0; 0; 0];
    payload.freq =  zeros(1, length(payload.t));
    
    if payload.traj_mode=="eight"
        x0 = [0; 7; 0];
    else
        x0 = [0; 0; 0];
    end
    
    
    x0_dot = [0 ; 0; 0];
    payload.x(:,1) = x0;
    payload.v(:,1) = x0_dot;
    
    
    %% ICL initialize
    % initialize integral concurrent learning
    icl_trans = integral_concurrent_learning;
    icl_trans.N_diag = 20;
    icl_trans.mat_diag_matrix = zeros(4, icl_trans.N_diag);
    icl_trans.mat_diag_sum = zeros(4, 1);
    icl_trans.index_diag = 0;
    icl_trans.current_force = zeros(3, 1);
    
    
    % initialize integral concurrent learning
    icl_rot = integral_concurrent_learning;
    icl_rot.N_diag = 5;
    icl_rot.mat_diag_matrix = zeros(6, icl_rot.N_diag);
    icl_rot.mat_diag_sum = zeros(6, 1);
    icl_rot.index_diag = 0;
    icl_rot.current_moment = zeros(3,1);
    icl_rot.W_last = zeros(3, 1);
    icl_rot.f_last = zeros(3, 1);


    %% initialize controller
    ctrl = controller;

end