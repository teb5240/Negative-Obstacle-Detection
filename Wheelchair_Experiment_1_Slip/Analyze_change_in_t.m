sum = 0;

for i = 1:5
    if i == 3
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 1
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(1) = sum/4;

sum = 0;

for i = 6:12
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 8 || i == 9
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(2) = sum/5;

sum = 0;

for i = 13:18
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 8 || i == 9
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(3) = sum/6;

sum = 0;

for i = 19:24
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 8 || i == 9
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(4) = sum/6;

sum = 0;

for i = 25:30
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 8 || i == 9
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(5) = sum/6;

sum = 0;

for i = 31:36
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 35
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(6) = sum/5;

sum = 0;

for i = 37:41
    if i == 10
        sum = sum + change_in_t{i, 2}; % use max 2 values
    elseif i == 39
        sum = sum;
    else
        sum = sum + change_in_t{i, 1}; % use max 1 values
    end
end

change_in_t_avg(7) = sum/5;

figure(4); whitebg('white'); hold off; 
set(gcf,'color',[1 1 1]);

plot(change_in_t_avg, 'ok')
set(gca,'FontName','Times','FontSize',8); 


