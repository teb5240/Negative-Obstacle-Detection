clc
clear all
close all

g_y=[1, 10]; % user defined grid Y [start:spaces:end]
g_x= 0:2:100; % user defined grid X [start:spaces:end]
for i=1:length(g_y)
   plot([g_x(1) g_x(end)],[g_y(i) g_y(i)],'black:',...
       'LineWidth', 1.5) %x grid lines
   hold on    
end
ylim([0,40])

xlabel('Laser Spread Overlap (%)')
ylabel('Measured (cm)/ Actual (cm)')

title('Laser Spread')