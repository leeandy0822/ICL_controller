% A simulation for geometric tracking control of multirotors
close all;
tic;

t_temp = readtable('data/even_time.csv');
t_temp = t_temp(:, :);
ex_temp = readtable('data/even_position_error.csv');
ex_temp = ex_temp(:, :);
eR_temp = readtable('data/even_velocity_error.csv');
eR_temp = eR_temp(:, :);
eW_temp = readtable('data/even_rotation_error.csv');
eW_temp = eW_temp(:, :);
mass_temp = readtable('data/even_mass.csv');
mass_temp = mass_temp(:, :);
cogx_temp = readtable('data/even_cogx.csv');
cogx_temp = cogx_temp(:, :);
cogy_temp = readtable('data/even_cogy.csv');
cogy_temp = cogy_temp(:, :);


file_title = "even";
writematrix(t_temp, file_title + "_time");
writematrix(ex_temp, file_title + "_position_error");
writematrix(ev_temp,file_title + '_velocity_error');
writematrix(eR_temp,file_title + '_rotation_error');
writematrix(eW_temp,file_title + '_angular_error');
writematrix(mass_temp,file_title + '_mass');
writematrix(cogx_temp,file_title + '_cogx');
writematrix(cogy_temp,file_title + '_cogy');

figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ex_temp(1, :),LineWidth=3.0)
set(gca,'FontSize', 18);
title("Postion Errors(m)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{x_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(2, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{x_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(3, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{x_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])

figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ev_temp(1, :),LineWidth=3.0)
set(gca,'FontSize', 18);
title("Velocity Errors(m/s)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{v_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ev_temp(2, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{v_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ev_temp(3, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{v_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 24);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])



figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ex_temp(1, :),LineWidth=3.0)
set(gca,'FontSize', 18);
title("Rotation Errors(rad)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{R_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(2, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{R_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(3, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{R_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])




figure;
tiledlayout(3,1)
nexttile
% Plot position tracking error
plot(t_temp,ex_temp(1, :),LineWidth=3.0)
set(gca,'FontSize', 18);
title("Angualr Velocity Errors (rad/s)",'FontSize', 28,'Interpreter', 'latex');
grid on
y = ylabel('$e_{\Omega_1}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(2, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{\Omega_2}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])
nexttile
plot(t_temp,ex_temp(3, :),LineWidth=3.0)
set(gca,'FontSize', 18);
grid on
y = ylabel('$e_{\Omega_3}$', 'Interpreter', 'latex','Rotation',0,'FontSize', 22);
set(y, 'Units', 'Normalized', 'Position', [-0.07, 0.42])
xlim([0,sim_t])
ylim([-1,1])






figure;
tiledlayout(3,1)
nexttile
% Plot necessary
theta_m_ground_truth = ones(1, length(t))*8.6;
Cog_x = 0.046;
Cog_y = 0.0115;
plot(t_temp,mass_temp,t_temp,ones(1,numel(mass_temp))*8.6,LineWidth=3.0)
set(gca,'FontSize', 18);
title("Mass",'FontSize', 22);
legend('Estimated Mass(kg)','Ground Truth(kg)','FontSize', 15,'Location', 'southeast')
xlim([0,sim_t])
ylim([6,11])
nexttile
plot(t_temp, cogx_temp,t_temp,ones(1,numel(mass_temp))*Cog_x,LineWidth=3.0)
set(gca,'FontSize', 18);
title("CoG (x)",'FontSize', 22);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15,'Location', 'southeast')
xlim([0,sim_t])
ylim([-0.07, 0.08])
nexttile
plot(t_temp, cogy_temp,t_temp,ones(1,numel(mass_temp))*Cog_y,LineWidth=3.0)
set(gca,'FontSize', 18);
title("CoG (y)",'FontSize', 22);
legend('Estimated (m)','Ground Truth(m)','FontSize', 15,'Location', 'southeast')
xlim([0,sim_t])
ylim([-0.04, 0.04])


figure;
tiledlayout(2,1)
nexttile

% Plot necessary
theta_m_ground_truth = ones(1, length(t))*8.6;
Cog_x = 0.047;
Cog_y = 0.012;
plot(t,multirotor.mass_estimation(1,1:iter)-8.6,LineWidth=2.0)
set(gca,'FontSize', 18);
title("Estimated Error",'FontSize', 20);
legend('Mass Estimated Error (kg)','FontSize', 15)
xlim([0,sim_t])
ylim([-1,1.5])

nexttile
temp_cog = ones(1,iter);
for i = 1:1:iter
    temp_cog(1,i) = 1*sqrt(multirotor.inertia_estimation(2,i)*multirotor.inertia_estimation(2,i) + multirotor.inertia_estimation(1,i)*multirotor.inertia_estimation(1,i));
end
plot(t, (multirotor.inertia_estimation(1,1:iter)-Cog_x),t, multirotor.inertia_estimation(2,1:iter)-Cog_y,LineWidth=2.0)
legend("CoG_x Estimated Error(m)","CoG_y Estimated Error(m)", 'FontSize', 15,'Location', 'southeast')
set(gca,'FontSize', 18);
xlim([0,sim_t])
ylim([-0.05, 0.03])

time_animation = t(1:40:end);
data_animation = multirotor.mass_estimation(1,1:40:iter);
video_generator(time_animation,data_animation, 20, "mass.avi", 1, "mass (kg)", 8.6)


figure;
tiledlayout(1,1)
nexttile
% Plot position tracking error
xlim([0,sim_t])
% Plot position tracking error
total_power = multirotor.force_moment(1,1:iter).^1.5;
uav1_power = uav1.force_moment(1,1:1:iter).^1.5;
uav2_power = uav2.force_moment(1,1:1:iter).^1.5;
uav3_power = uav3.force_moment(1,1:1:iter).^1.5;
uav4_power = uav4.force_moment(1,1:1:iter).^1.5;

plot(t,uav1_power,t, uav2_power, t, uav3_power,t,  uav4_power, LineWidth=2.0)
legend('UAV1','UAV2','UAV3','UAV4','FontSize', 12, 'Interpreter', 'latex')
title("Power Consumption",'FontSize', 15, 'Interpreter', 'latex');

xlim([0,sim_t])


temp_t = t;

time = t(1:40:iter);

uav1_power = uav1.force_moment(1,1:40:iter).^1.5;
uav2_power = uav2.force_moment(1,1:40:iter).^1.5;
uav3_power = uav3.force_moment(1,1:40:iter).^1.5;
uav4_power = uav4.force_moment(1,1:40:iter).^1.5;

duration = 10;
offset = 50;
video_name = "even_power.avi";

% Set up the figure
figure('Position', [0 0 720 300]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';
numFrames = numel(time);

% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

for frame = 1:numFrames
    % Clear the figure
    cla;
    
    plot(time(1:frame),uav1_power(1:frame),time(1:frame), uav2_power(1:frame), time(1:frame), uav3_power(1:frame),time(1:frame),  uav4_power(1:frame), LineWidth=2.0)
    % Plot the data points up to the current frame
    legend('UAV1','UAV2','UAV3','UAV4','FontSize',15, 'Interpreter', 'latex', 'Location', 'southeast')
    xlabel('Time(s)');
    ylabel('$Power \propto F^{1.5} $', 'Interpreter', 'latex');
        set(gca,'FontSize', 18);

    title("Power Consumption",'FontSize', 18);
    grid on;
    pause(duration/numFrames);
    ylim([50, 130])
    xlim([min(time), max(time)+50])
    % Capture the frame and add it to the video
    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);
