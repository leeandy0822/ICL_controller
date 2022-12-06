function M = cal_allocation_matrix(d, c_tau)
    M = [     1,     1,      1,     1;
             -d,    +d,     +d,    -d;
             +d,    +d,     -d,    -d;
         -c_tau, c_tau, -c_tau, c_tau];
end
