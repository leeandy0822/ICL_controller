t = 0:0.05:10;
y = sin(2*t);
x = cos(2*t);

curve = animatedline('LineWidth',2);
set(gca,'XLim',[-1.5 1.5],'YLim',[-1.5 1.5],'zLim',[0 10]);
view(43,24);
hold on;

for i=1:length(t)
    addpoints(curve,x(i),y(i),t(i));
    head = scatter3(x(i),y(i),t(i),'filled','MarkerFaceColor','b');
    drawnow
    pause(0.01);
    delete(head);
end