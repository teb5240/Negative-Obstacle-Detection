expression = '[1234567890]+';
data = string(data);
[startIndex,endIndex] = regexp(data,expression);
distanceList = zeros(300, 1);

for i = 1:length(data) - 1
    distance = char(data(i));
    j = 1;
    distanceListTESTINGSTUFF(i, j) = str2num(distance(startIndex{i}(j):endIndex{i}(j)));
end

% x = 1:1:299;
% 
% plot(x, distanceList140(1:299, 1))
% hold on
% plot(x, distanceList1415(1:299, 1))
% plot(x, distanceList1430(1:299, 1))
% plot(x, distanceList1445(1:299, 1))
% plot(x, distanceList1460(1:299, 1))
% plot(x, distanceList1475(1:299, 1))


save('Obs_12cm_Ang_15_SECONDRUN', 'distanceListTESTINGSTUFF')
% save('Obs_4cm_Ang_15_Distances', 'distanceList415')
% save('Obs_4cm_Ang_30_Distances', 'distanceList430')
% save('Obs_4cm_Ang_45_Distances', 'distanceList445')
% save('Obs_4cm_Ang_60_Distances', 'distanceList460')
% save('Obs_4cm_Ang_75_Distances', 'distanceList475')

