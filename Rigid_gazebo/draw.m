
clc;
close all;

even = load('data/video/even.mat');
multirotor = even.multirotor_data;
without = load('data/video/emk.mat');
bad = without.multirotor_data;


sim_t = 90;

iter = 14928;
tra = multirotor.tra(:,1:20:iter);
t_temp = multirotor.t;
x_temp = multirotor.x(:,1:20:iter)
ex_temp = multirotor.ex(:,1:20:iter);
ev_temp = multirotor.ev(:,1:20:iter);
eR_temp = multirotor.eR(:,1:20:iter);
eW_temp = multirotor.eW(:,1:20:iter);
mass_temp = multirotor.mass_estimation(:,1:20:iter);
cogx_temp = multirotor.inertia_estimation(1,1:20:iter);
cogy_temp = multirotor.inertia_estimation(2,1:20:iter);

ex_bad = bad.ex(:,1:20:iter);
ev_bad = bad.ev(:,1:20:iter);
eR_bad = bad.eR(:,1:20:iter);
eW_bad = bad.eW(:,1:20:iter);
mass_bad = bad.mass_estimation(:,1:20:iter);
cogx_bad = bad.inertia_estimation(1,1:20:iter);
cogy_bad = bad.inertia_estimation(2,1:20:iter);



N = 4000;
mean(sqrt(multirotor.ex(1,N:20:iter).^2))
mean(sqrt(multirotor.ex(2,N:20:iter).^2))
mean(sqrt(multirotor.ex(3,N:20:iter).^2))
mean(sqrt(multirotor.ev(1,N:20:iter).^2))
mean(sqrt(multirotor.ev(2,N:20:iter).^2))
mean(sqrt(multirotor.ev(3,N:20:iter).^2))
mean(sqrt(multirotor.eR(1,N:20:iter).^2))*180/3.14
mean(sqrt(multirotor.eR(2,N:20:iter).^2))*180/3.14
mean(sqrt(multirotor.eR(3,N:20:iter).^2))*180/3.14


mean(sqrt(bad.ex(1,N:20:iter).^2))
mean(sqrt(bad.ex(2,N:20:iter).^2))
mean(sqrt(bad.ex(3,N:20:iter).^2))
mean(sqrt(bad.ev(1,N:20:iter).^2))
mean(sqrt(bad.ev(2,N:20:iter).^2))
mean(sqrt(bad.ev(3,N:20:iter).^2))
mean(sqrt(bad.eR(1,N:20:iter).^2))*180/3.14
mean(sqrt(bad.eR(2,N:20:iter).^2))*180/3.14
mean(sqrt(bad.eR(3,N:20:iter).^2))*180/3.14


pos = multirotor.x(:,1:40:iter);
bad = bad.x(:,1:40:iter);


figure;

plot(pos(1, 1:373),pos(2, 1:373) ,'linewidth', 4.0,'Color','b')
hold on
plot(bad(1,1:1:370), bad(2,1:1:370),'-','linewidth',4.0, 'Color','r')
hold on
plot(tra(1,1:1:500), tra(2,1:1:500),'--','linewidth',5.0, 'Color','k')
xlabel('X [m]', 'Interpreter', 'latex','FontSize', 35);
ylabel('Y [m]', 'Interpreter', 'latex','FontSize', 35);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Desired','Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
set(gca,'FontSize', 20);
title('Trajectory','Interpreter', 'latex','FontSize', 40)

xlim([-2 4])
ylim([-4.5 0.5])
grid on



figure;
plot3(tra(1,:),tra(2,:),tra(3,:),'LineWidth', 1.4, 'Color','k')
hold on;
plot3(multirotor.x(1,1:iter),multirotor.x(2,1:iter),multirotor.x(3,1:iter),'LineWidth', 1, 'Color','r')
hold on;
title('Trajectory','FontSize', 20);

for i = 1:500:length(iter)
    matrix = reshape(multirotor.R(:,i),3,3);
    norm = 8;
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,1)/norm,matrix(2,1)/norm,matrix(3,1)/norm,'r',"LineWidth",1); 
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,2)/norm,matrix(2,2)/norm,matrix(3,2)/norm,'g',"LineWidth",1); 
    quiver3(multirotor.x(1,i),multirotor.x(2,i),multirotor.x(3,i),matrix(1,3)/norm,matrix(2,3)/norm,matrix(3,3)/norm,'b',"LineWidth",1); 
end

hold on;
grid on;
xlabel('x(m)'), ylabel('y(m)'), zlabel('z(m)')
axis equal


step = 3; 

figure;
tiledlayout(3,1)
nexttile
plot(t_temp(1:step:end),ex_temp(1, 1:step:end),'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),ex_bad(1,1:step:end), 'Color', 'r', LineWidth = 3.0)
set(gca,'FontSize', 25);
title('Position Error','Interpreter', 'latex','FontSize', 40)
grid on
y = ylabel('$ex_1$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-0.5,0.5])
nexttile
plot(t_temp(1:step:end),ex_temp(2, 1:step:end),'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),ex_bad(2,1:step:end), 'Color', 'r', LineWidth = 3.0)
set(gca,'FontSize', 25);
grid on
y =ylabel('$ex_2$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp(1:step:end),-ex_temp(3, 1:step:end),'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),-ex_bad(3,1:step:end), 'Color', 'r', LineWidth = 3.0)
grid on
set(gca,'FontSize', 25);
y =ylabel('$ex_3$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
xlim([0,sim_t])
ylim([-1,0.5])



% 
% figure;
% tiledlayout(3,1)
% nexttile
% % Plot position tracking error
% plot(t_temp,ev_temp(1, :),LineWidth=3.0)
% hold on
% plot(t_temp,ev_bad(1,:), 'Color', '#EDB120', LineWidth = 3.0)
% grid on
% set(gca,'FontSize', 20);
% title('Velocity Error','Interpreter', 'latex','FontSize', 40)
% y =ylabel('$ev_1$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
% xlim([0,sim_t])
% ylim([-1,1])
% nexttile
% plot(t_temp,ev_temp(2, :),LineWidth=3.0)
% hold on
% plot(t_temp,ev_bad(2,:), 'Color', '#EDB120', LineWidth = 3.0)
% grid on
% set(gca,'FontSize', 20);
% y =ylabel('$ev_2$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
% xlim([0,sim_t])
% ylim([-1,1])
% nexttile
% plot(t_temp,ev_temp(3, :),LineWidth=3.0)
% hold on
% plot(t_temp,ev_bad(3,:), 'Color', '#EDB120', LineWidth = 3.0)
% grid on
% set(gca,'FontSize', 20);
% y =ylabel('$ev_3$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
% xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
% legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
% set(y, 'Units', 'Normalized', 'Position', [-0.08, 0.42])
% xlim([0,sim_t])
% ylim([-1,0.5])



figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,eR_temp(2, :)/1.57*180,'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp,eR_bad(2,:)/1.57*180, 'Color', 'r', LineWidth = 3.0)
set(gca,'FontSize', 25);
title('Rotation Error','Interpreter', 'latex','FontSize', 40)
grid on
y = ylabel('$eR_1$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-60,60])
nexttile
plot(t_temp,eR_temp(1, :)/1.57*180,'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp,eR_bad(1,:)/1.57*180, 'Color', 'r', LineWidth = 3.0)
set(gca,'FontSize', 25);
grid on
y = ylabel('$eR_2$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-60,60])
nexttile
plot(t_temp,eR_temp(3, :)/1.57*180,'Color', 'b',LineWidth=3.0)
hold on
plot(t_temp,eR_bad(3,:)/1.57*180, 'Color', 'r', LineWidth = 3.0)
set(gca,'FontSize', 25);
grid on
y = ylabel('$eR_3$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
xlim([0,sim_t])
ylim([-5,5])
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')


% 
% figure;
% tiledlayout(3,1)
% nexttile
% % Plot position tracking error
% plot(t_temp,eW_temp(2, :)/1.57*180*0.8,LineWidth=3.0)
% hold on
% plot(t_temp,eW_bad(2,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
% set(gca,'FontSize', 20);
% title("Angular Velocity Errors ",'FontSize', 40,'Interpreter', 'latex');
% grid on
% y = ylabel('$e_{\Omega_1}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
% set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
% xlim([0,sim_t])
% ylim([-90,90])
% nexttile
% plot(t_temp,eW_temp(1, :)/1.57*180*0.8,LineWidth=3.0)
% hold on
% plot(t_temp,eW_bad(1,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
% set(gca,'FontSize', 20);
% grid on
% y = ylabel('$e_{\Omega_2}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
% set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
% xlim([0,sim_t])
% ylim([-90,90])
% nexttile
% plot(t_temp,eW_temp(3, :)/1.57*180,LineWidth=3.0)
% hold on
% plot(t_temp,eW_bad(3,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
% set(gca,'FontSize', 20);
% grid on
% y = ylabel('$e_{\Omega_3}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
% xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
% set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
% xlim([0,sim_t])
% ylim([-90,90])
% legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
% 

step = 3;

figure;
tiledlayout(3,1)
nexttile
% Plot necessary
Cog_x = 0.048;
Cog_y = 0.012;
plot(t_temp(1:step:end),mass_temp(1,1:step:end),'-','Color', 'r',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),ones(1,numel(t_temp(1:step:end)))*8.6,'--','Color', 'k',LineWidth=4.0)
grid on
set(gca,'FontSize', 25);
title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
y = ylabel('Mass (kg)', 'Interpreter', 'latex','FontSize', 30, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.04, 0.35]);
xlim([0,sim_t])
ylim([7,10.5])
nexttile
plot(t_temp(1:step:end), cogy_temp(1:step:end)*100,'-','Color', 'r',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),ones(1,numel(t_temp(1:step:end)))*Cog_y*100,'--','Color', 'k',LineWidth=4.0)
grid on
set(gca,'FontSize', 25);
legend('$\hat{\theta}_{CoG_x}$','$\theta_{CoG_x}$','FontSize', 34,'Location', 'southeast', 'Interpreter', 'latex','NumColumns',2)
y = ylabel('$CoG_x$ (cm)', 'Interpreter', 'latex','FontSize', 30, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.04, 0.35])
xlim([0,sim_t])
ylim([-9, 9])
nexttile
plot(t_temp(1:step:end), cogx_temp(1:step:end)*100,'-','Color', 'r',LineWidth=3.0)
hold on
plot(t_temp(1:step:end),ones(1,numel(t_temp(1:step:end)))*Cog_x*100,'--','Color', 'k',LineWidth=4.0)
grid on
set(gca,'FontSize', 25);
legend('$\hat{\theta}_{CoG_y}$', '$\theta_{CoG_y}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
y = ylabel('$CoG_y$ (cm)', 'Interpreter', 'latex','FontSize', 30, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.04, 0.55]);
xlim([0,sim_t])
ylim([-4, 13])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);





% figure;
% tiledlayout(2,1)
% nexttile
% % Plot necessary
% theta_m_ground_truth = ones(1, length(t_temp))*8.6;
% Cog_x = 0.048;
% Cog_y = 0.014;
% plot(t_temp,mass_temp-8.61,LineWidth=3.0)
% title("Estimation Error",'FontSize', 40,'Interpreter', 'latex');
% legend('$||\tilde{\theta}_m||$','FontSize', 28,'Interpreter', 'latex');
% y = ylabel('$||\tilde{\theta}_m||(kg)$','Interpreter', 'latex','FontSize', 34);
% set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
% xlim([0,sim_t])
% ylim([-0.6,1.2])
% nexttile
% temp_cog = ones(1,iter);
% for i = 1:1:iter
%     temp_cog(1,i) = 1*sqrt(multirotor.inertia_estimation(2,i)*multirotor.inertia_estimation(2,i) + multirotor.inertia_estimation(1,i)*multirotor.inertia_estimation(1,i));
% end
% plot(t_temp, -(cogx_temp-Cog_x)*100,t_temp, -(cogy_temp-Cog_y)*100,LineWidth=3.0)
% legend("$||\tilde{\theta}_{CoG_x}||$","$||\tilde{\theta}_{CoG_y}||$", 'FontSize', 28,'Location', 'northeast','Interpreter', 'latex')
% y = ylabel('$||\tilde{\theta}_{CoG}||(cm)$','Interpreter', 'latex','FontSize', 28);
% set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
% xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
% xlim([0,sim_t])
% ylim([-8, 8])

% plot(t_temp,uav1_power,t_temp, uav2_power, t_temp, uav3_power,t_temp,  uav4_power, LineWidth=3.0)
% legend('UAV1','UAV2','UAV3','UAV4','FontSize', 12, 'Interpreter', 'latex')
% title("Power Consumption",'FontSize', 15, 'Interpreter', 'latex');
% 

