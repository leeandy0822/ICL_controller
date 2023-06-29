close all;
clc;

data = readtable('ESP32_data - esp32_battery (1).csv');
data = data(:, :);

Even_UAV1 = data{:,6}*2;
Even_UAV2 = data{:,7}*2;
Optimal_UAV1 = data{:,13}*2;
Optimal_UAV2 = data{:,14}*2;

Even_time = 0:2:42;
Optimal_time = 0:2:42;


duration = 10;
video_name = "power_optimal.avi";

% Set up the figure
figure('Position', [0 0 700 330]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

numFrames = 21;

% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

for frame = 1:numFrames
    % Clear the figure
    cla;
 
    plot(Optimal_time(1:frame),Optimal_UAV1(1:frame) ,Optimal_time(1:frame),Optimal_UAV2(1:frame) ,LineWidth=3.0)
    legend('UAV left','UAV right','FontSize',15, 'Interpreter', 'latex', 'Location', 'northeast')
    % Plot the data points up to the current frame
    xlabel('Time(s)','Interpreter', 'latex');
    ylabel('$Power(W)$', 'Interpreter', 'latex');
    set(gca,'FontSize', 15);
    title("Optimal Formation Power Consumption",'FontSize', 25,'Interpreter', 'latex');
    grid on;
    ylim([100,450])
    xlim([0, 43])
     pause(duration/numFrames);

    % Capture the frame and add it to the video
    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



