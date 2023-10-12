close all;
clc;

data = readtable('0707 - Estimation.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{:,16}
cog = data{:,17:18}
time = data{:,23};
time = time - 18;



data = readtable('0707 - Estimation.csv');
data = data(:, :);
est_current_position = data{:,1:3};
est_current_position(:,:) = est_current_position(:,:) + [0.01 -0.013, -0.004];
est_pos = data{:,4:6};
est_vel = data{:,7:9};
est_rot = data{:,10:12};
est_ang = data{:,13:15};
est_mass = data{:,16};
est_cog = data{:,17:18};
est_time = data{:,23};
est_time = est_time - 21;


data = readtable('0707 - EMK.csv');
data = data(:, :);
bad_current_position = data{:,1:3};
bad_current_position(:,:) = bad_current_position(:,:) + [0.1 0.06, 0.12];
bad_pos = data{:,4:6};
bad_vel = data{:,7:9};
bad_rot = data{:,10:12};
bad_ang = data{:,13:15};
bad_mass = data{:,16};
bad_cog = data{:,17:18};
bad_time = data{:,23};
bad_time = bad_time - 40;


duration = 65;
offset = 90;
video_name = "mass.avi";

% Set up the figure
figure('Position', [0 0 900 330]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

numFrames = numel(time);
mass = mass(1:3:numFrames,1);
time = time(1:3:numFrames,1);
cog = cog(1:3:numFrames, :);
% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

for frame = 1:numFrames/3
    % Clear the figure
    cla;

%     plot(time(1:1:frame),mass(1:1:frame,1) ,LineWidth=3.0)
%     yline(3.6, "--", 'color', 'r', 'linewidth', 4.0);
%     legend('$\hat{\theta}_{m}$','${\theta}_{m}$','FontSize',30, 'Interpreter', 'latex', 'Location', 'southeast','NumColumns',2)
%     Plot the data points up to the current frame
%     xlabel('Time(s)','Interpreter', 'latex');
%     ylabel('$Mass(kg)$', 'Interpreter', 'latex');
%     set(gca,'FontSize', 25);
%     grid on;
%     pause(duration/numFrames/8);
%     ylim([2.5, 4.5])
%     xlim([0, 80])

%     plot(time(1:1:frame),cog(1:1:frame,2) ,LineWidth=3.0)
%     yline(0.047, "--", 'color', 'r', 'linewidth', 4.0);
%     legend('$\hat{\theta}_{CoG_y}$','${\theta}_{CoG_y}$','FontSize',30, 'Interpreter', 'latex', 'Location', 'southeast','NumColumns',2)
%     Plot the data points up to the current frame
%     xlabel('Time(s)','Interpreter', 'latex');
%     ylabel('$CoG_y(m)$', 'Interpreter', 'latex');
%     set(gca,'FontSize', 25);
%     grid on;
%     pause(duration/numFrames/8);
%     ylim([-0.06, 0.14])
%     xlim([0, 80])

%     
%     plot(time(1:3:frame),cog(1:3:frame,1) ,LineWidth=3.0)
%     yline(0.000, "--", 'color', 'r', 'linewidth', 4.0);
%     legend('$\hat{\theta}_{CoG_x}$','${\theta}_{CoG_x}$','FontSize',30, 'Interpreter', 'latex', 'Location', 'southeast','NumColumns',2)
%     % Plot the data points up to the current frame
%     xlabel('Time(s)','Interpreter', 'latex');
%     ylabel('$CoG_x(m)$', 'Interpreter', 'latex');
%     set(gca,'FontSize', 25);
%     grid on;
%     pause(duration/numFrames/8);
%     ylim([-0.1, 0.1])
%     xlim([0, 80])
%     % Capture the frame and add it to the video



    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



