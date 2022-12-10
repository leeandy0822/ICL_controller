function M = distribution(uav1_pos, uav2_pos, uav3_pos)
    
    % body frame center = (0, 0) 
    % f1, M1 , f2, M2, f3, M3
    weight = [2,1,1,0.1];
    H = diag([weight*0.5, weight, weight]);
    
    A = [   1      0   0   0     1      0   0   0      1      0     0     0;
         uav1_pos(2)   1   0   0  uav2_pos(2)   1   0   0   uav3_pos(2)   1     0     0;
         uav1_pos(1)   0   1   0  uav2_pos(1)   0   1   0   uav3_pos(1)   0     1     0;
            0      0   0   1     0      0   0   1      0      0     0     1;];
    
    M  = H^(-2)*A'*(A*H^(-2)*A')^(-1);
    M = pinv(M)
end
