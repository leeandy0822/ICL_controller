function video_generator(time, data, duration,  video_name, offset, title_name, gt)
    % Set up the figure
    figure('Position', [0 0 720 300]); % Set figure size explicitly

    axis tight manual;
    ax = gca;
    ax.NextPlot = 'replaceChildren';
    
%     time = linspace(0, 10, 100); % Time values from 0 to 10
%     data = sin(time); % Example data points (sine function of time)
%     
    
    % Set the number of frames and the duration of the animation
    numFrames = numel(time);
%     duration = 10; % seconds
    gt = ones(1, numFrames)*gt;
    % Create the video writer object
    videoFile = video_name;
    video = VideoWriter(videoFile, 'Motion JPEG AVI');
    video.FrameRate = numFrames / duration;
    open(video);
    
%     
    % Create the animation
    for frame = 1:numFrames
        % Clear the figure
        cla;
        

        if(gt ~= 0)
           plot(time(1:frame), data(1:frame), time(1:numFrames), gt(1:numFrames), 'LineWidth', 2);
        else
           plot(time(1:frame), data(1:frame), 'LineWidth', 2);
        end
        % Plot the data points up to the current frame
        legend('Estimated MASS (m)','Ground Truth(m)','FontSize', 12, 'Location', 'southeast')
        xlabel('Time(s)');
        ylabel('mass(kg)');
        title(title_name,'FontSize', 15);
        grid on;
        % Set the axis limits
        xlim([min(time), max(time)]);
        ylim([min(data)-offset, max(data)+(offset)]);
        
        % Set the title
        
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

end
