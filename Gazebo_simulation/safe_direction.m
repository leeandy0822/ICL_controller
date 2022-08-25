function F_new = safe_direction(F)
    
    magnitude = norm(F);
    F_dir = F/norm(F);
    center = [0 ; 0 ; 1];
    angle_rad = acos(dot(F_dir, center)/(norm(F_dir)*norm(center)));
    angle_deg = rad2deg(angle_rad);
    if(angle_deg > 45 || angle_deg < -45)
        % interploation of F direction
        minus = abs(angle_deg) - 44.9;
        t = minus/abs(angle_deg);
        new_direction = sin((1-t)*angle_rad)/sin(angle_rad)*F_dir + sin(t*angle_rad)/sin(angle_rad)*center;
        F_new = new_direction*magnitude;
        debug = acos(dot(F_new, center)/(norm(F_new)*norm(center)))/pi*180;
    else
        F_new = F;
    end

    %% upper bound
    F_new_dir = F_new/norm(F_new);
    F_new_mag = norm(F_new);
    F_upperbound = 3*9.8;
    F_new_mag = min(F_upperbound, norm(F_new_mag));
    F_new = F_new_dir*F_new_mag;

end