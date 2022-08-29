function [payload, icl_trans, icl_rot]= gazebo_init(traj_mode, sim_t)

    payload = gazebo_payload;
    payload.traj_mode = traj_mode;

    %% Physical property
    payload.m = 0.1;
    payload.J = [0.030,    0,   0;
                     0, 0.03,   0;
                     0,    0,   0.05];

    % Gazebo simulation time
    payload.total_step = sim_t / 0.04;

    payload.x = zeros(3,payload.total_step);
    payload.v = zeros(3,payload.total_step);
    payload.a = 0;
    payload.R = zeros(9, payload.total_step);
    
    payload.W = zeros(3, payload.total_step);
    payload.dW = zeros(3, payload.total_step);

    payload.ex = zeros(3, payload.total_step);
    payload.ev = zeros(3, payload.total_step);
    payload.eR = zeros(3, payload.total_step);
    payload.eW = zeros(3, payload.total_step);

    payload.force = zeros(3,payload.total_step);
    payload.moment = zeros(3,payload.total_step);
    
    % translation: m m*CoG  rotation: CoG J3x1 (todo: 6x1)
    payload.translation_estimation = zeros(4, payload.total_step);
    payload.rotation_estimation = zeros(6, payload.total_step);
    
    %% Grasp position 
    payload.u1 = zeros(3, payload.total_step);
    payload.u2 = zeros(3, payload.total_step);
    payload.u3 = zeros(3, payload.total_step);
    payload.u4 = zeros(3, payload.total_step);
    payload.translation_estimation(:,1) = [payload.m; 0 ; 0 ; 0 ];
    payload.rotation_estimation(:, 1) = [0; 0; 0; 0; 0; 0];
    %% ICL initialize

    % Translation ICL initialize
    icl_trans = integral_concurrent_learning;
    icl_trans.N_diag = 10;
    icl_trans.mat_diag_matrix = zeros(4, icl_trans.N_diag);
    icl_trans.mat_diag_sum = zeros(4, 1);
    icl_trans.index_diag = 0;
    icl_trans.current_force = zeros(3, 1);
    
    % Rotation ICL initialize
    icl_rot = integral_concurrent_learning;
    icl_rot.N_diag = 10;
    icl_rot.mat_diag_matrix = zeros(6, icl_rot.N_diag);
    icl_rot.mat_diag_sum = zeros(6, 1);
    icl_rot.index_diag = 0;
    icl_rot.current_moment = zeros(3,1);
    icl_rot.W_last = zeros(3, 1);
    icl_rot.f_last = zeros(3, 1);

end