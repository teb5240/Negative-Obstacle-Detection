%% Find t and Velocity

for i = 1:length(files)

    close all

    plot(velocity_data{i}(:, 3))
    hold on
    plot(velocity_data{i}(:, 2))
    title(files{i})
    
    nonzeros1 = find((velocity_data{i}(:, 2)));
    nonzeros2 = find(velocity_data{i}(:, 3));
    
    zeros1 = find(~(velocity_data{i}(:, 2)));
    zeros2 = find(~velocity_data{i}(:, 3));
    
    plot(zeros1, 1, 'ok')
    
    x = 1;
end

