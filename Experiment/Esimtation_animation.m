close all;
clc;

data = readtable('0627 - Even_CL.csv');
data = data(:, :);

current_position = data{:,1:3};
pos = data{:,4:6};
vel = data{:,7:9};
rot = data{:,10:12};
ang = data{:,13:15};

mass = data{600:1559,16}
cog = data{600:1559,17:18}
time = data{600:1559,23};
time = time - 45;


duration = 20;
offset = 50;
video_name = "cog_x.avi";

% Set up the figure
figure('Position', [0 0 700 330]); % Set figure size explicitly

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
    
    plot(time(1:frame),cog(1:frame,1) ,LineWidth=3.0)
    yline(0, "--", 'color', 'r', 'linewidth', 3.0);
    legend('Estimated','Grountruth','FontSize',15, 'Interpreter', 'latex', 'Location', 'northeast')
    % Plot the data points up to the current frame
    xlabel('Time(s)','Interpreter', 'latex');
    ylabel('$CoG_x(m)$', 'Interpreter', 'latex');
    set(gca,'FontSize', 15);
    title("CoG_x Estimation",'FontSize', 15,'Interpreter', 'latex');
    grid on;
    pause(duration/numFrames);
    ylim([-0.04 0.04])
    xlim([min(time), max(time)])
    % Capture the frame and add it to the video
    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



