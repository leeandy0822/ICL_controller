close all;
clc;

data = readtable('0707 - Estimation.csv');
data = readtable('0707 - Optimize.csv');
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


duration = 50;
video_name = "optimize_traj.avi";

% Set up the figure
figure('Position', [0 0 1000 700]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

numFrames = 1300;
numFrames = 1450;

% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

num_start = 300;
num_end = 1270;
num_even_start = 10;
num_even_end = 1350;

for frame = num_start:numFrames
    % Clear the figure
    cla;

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

    num = 280;
    frame;
    plot(current_position(num:1:1000,1)-pos(num:1:1000,2), current_position(num:1:1000,2)-pos(num:1:1000,1),'--','linewidth',6.0, 'Color','r')
    hold on
    plot(current_position(num:frame,1),current_position(num:frame,2) ,'linewidth', 5.0,'Color','b')

%     frame;
%     plot(current_position(250:1:1000,1)-pos(250:1:1000,2), current_position(250:1:1000,2)-pos(250:1:1000,1),'--','linewidth',6.0, 'Color','r')
%     hold on
%     plot(bad_current_position(350:frame,1),bad_current_position(350:frame,2) ,'linewidth', 6.0,'Color','b')


%     hold on
%     plot(bad_current_position(num_even_start:frame,1),bad_current_position(num_even_start:frame,2) ,'linewidth', 4.0)
    set(gca,'FontSize', 20);
    y = ylabel('Y (m)', 'Interpreter', 'latex','FontSize', 25);
    set(y, 'Units', 'Normalized', 'Position', [-0.06, 0.42])
    x = xlabel('X (m)', 'Interpreter', 'latex','FontSize', 25);
    legend('Desired', 'Optimized + CL Controller','Interpreter', 'latex','FontSize', 20, 'Location', 'southeast')
    ylim([-1.8 1.8])
    xlim([-2.5 2.5])
    grid on


    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



