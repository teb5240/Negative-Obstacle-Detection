%% average coefficient

%% find velocity
summ = 0;

for i = 1:5
    if i == 3
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 1
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(1) = summ/4;

summ = 0;

for i = 6:12
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 8 || i == 9
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(2) = summ/5;

summ = 0;

for i = 13:18
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 8 || i == 9
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(3) = summ/6;

summ = 0;

for i = 19:24
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 8 || i == 9
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(4) = summ/6;

summ = 0;

for i = 25:30
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 8 || i == 9
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(5) = summ/6;

summ = 0;

for i = 31:36
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 35
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(6) = summ/5;

summ = 0;

for i = 37:42
    if i == 10
        summ = summ + coefficient(i); % use max 2 values
    elseif i == 39
        summ = summ;
    else
        summ = summ + coefficient(i); % use max 1 values
    end
end

coefficient_avg(7) = summ/5;
