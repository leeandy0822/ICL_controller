classdef integral_concurrent_learning
    properties
        % used in moment ICL control
        N_diag
        mat_diag_matrix
        mat_diag_sum
        index_diag
        if_full_diag
        mass_N_diag 
        mass_mat_diag_matrix  
        mass_mat_diag_sum
        mass_index_diag
        mass_if_full_diag
        W_last
        current_moment
        current_force
    end
end
