close all;
clc;


even = load('data/video/optimized.mat');
multirotor = even.multirotor_data;
without = load('data/video/emk.mat');
bad = without.multirotor_data;
sim_t = 90;
iter = 14928;
tra = multirotor.tra(:,1:40:iter);
pos = multirotor.x(:,1:40:iter);
bad = bad.x(:,1:40:iter);


duration = 10;
video_name = "optimized_traj.avi";

% Set up the figure
figure('Position', [0 0 1000 700]); % Set figure size explicitly

axis tight manual;
ax = gca;
ax.NextPlot = 'replaceChildren';

numFrames = 373;

% Create the video writer object
videoFile = video_name;
video = VideoWriter(videoFile, 'Motion JPEG AVI');
video.FrameRate = numFrames / duration;
open(video);

num_start = 1;

for frame = num_start:numFrames
    % Clear the figure
    cla;

    num = 1;
    frame;
    plot(tra(1,num:1:370), tra(2,num:1:370),'--','linewidth',7.0, 'Color','r')
    hold on
    plot(pos(1, 1:frame),pos(2, 1:frame) ,'linewidth', 5.0,'Color','b')
    hold on
    plot(pos(1, frame),pos(2, frame) ,'*','linewidth', 12.0,'Color','black')

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
    ylim([-5.5 0.5])
    xlim([-4 4])
    grid on


    frameData = getframe(gcf);
    writeVideo(video, frameData);
end

% Close the video writer object
close(video);

% Display a message indicating the completion and file location
fprintf('Animation saved as %s\n', videoFile);



