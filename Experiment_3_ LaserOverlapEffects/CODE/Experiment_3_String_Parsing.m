expression = '[1234567890]+';
data = string(data);
[startIndex,endIndex] = regexp(data,expression);

for i = 1:length(data) - 1
    distance = char(data(i));
    j = 1;
    distanceList45(i, j) = str2num(distance(startIndex{i}(j):endIndex{i}(j)));
end

save('45degreeDist', 'distanceList45')

