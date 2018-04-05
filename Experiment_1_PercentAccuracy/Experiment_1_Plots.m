clc
clear all
close all

colors = get(gca,'colororder');

f = figure;
p = uipanel('Parent',f,'BorderType','none'); 
% p.Title = 'Obstacle Detection Accuracy'; 
p.TitlePosition = 'centertop'; 
p.FontSize = 12;
p.FontWeight = 'bold';

degrees = [0, 15, 30, 45, 60, 75];
obstacleHeights = [4; 6; 8; 10; 12; 14];

correct = [0.08,  0,     0.48,  0.12,   0.24,   0.12;...
            0,    0.76,  1,     0.44,   0.68,   0.48;...
            0.36, 0.92,  1,     0.72,   0.72,   0.72;...
            0.8,  1,     0.88,  0.76,   0.76,   0.96;...
            0.92, 1,     1,     1,      0.92,   .92;...
            1,    1,     1,     1,      1,      1];

%         correct = [0.08, 0, 0.48, 0.12, 0.24, 0.12;...
%             0, 0.76, 1, 0.44, 0.68, 0.48;...
%             0.36, 0.92, 1, 0.72, 0.72, 0.72;...
%             0.8, 1, 0.88, 0.76, 0.76, 0.96;...
%             0.92, 1, 1, 1, 0.92, .92;...
%             1, 1, 1, 1, 1, 1];
correct2 = [0.08, 0, 0.48, 0.12, 0.24, 0.20;...
            0, 0.76, 1, 0.48, 0.76, 0.48;...
            0.36, 1, 1, 0.72, 0.72, 0.72;...
            0.84, 1, 0.88, 1, 0.76, 1;...
            0.96, 1, 1, 1, 1, 1;...
            1, 1, 1, 1, 1, 1];       

correct = correct * 100;
correct2 = correct2 * 100;
        
subplot(2,4,1, 'Parent', p)
h1 = plot(obstacleHeights, correct(:,1), 'o', 'color', colors(1,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,1));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(1,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,2, 'Parent', p)
h2 = plot(obstacleHeights, correct(:,2), 'o', 'color', colors(2,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,2));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(2,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
% title('Obstacle Detection Accuracy')
ylim([0 100])
xlim([4 14])

subplot(2,4,3, 'Parent', p)
h3 = plot(obstacleHeights, correct(:,3), 'o', 'color', colors(3,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,3));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(3,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,5, 'Parent', p)
h4 = plot(obstacleHeights, correct(:,4), 'o', 'color', colors(4,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,4));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(4,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,6, 'Parent', p)
h5 = plot(obstacleHeights, correct(:,5), 'o', 'color', colors(5,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,5));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(5,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
ylim([0 100])
xlim([4 14])

subplot(2,4,7, 'Parent', p)
h6 = plot(obstacleHeights, correct(:,6), 'o', 'color', colors(6,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,6));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(6,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
ylim([0 100])
xlim([4 14])

set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);

% set(findall(gca, 'Type', 'Line'),'LineWidth',2);
% legend('0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}')
% legend('Location', 'eastoutside')

hL = subplot(2,4,[4 8]);
poshL = get(hL,'position');     % Getting its position

lgd = legend(hL,[h1;h2;h3;h4;h5;h6], '0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}')
set(lgd,'position', [0.7, 0.1100, 0.15, 0.8150]);      % Adjusting legend's position
axis(hL,'off');                 % Turning its axis off
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);

subplot(2,4,1, 'Parent', p)
plot(obstacleHeights, correct2(:,1), '*', 'color', colors(1,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,1));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(1,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,2, 'Parent', p)
plot(obstacleHeights, correct2(:,2), '*', 'color', colors(2,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,2));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(2,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
% title('Obstacle Detection Accuracy')
ylim([0 100])
xlim([4 14])

subplot(2,4,3, 'Parent', p)
plot(obstacleHeights, correct2(:,3), '*', 'color', colors(3,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,3));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(3,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,5, 'Parent', p)
plot(obstacleHeights, correct2(:,4), '*', 'color', colors(4,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,4));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(4,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);
ylim([0 100])
xlim([4 14])

subplot(2,4,6, 'Parent', p)
plot(obstacleHeights, correct2(:,5), '*', 'color', colors(5,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,5));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(5,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
ylim([0 100])
xlim([4 14])

subplot(2,4,7, 'Parent', p)
plot(obstacleHeights, correct2(:,6), '*', 'color', colors(6,:))
hold on
% reg = fitlm(obstacleHeights, correct(:,6));
% x = 0:1:14;
% y = reg.Coefficients.Estimate(2)*x + reg.Coefficients.Estimate(1);
% plot(x, y,'-', 'color', colors(6,:));
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
ylim([0 100])
xlim([4 14])