%% Finding if the Wheelchair Detected an Obstacle

% fileID = fopen(filename);
% C = textscan(fileID,'%s %s %f32 %d8 %u %f %f %s %f');
% fclose(fileID);

clc
close all
clear

directory = dir;
pattern = 'lidarlites.txt';
count = 0;

for i = 1:length(dir)
    if contains(directory(i).name, pattern)
        count = count + 1;
        data = importdata(directory(i).name);
        detection = data.data(:, 2)
        detected(count) = sum(detection);
    end
end

totalOnes = sum(detection(:) == 1);

detections = sum(detection, 1);
plot(detected, 'o');
obstacle = [3, 5, 7.5, 9.5, 11.4, 13.4]
vector = [20, 70, 100, 90, 100, 100]

figure(4); whitebg('white'); hold off; 
set(gcf,'color',[1 1 1]);

set(gca,'FontName','Times','FontSize',8); 
plot(obstacle, vector, 'ko')
xlabel('Obstacle Depth (cm)')
ylabel('Accuracy (%)')
set(findall(gca, 'Type', 'Line'),'LineWidth',1.5);