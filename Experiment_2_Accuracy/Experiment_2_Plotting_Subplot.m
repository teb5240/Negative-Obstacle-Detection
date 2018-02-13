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

expectedDistances = [];

for i = 1:length(degrees)
    for j = 1:length(obstacleHeights)
        expectedDistance(j, i) = (obstacleHeights(j) + .5)/cosd(degrees(i));
    end
end

x = 4:2:14;

subplot(2,4,1, 'Parent', p)
h1 = plot(obstacleHeights, measuredHeights(:,1), 'o', 'color', colors(1,:));
hold on
plot(obstacleHeights, measuredHeights(:,1) + (2 * measuredSTD(:,1)), '.', 'color', colors(1,:));
plot(obstacleHeights, measuredHeights(:,1) - (2 * measuredSTD(:,1)), '.', 'color', colors(1,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,1));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(1,:));
plot(x, expectedDistance(:, 1)', '-', 'color', colors(1,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 60])

subplot(2,4,2, 'Parent', p)
h2 = plot(obstacleHeights, measuredHeights(:,2), 'o', 'color', colors(2,:));
hold on
plot(obstacleHeights, measuredHeights(:,2) + (2 * measuredSTD(:,2)), '.', 'color', colors(2,:));
plot(obstacleHeights, measuredHeights(:,2) - (2 * measuredSTD(:,2)), '.', 'color', colors(2,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,2));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(2,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
title('Measured Distance Accuracy');
plot(x, expectedDistance(:, 2)', '-', 'color', colors(2,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 60])

subplot(2,4,3, 'Parent', p)
h3 = plot(obstacleHeights, measuredHeights(:,3), 'o', 'color', colors(3,:));
hold on
plot(obstacleHeights,measuredHeights(:,3) - (2 * measuredSTD(:,3)), '.', 'color', colors(3,:));
plot(obstacleHeights,measuredHeights(:,3) + (2 * measuredSTD(:,3)), '.', 'color', colors(3,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,3));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(3,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
plot(x, expectedDistance(:, 3)', '-', 'color', colors(3,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 60])

subplot(2,4,5, 'Parent', p)
h4 = plot(obstacleHeights, measuredHeights(:,4), 'o', 'color', colors(4,:));
hold on
plot(obstacleHeights, measuredHeights(:,4) + (2 * measuredSTD(:,4)), '.', 'color', colors(4,:));
plot(obstacleHeights, measuredHeights(:,4) - (2 * measuredSTD(:,4)), '.', 'color', colors(4,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,4));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(4,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
plot(x, expectedDistance(:, 4)', '-', 'color', colors(4,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 60])


subplot(2,4,6, 'Parent', p)
h5 = plot(obstacleHeights, measuredHeights(:,5), 'o', 'color', colors(5,:));
hold on
plot(obstacleHeights, measuredHeights(:,5) + (2 * measuredSTD(:,5)), '.', 'color', colors(5,:));
plot(obstacleHeights, measuredHeights(:,5) - (2 * measuredSTD(:,5)), '.', 'color', colors(5,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,5));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(5,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
plot(x, expectedDistance(:, 5)', '-', 'color', colors(5,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 60])

subplot(2,4,7, 'Parent', p)
h6 = plot(obstacleHeights, measuredHeights(:,6), 'o', 'color', colors(6,:));
hold on
plot(obstacleHeights, measuredHeights(:,6) + (2 * measuredSTD(:,6)), '.', 'color', colors(6,:));
plot(obstacleHeights, measuredHeights(:,6) - (2 * measuredSTD(:,6)), '.', 'color', colors(6,:));
% reg = fitlm(obstacleHeights, measuredHeights(:,6));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(6,:));
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
plot(x, expectedDistance(:, 6)', '-', 'color', colors(6,:))
xlabel('Obstacle Depth (cm)')
ylabel('Measured Distance (cm)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
hold off
ylim([0 60])

set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);

% set(findall(gca, 'Type', 'Line'),'LineWidth',2);
% legend('0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}')
% legend('Location', 'eastoutside')

hL = subplot(2,4,[4 8]);
poshL = get(hL,'position');     % Getting its position

lgd = legend(hL,[h1;h2;h3;h4;h5;h6], '0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}');
set(lgd,'position', [0.7, 0.1100, 0.15, 0.8150]);      % Adjusting legend's position
axis(hL,'off');                 % Turning its axis off
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);

