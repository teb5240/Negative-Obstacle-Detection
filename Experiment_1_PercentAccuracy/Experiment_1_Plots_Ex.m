clc
clear all
close all

colors = get(gca,'colororder');

degrees = [0, 15, 30, 45, 60, 75];
obstacleHeights = [4; 6; 8; 10; 12; 14];
correct = [0.08, 0, 0.48, 0.12, 0.24, 0.12;...
            0, 0.76, 1, 0.44, 0.68, 0.48;...
            0.36, 0.92, 0.44, 0.72, 0.72, 0.32;...
            0.8, 1, 0.88, 0.76, 0.76, 0.96;...
            0.92, 1, 1, 1, 0.92, .92;...
            1, 1, 1, 1, 1, 1];
        
plot(obstacleHeights, correct(:,1), '*', 'color', colors(1,:));
hold on
plot(obstacleHeights, correct(:,2), '*', 'color', colors(2,:));
plot(obstacleHeights, correct(:,3), '*', 'color', colors(3,:));
plot(obstacleHeights, correct(:,4), '*', 'color', colors(4,:));
plot(obstacleHeights, correct(:,5), '*', 'color', colors(5,:));
plot(obstacleHeights, correct(:,6), '*', 'color', colors(6,:));


set(findall(gca, 'Type', 'Line'),'LineWidth',1);
legend('0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}')
legend('Location', 'eastoutside')

xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')

title('Obstacle Detection Accuracy')
