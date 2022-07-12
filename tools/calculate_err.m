function err = calculate_err(est, gt)
    err = (est - gt)/est*100;
end
