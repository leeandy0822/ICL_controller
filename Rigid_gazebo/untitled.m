% Set up the figure
figure;
axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

time = linspace(0, 10, 100); % Time values from 0 to 10
data = sin(time); % Example data points (sine function of time)


% Set the number of frames and the duration of the animation
numFrames = numel(time);
duration = 10; % seconds

% Create the video writer object
videoFile = 'data_animation.avi';
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

% Create the animation
for frame = 1:numFrames
    % Clear the figure
    cla;
    
    % Plot the data points up to the current frame
    plot(time(1:frame), data(1:frame), 'b', 'LineWidth', 2);
    
    % Set the axis limits
    xlim([min(time), max(time)]);
    ylim([min(data), max(data)]);
    
    % Set the title
    title(sprintf('Frame %d', frame));
    
    % Pause for a short duration to create the animation effect
    pause(duration/numFrames);
    
    % Capture the frame and add it to the video
    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);
