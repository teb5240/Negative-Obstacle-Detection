
colors = get(gca,'colororder');

f = figure;
p = uipanel('Parent',f,'BorderType','none'); 
% p.Title = 'Obstacle Detection Accuracy'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 12;
p.FontWeight = 'bold';

subplot(2,3,1, 'Parent', p)
h1 = plot(distanceList0,  'color', colors(1,:))
set(gca, 'XDir','reverse')
xlim([0 length(distanceList0)])
xticks([0, length(distanceList0)/3, 2*length(distanceList0)/3, length(distanceList0)])
xticklabels([15, 10, 5, 0])
set(gca, 'LineWidth', 1)
ylabel('Obstacle Depth (cm)')
xlabel('Time (sec)')
ylim([0 30])

subplot(2,3,2, 'Parent', p)
h2 = plot(distanceList15,  'color', colors(2,:))
set(gca, 'XDir','reverse')
xlim([0 length(distanceList15)])
xticks([0, length(distanceList15)/3, 2*length(distanceList15)/3, length(distanceList15)])
xticklabels([15, 10, 5, 0])
set(gca, 'LineWidth', 1)
ylabel('Obstacle Depth (cm)')
xlabel('Time (sec)')
ylim([0 30])

subplot(2,3,3, 'Parent', p)
h3 = plot(distanceList30,  'color', colors(3,:))
set(gca, 'XDir','reverse')
xlim([0 length(distanceList30)])
xticks([0, length(distanceList30)/3, 2*length(distanceList30)/3, length(distanceList30)])
xticklabels([15, 10, 5, 0])
set(gca, 'LineWidth', 1)
ylabel('Obstacle Depth (cm)')
xlabel('Time (sec)')
ylim([0 30])

subplot(2,3,4, 'Parent', p)
h4 = plot(distanceList45, 'color', colors(4,:))
set(gca, 'XDir','reverse')
xlim([0 length(distanceList45)])
xticks([0, length(distanceList45)/3, 2*length(distanceList45)/3, length(distanceList45)])
xticklabels([15, 10, 5, 0])
set(gca, 'LineWidth', 1)
ylabel('Obstacle Depth (cm)')
xlabel('Time (sec)')
ylim([0 30])

subplot(2,3,5, 'Parent', p)
h5 = plot(distanceList60,  'color', colors(5,:))
set(gca, 'XDir','reverse')
xlim([0 length(distanceList60)])
xticks([0, length(distanceList60)/3, 2*length(distanceList60)/3, length(distanceList60)])
xticklabels([15, 10, 5, 0])
set(gca, 'LineWidth', 1)
ylabel('Obstacle Depth (cm)')
xlabel('Time (sec)')
ylim([0 30])

% plot(distanceList75, 'k')
% set(gca, 'XDir','reverse')
% xlim([0 length(distanceList75)])
% xticks([0, length(distanceList75)/3, 2*length(distanceList75)/3, length(distanceList75)])
% xticklabels([15, 10, 5, 0])
% set(gca, 'LineWidth', 1)
% xlabel('Obstacle Depth (cm)')
% ylabel('Time (sec)')

hL = subplot(2,3,6);
poshL = get(hL,'position');     % Getting its position

lgd = legend(hL,[h1;h2;h3;h4;h5], '0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}');
set(lgd,'position', poshL);      % Adjusting legend's position
axis(hL,'off');                 % Turning its axis off
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);