close all;
clc;
data = readtable('power.csv');
data = data(:, :);
UAV_even = data{2:end,5:6};
UAV_optimal = data{2:end,12:13};

duration = 20;
video_name = "power_optimized.avi";

% Set up the figure
figure('Position', [0 0 1000 700]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

numFrames = 106;

% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

num_start = 1;
num_end = 1270;
num_even_start = 10;
num_even_end = 1350;
energy_time = 0:0.7:150*0.5-1;
energy_time = energy_time + 10;


for frame = num_start:numFrames
    % Clear the figure
    cla;
    cla;
    frame

%     plot(energy_time(1:frame), UAV_even(1:frame,2),energy_time(1:frame), UAV_even(1:frame,1),'linewidth', 3)
%     set(gca,'FontSize', 25);
%     ylim([100 400])
%     xlim([10,80])
%     ylabel('Power (Watt)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
%     xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 36);
%     legend('Even UAV1', 'Even UAV2', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
%     grid on

    plot(energy_time(1:frame), UAV_optimal(1:frame,2),energy_time(1:frame), UAV_optimal(1:frame,1),'linewidth', 3)
    set(gca,'FontSize', 25);
    ylim([100 400])
    xlim([10,80])
    ylabel('Power (Watt)', 'Interpreter', 'latex','FontSize', 36, 'Rotation',90);
    xlabel('Time (s)', 'Interpreter', 'latex','FontSize', 36);
    legend('Optimized UAV1', 'Optimized UAV2', 'Interpreter', 'latex','FontSize', 24, 'Location', 'southeast')
    grid on


    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



