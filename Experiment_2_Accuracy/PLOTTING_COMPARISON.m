% Plotting 15 degree stuff against each other


colors = get(gca,'colororder');

f = figure;
p = uipanel('Parent',f,'BorderType','none'); 
% p.Title = 'Obstacle Detection Accuracy'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 12;
p.FontWeight = 'bold';

degrees = [0, 15, 30, 45, 60, 75];
obstacleHeights = [4; 6; 8; 10; 12; 14];
measuredHeights = [dist4cm(:, 1), ...
                   dist6cm(:, 1), ... 
                   dist8cm(:, 1), ...
                   dist10cm(:, 1), ...
                   dist12cm(:, 1), ...
                   dist14cm(:, 1)];
measuredSTD = [dist4cm(:, 2), ...
               dist6cm(:, 2), ... 
               dist8cm(:, 2), ...
               dist10cm(:, 2), ...
               dist12cm(:, 2), ...
               dist14cm(:, 2)];

degrees = [0, 15, 30, 45, 60, 75];
obstacleHeights2 = [4; 6; 8; 10; 12; 14];
measuredHeights2 = [dist4cm2(:, 1), ...
                   dist6cm2(:, 1), ... 
                   dist8cm2(:, 1), ...
                   dist10cm2(:, 1), ...
                   dist12cm2(:, 1), ...
                   dist14cm2(:, 1)];
measuredSTD2 = [dist4cm2(:, 2), ...
               dist6cm2(:, 2), ... 
               dist8cm2(:, 2), ...
               dist10cm2(:, 2), ...
               dist12cm2(:, 2), ...
               dist14cm2(:, 2)];           
           
expectedDistances = [];

for i = 1:length(degrees)
    for j = 1:length(obstacleHeights)
        expectedDistance(j, i) = (obstacleHeights(j) + .5)/cosd(degrees(i));
    end
end

x = 4:2:14;

subplot(1,2,1, 'Parent', p)
h4 = plot(obstacleHeights, measuredHeights(:,2), 'o', 'color', colors(2,:));
hold on
plot(obstacleHeights, measuredHeights(:,2) + (2 * measuredSTD(:,2)), '.', 'color', colors(2,:));
plot(obstacleHeights, measuredHeights(:,2) - (2 * measuredSTD(:,2)), '.', 'color', colors(2,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,4));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(4,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
plot(x, expectedDistance(:, 2)', '-', 'color', colors(2,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 30])
title('Distance Accuracy Original Run at 15^{\circ}');

subplot(1,2,2, 'Parent', p)
h4 = plot(obstacleHeights2, measuredHeights2(:,2), 'o', 'color', colors(2,:));
hold on
plot(obstacleHeights2, measuredHeights2(:,2) + (2 * measuredSTD2(:,2)), '.', 'color', colors(2,:));
plot(obstacleHeights2, measuredHeights2(:,2) - (2 * measuredSTD2(:,2)), '.', 'color', colors(2,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,4));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(4,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
plot(x, expectedDistance(:, 2)', '-', 'color', colors(2,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 30])
title('Distance Accuracy Re-run at 15^{\circ}');