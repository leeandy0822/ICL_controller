
clc;
close all;

even = load('data/optimized.mat');
multirotor = even.multirotor_data;
without = load('data/without.mat');
bad = without.multirotor_data;


sim_t = 90;

iter = 14928;
t_temp = multirotor.t;
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




% figure;
% tiledlayout(3,1)
% nexttile
% plot(t,multirotor.x(1, 1:iter),t,tra(1, 1:iter),'--',LineWidth=3.0);
% set(gca,'FontSize', 20);
% hold on
% plot(t,bad.x(1, 1:iter),'-',LineWidth=3.0);
% title('Trajectory Tracking','FontSize',40,'Interpreter', 'latex')
% y = ylabel('X (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
% set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
% xlim([0,sim_t])
% ylim([-3,4])
% grid on
% nexttile
% plot(t,multirotor.x(2, 1:iter),t,tra(2, 1:iter),'--',LineWidth=3.0);
% set(gca,'FontSize', 20);
% hold on
% plot(t,bad.x(2, 1:iter),LineWidth=3.0);
% y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
% set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
% xlim([0,sim_t])
% ylim([-4.5,0.5])
% grid on
% nexttile
% plot(t,multirotor.x(3, 1:iter),t,tra(3, 1:iter),'--',LineWidth=3.0);
% set(gca,'FontSize', 20);
% hold on
% plot(t,bad.x(3, 1:iter),LineWidth=3.0);
% set(gca,'FontSize', 20);
% legend('Even + CL Controller', 'Desired', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
% xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
% y = ylabel('Z (m)', 'Interpreter', 'latex','FontSize', 35, 'Rotation',90);
% set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
% xlim([0,sim_t])
% grid on
% ylim([0,1.5])
% 

figure;
tiledlayout(3,1)
nexttile
plot(t_temp,ex_temp(1, :),LineWidth=3.0)
hold on
plot(t_temp,ex_bad(1,:), 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
title('Position Error','Interpreter', 'latex','FontSize', 40)
grid on
y = ylabel('$ex_1$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(2, :),LineWidth=3.0)
hold on
plot(t_temp,ex_bad(2,:), 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
grid on
y = ylabel('$ex_2$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(3, :),LineWidth=3.0)
hold on
plot(t_temp,ex_bad(3,:), 'Color', '#EDB120', LineWidth = 3.0)
grid on
set(gca,'FontSize', 20);
y = ylabel('$ex_3$ (m)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
legend('Optimized + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
xlim([0,sim_t])
ylim([-1,0.5])




figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ev_temp(1, :),LineWidth=3.0)
hold on
plot(t_temp,ev_bad(1,:), 'Color', '#EDB120', LineWidth = 3.0)
grid on
set(gca,'FontSize', 20);
title('Velocity Error','Interpreter', 'latex','FontSize', 40)
y = ylabel('$ev_1$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ev_temp(2, :),LineWidth=3.0)
hold on
plot(t_temp,ev_bad(2,:), 'Color', '#EDB120', LineWidth = 3.0)
grid on
set(gca,'FontSize', 20);
y = ylabel('$ev_2$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ev_temp(3, :),LineWidth=3.0)
hold on
plot(t_temp,ev_bad(3,:), 'Color', '#EDB120', LineWidth = 3.0)
grid on
set(gca,'FontSize', 20);
y = ylabel('$ev_3$ (m/s)', 'Interpreter', 'latex','FontSize', 44, 'Rotation',90);
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
legend('Even + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-1,0.5])



figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,eR_temp(2, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eR_bad(2,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
title('Rotation Error','Interpreter', 'latex','FontSize', 40)
grid on
y = ylabel('$eR_1$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-90,90])
nexttile
plot(t_temp,eR_temp(1, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eR_bad(1,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
grid on
y = ylabel('$eR_2$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlim([0,sim_t])
ylim([-90,90])
nexttile
plot(t_temp,eR_temp(3, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eR_bad(3,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
grid on
y = ylabel('$eR_3$ (degree)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
xlim([0,sim_t])
ylim([-13,7])
legend('Optimized + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')



figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,eW_temp(2, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eW_bad(2,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
title("Angular Velocity Errors ",'FontSize', 40,'Interpreter', 'latex');
grid on
y = ylabel('$e_{\Omega_1}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-90,90])
nexttile
plot(t_temp,eW_temp(1, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eW_bad(1,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
grid on
y = ylabel('$e_{\Omega_2}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-90,90])
nexttile
plot(t_temp,eW_temp(3, :)/1.57*180,LineWidth=3.0)
hold on
plot(t_temp,eW_bad(3,:)/1.57*180, 'Color', '#EDB120', LineWidth = 3.0)
set(gca,'FontSize', 20);
grid on
y = ylabel('$e_{\Omega_3}(degree/s)$', 'Interpreter', 'latex','Rotation',90,'FontSize', 34);
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-90,90])
legend('Optimized + CL Controller', 'Even + Geometric Controller', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')


figure;
tiledlayout(3,1)
nexttile
% Plot necessary
Cog_x = 0.048;
Cog_y = 0.012;
plot(t_temp,mass_temp(1,:),t_temp,ones(1,numel(t_temp))*8.6,LineWidth=3.0)
grid on
set(gca,'FontSize', 20);
title('Estimation of Mass and CoG','Interpreter', 'latex','FontSize', 35)
legend('$\hat{\theta}_{m}$', '$\theta_{m}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
y = ylabel('Mass (kg)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
xlim([0,sim_t])
ylim([7,10])
nexttile
plot(t_temp, cogx_temp,t_temp,ones(1,numel(t_temp))*Cog_x,LineWidth=3.0)
grid on
set(gca,'FontSize', 20);
legend('$\hat{\theta}_{cog_x}$', '$\theta_{cog_x}$', 'Interpreter', 'latex','FontSize', 34, 'Location', 'southeast','NumColumns',2)
y = ylabel('$CoG_x$ (cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42]);
xlim([0,sim_t])
ylim([-0.1, 0.1])
nexttile
plot(t_temp, cogy_temp,t_temp,ones(1,numel(t_temp))*Cog_y,LineWidth=3.0)
grid on
set(gca,'FontSize', 20);
legend('$\hat{\theta}_{CoG_y}$','$\theta_{CoG_y}$','FontSize', 28,'Location', 'southeast', 'Interpreter', 'latex','NumColumns',2)
y = ylabel('$CoG_y$ (cm)', 'Interpreter', 'latex','FontSize', 34, 'Rotation',90);
set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
xlim([0,sim_t])
ylim([-0.06, 0.06])

figure;
tiledlayout(2,1)
nexttile
% Plot necessary
theta_m_ground_truth = ones(1, length(t))*8.6;
Cog_x = 0.048;
Cog_y = 0.014;
plot(t_temp,mass_temp-8.61,LineWidth=3.0)
title("Estimation Error",'FontSize', 40,'Interpreter', 'latex');
legend('$||\tilde{\theta}_m||$','FontSize', 28,'Interpreter', 'latex');
y = ylabel('$||\tilde{\theta}_m||(kg)$','Interpreter', 'latex','FontSize', 34);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlim([0,sim_t])
ylim([-0.6,1.2])
nexttile
temp_cog = ones(1,iter);
for i = 1:1:iter
    temp_cog(1,i) = 1*sqrt(multirotor.inertia_estimation(2,i)*multirotor.inertia_estimation(2,i) + multirotor.inertia_estimation(1,i)*multirotor.inertia_estimation(1,i));
end
plot(t_temp, -(cogx_temp-Cog_x)*100,t_temp, -(cogy_temp-Cog_y)*100,LineWidth=3.0)
legend("$||\tilde{\theta}_{CoG_x}||$","$||\tilde{\theta}_{CoG_y}||$", 'FontSize', 28,'Location', 'northeast','Interpreter', 'latex')
y = ylabel('$||\tilde{\theta}_{CoG}||(cm)$','Interpreter', 'latex','FontSize', 28);
set(y, 'Units', 'Normalized', 'Position', [-0.05, 0.42])
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
xlim([0,sim_t])
ylim([-8, 8])




figure
subplot(211)
plot(t_temp, bad.uav1_power,'linewidth', 3)
hold on
plot(t_temp, bad.uav2_power,'linewidth', 3)
hold on
plot(t_temp, bad.uav3_power,'linewidth', 3)
hold on
plot(t_temp, bad.uav4_power,'linewidth', 3)
xlim([10,sim_t])
ylim([40,140])
set(gca,'FontSize', 25);
title('Power Consumption','Interpreter', 'latex','FontSize', 36)
ylabel('Power ($\propto F^{\frac{3}{2}}$)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Even Formation - UAV1', 'Even Formation - UAV2', 'Even Formation - UAV3', 'Even Formation - UAV4', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast', 'NumColumns',2)
grid on
subplot(212)
plot(t_temp, multirotor.uav1_power,'linewidth', 3)
hold on
plot(t_temp, multirotor.uav2_power,'linewidth', 3)
hold on
plot(t_temp, multirotor.uav3_power,'linewidth', 3)
hold on
plot(t_temp, multirotor.uav4_power,'linewidth', 3)
set(gca,'FontSize', 25);
ylabel('Power ($\propto F^{\frac{3}{2}}$)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
legend('Optimized Formation - UAV1', 'Optimized Formation - UAV2', 'Optimized Formation - UAV3', 'Optimized Formation - UAV4', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast', 'NumColumns',2)
grid on
xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 35);
xlim([10,sim_t])
ylim([40,140])


