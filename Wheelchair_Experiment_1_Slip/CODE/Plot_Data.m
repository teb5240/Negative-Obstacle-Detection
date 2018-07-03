maxValue1 = cell(1, 100);
maxValue2 = cell(1, 100);

[ pose_data, joystick_data, velocity_data, files] = func_readInPoseJoystickVelocity( 'C:\Users\tbaum\Documents\GitHub\Negative-Obstacle-Detection\Wheelchair_Experiment_1_Slip' )

for i = 1:42

    close all

    plot(velocity_data{i}(:, 1), velocity_data{i}(:, 3))
    hold on
    plot(velocity_data{i}(:, 1), velocity_data{i}(:, 2))

    plot(joystick_data{i}(:, 1), joystick_data{i}(:, 2))
    plot(joystick_data{i}(:, 1), joystick_data{i}(:, 3))
    title(files{i})

    [argvalue, stoppedInput] = max(joystick_data{i}(:, 2));
    [maxValue1{i}, maximum1] = max(velocity_data{i}(:, 3));
    [maxValue2{i}, maximum2] = max(velocity_data{i}(:, 2));
    plot(velocity_data{i}(maximum1, 1), 1, 'ok')
    plot(velocity_data{i}(maximum2, 1), 1, 'or')
    B = find(velocity_data{i}(:, 2) == 0);
    C = find(velocity_data{i}(:, 3) == 0);
    
    change_in_t_VECTOR(i) = velocity_data{i}(maximum1, 1) - joystick_data{i}(stoppedInput, 1);
    change_in_t{i, 2} = velocity_data{i}(maximum2, 1) - joystick_data{i}(stoppedInput, 1);
    
    stopTime(i) = joystick_data{i}(stoppedInput, 1);
    
    set(gca,'FontName','Times','FontSize',8); 
end

% save('STOP_Time', 'stopTime')