function bound = bound_control(control, max, min)
    for i = 1:length(control)
        if control(i) > max
            control(i) = max;
        elseif control(i) < min
            control(i) = min;
        end
    end
    bound = control;
end
