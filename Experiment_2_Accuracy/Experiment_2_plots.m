% clc
% clear all
% close all
% 
% s = serial('COM4');
% fopen(s);
% fprintf(s,'RS232?')
% settings = fgets(s)
% data = ['..................................'];
% 
% while(true)
%      settings = fgets(s);
%      A = size(settings);
%      if(settings(1) == 'S')
%      else
%          if(A(2) ~= 34)
%              if(A(2) == 33)
%                 settings = strcat(settings, '...');
%              elseif(A(2) == 32)
%                 settings = strcat(settings, '....');
%              elseif(A(2) == 31)
%                 settings = strcat(settings, '.....');
%              end  
%             data = [settings; data];
%          else
%             data = [settings; data];
%          end
%      end
% end

expression = '[1234567890]+';
[startIndex,endIndex] = regexp(string(data),expression);

% fclose(s)
% delete(s)
% clear s
% 
% newobjs = instrfind; fclose(newobjs); clear newobjs

% degrees = [0, 15, 30, 45, 60, 75];
% obstacleHeights = [4; 6; 8; 10; 12; 15];
% measuredHeights = [ 4, 4, 4, 4, 4, 5;...
%                     6, 6, 6, 6, 6, 8;...
%                     8, 8, 8, 8, 8, 10,;...
%                     10, 10, 10, 10, 10, 15;...
%                     12, 12, 12, 12, 12, 17;...
%                     14, 14, 14, 14, 14, 20;...
%                                         ];
% 
% plot(obstacleHeights, measuredHeights(:,1), '-')
% hold on
% plot(obstacleHeights, measuredHeights(:,2), '-')
% plot(obstacleHeights, measuredHeights(:,3), '-')
% plot(obstacleHeights, measuredHeights(:,4), '-')
% plot(obstacleHeights, measuredHeights(:,5), '-')
% plot(obstacleHeights, measuredHeights(:,6), '-')
% set(findall(gca, 'Type', 'Line'),'LineWidth',2);                                    
%                                     
% legend('0^{\circ}', '15^{\circ}', '30^{\circ}', '45^{\circ}', '60^{\circ}', '75^{\circ}')
% legend('Location', 'eastoutside')
% 
% xlabel('Actual (cm)')
% ylabel('Measured (cm)')
% 
% title('Measured Drop-off Distance Accuracy')

for i = 1:length(data)
    realData(i) = str2double(data(i, 11:12));
end