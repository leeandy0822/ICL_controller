function plotgraph(tra, payload)

    B = [ 0 1 0 ; 1 0 0 ; 0 0 -1];
    t = payload.t;
    % plot
    figure(1);
    tra(1:3,:) = B*tra(1:3,:);
    payload.x(1:3,:) = B*payload.x(1:3,:);
    plot3(tra(1,:),tra(2,:),tra(3,:),'LineWidth', 1.4, 'Color','k')
    hold on;
    plot3(payload.x(1,:),payload.x(2,:),payload.x(3,:),'LineWidth', 1, 'Color','r')
    hold on;
    title('Trajectory','FontSize', 20);
    hold on;
    
    for i = 1:1500:length(payload.t)
        matrix = reshape(payload.R(:,i),3,3);
        matrix = B*matrix;
        norm = 3;
        quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,1)/norm,matrix(2,1)/norm,matrix(3,1)/norm,'r',"LineWidth",1); 
        quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,2)/norm,matrix(2,2)/norm,matrix(3,2)/norm,'g',"LineWidth",1); 
        quiver3(payload.x(1,i),payload.x(2,i),payload.x(3,i),matrix(1,3)/norm,matrix(2,3)/norm,matrix(3,3)/norm,'b',"LineWidth",1); 
    end
    
    hold on;
    grid on;
    xlabel('x(m)'), ylabel('y(m)'), zlabel('z(m)')
    axis equal
    
    figure(2);
    tiledlayout(2,2)
    nexttile
    % Plot position tracking error
    plot(t,payload.ex(1,:),t,payload.ex(2,:),t,payload.ex(3,:),LineWidth=2.0)
    title("Postion Tracking errors",'FontSize', 20);
    legend('ex_1','ex_2','ex_3','FontSize', 15)
    nexttile
    % Plot velocity tracking error
    plot(t,payload.ev(1,:),t,payload.ev(2,:),t,payload.ev(3,:),LineWidth=2.0)
    title("Velocity Tracking errors",'FontSize', 20);
    legend('ev_1','ev_2','ev_3','FontSize', 15)
    
    nexttile
    % Plot rotation tracking error
    plot(t,payload.eR(1,:),t,payload.eR(2,:),t,payload.eR(3,:),LineWidth=2.0)
    title("Rotation Errors",'FontSize', 20);
    legend('er_1','er_2','er_3','FontSize', 15)
    nexttile
    % Plot Omega tracking error
    plot(t,payload.eW(1,:),t,payload.eW(2,:),t,payload.eW(3,:),LineWidth=2.0)
    title("Angular Velocity Errors",'FontSize', 20);
    legend('eo_1','eo_2','eo_3','FontSize', 15)
    
    %% Calculating Error
    % turn mass x CoG -> CoG
    payload.translation_estimation(2:4,:) = payload.translation_estimation(2:4,:) ./ payload.translation_estimation(1,:);
    trans_est = payload.translation_estimation(:,length(t))';
    m = trans_est(1);

    cog_x = trans_est(2);
    cog_y = trans_est(3);
    cog_z = trans_est(4);
    
    rot_est = payload.rotation_estimation(:,length(t))';
    cog_jx = rot_est(1);
    cog_jy = rot_est(2);
    cog_jz = rot_est(3);
    J_x = rot_est(4);
    J_y = rot_est(5);
    J_z = rot_est(6);
    
    
    fprintf("Mass Estimate Error: %.2f Percent\n", calculate_err(m, payload.m))
    fprintf("CoG-x Tra Error: %.2f Percent\n", calculate_err(cog_x, payload.body2CoG(1)))
    fprintf("CoG-y Tra Error: %.2f Percent\n", calculate_err(cog_y, payload.body2CoG(2)))
    fprintf("CoG-z Tra Error: %.2f Percent\n", calculate_err(cog_z, payload.body2CoG(3)))
    fprintf("Inertia XX Error: %.2f Percent\n", calculate_err(J_x,payload.J(1)))
    fprintf("Inertia YY Error: %.2f Percent\n", calculate_err(J_y,payload.J(5)))
    fprintf("Inertia ZZ Error: %.2f Percent\n", calculate_err(J_z,payload.J(9)))
    fprintf("CoG-x Rot Error: %.2f Percent\n", calculate_err(cog_jx,payload.body2CoG(1)))
    fprintf("CoG-y Rot Error: %.2f Percent\n", calculate_err(cog_jy,payload.body2CoG(2)))
    fprintf("CoG-z Rot Error: %.2f Percent\n", calculate_err(cog_jz,payload.body2CoG(3)))
    
    
    figure(3);
    tiledlayout(4,1)
    nexttile
    % Plot necessary
    theta_m_ground_truth = ones(1, length(payload.t))*payload.m;
    plot(t,payload.translation_estimation(1,:),t,theta_m_ground_truth,LineWidth=2.0)
    title("Mass",'FontSize', 20);
    legend('Estimated Mass','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(1,:),t,ones(1,length(t))*payload.body2CoG(1),LineWidth=2.0)
    title("CoG (x)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(2,:),t,ones(1,length(t))*payload.body2CoG(2),LineWidth=2.0)
    title("CoG (y)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    nexttile
    plot(t, payload.rotation_estimation(3,:),t,ones(1,length(t))*payload.body2CoG(3),LineWidth=2.0)
    title("CoG (z)",'FontSize', 20);
    legend('Estimate','Ground Truth','FontSize', 15)
    
    figure(4)
    tiledlayout(2,1)
    nexttile
    plot(t, payload.freq,LineWidth=2.0);
    title("Control Frequency",'FontSize', 20);
    
    % distributed force
    figure(6)
    tiledlayout(3,1)
    nexttile
    plot(t, payload.u1(1,:), t , payload.u1(2,:), t , payload.u1(3,:),LineWidth=2.0);
    title("Distributed force - u1",'FontSize', 20);
    legend('x','y','z','FontSize', 15)
    nexttile
    plot(t, payload.u2(1,:), t , payload.u2(2,:), t , payload.u2(3,:),LineWidth=2.0);
    title("Distributed force - u2",'FontSize', 20);
    legend('x','y','z','FontSize', 15)
    nexttile
    plot(t, payload.u3(1,:), t , payload.u3(2,:), t , payload.u3(3,:),LineWidth=2.0);
    title("Distributed force - u3",'FontSize', 20);
    legend('x','y','z','FontSize', 15)


    
    % 
    % % Plot unnecessary
    % figure(4);
    % tiledlayout(2,3)
    % nexttile
    % plot(t, payload.rotation_estimation(4,:),t,ones(1,length(t))*payload.J(1),LineWidth=2.0)
    % title("Inertia xx",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.rotation_estimation(5,:),t,ones(1,length(t))*payload.J(5),LineWidth=2.0)
    % title("Inertia yy",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.rotation_estimation(6,:),t,ones(1,length(t))*payload.J(9),LineWidth=2.0)
    % title("Inertia zz",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(2,:),t,ones(1,length(t))*payload.body2CoG(1),LineWidth=2.0)
    % title("From Mass CoG (x)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(3,:),t,ones(1,length(t))*payload.body2CoG(2),LineWidth=2.0)
    % title("From Mass CoG (y)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    % nexttile
    % plot(t, payload.translation_estimation(4,:),t,ones(1,length(t))*payload.body2CoG(3),LineWidth=2.0)
    % title("From Mass CoG (z)",'FontSize', 20);
    % legend('Estimate','Ground Truth','FontSize', 15)
    
    
    % % resultant force
    % figure(5)
    % tiledlayout(2,1)
    % nexttile
    % plot(t, payload.force(1,:), t , payload.force(2,:), t , payload.force(3,:),LineWidth=2.0);
    % title("Force Input",'FontSize', 20);
    % legend('x','y','z','FontSize', 15)
    % nexttile
    % plot(t, payload.moment(1,:), t , payload.moment(2,:), t , payload.moment(3,:),LineWidth=2.0);
    % title("Moment Input",'FontSize', 20);
    % legend('x','y','z','FontSize', 15)
end