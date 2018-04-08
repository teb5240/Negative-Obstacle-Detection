%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script takes joystick data collected from the wheelchair and
% compares joystick input commands to the amount of time it takes the
% wheelchair to stop after the last joystick input command was given.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear all
clc

%*************************************************************************%

% Read in wheelchair data

%*************************************************************************%

folder_name = '2018-03-25_NegativeObstacleDetection01';
trial = 35;

 [ pose_data, joystick_data, velocity_data, files ] = func_readInPoseJoystickVelocity( 'C:\Users\tbaum\Documents\GitHub\Negative-Obstacle-Detection\Wheelchair_Experiment_1_Slip' );

for i = 1:42

    pose_data_curr = pose_data{i};
    joystick_data_curr = joystick_data{i};
    velocity_data_Curr = velocity_data{i};

    t_pose = pose_data_curr(:,1);
    x_pose = pose_data_curr(:,1);
    y_pose = pose_data_curr(:,1);
    psi_pose = pose_data_curr(:,1);

    t_joy = joystick_data_curr(:,1);
    forward = joystick_data_curr(:,2);
    steering = joystick_data_curr(:,3);
    rho = sqrt(steering.^2 + forward.^2);

    t_velocity = velocity_data_Curr(:,1);
    left_wheel_velocity = velocity_data_Curr(:,2);
    right_wheel_velocity = velocity_data_Curr(:,3);
    wheelchair_body_velocity = velocity_data_Curr(:,4);

    figure(1)
    ax1 = subplot(3,1,1);
    plot(t_joy,forward);
    ax2 = subplot(3,1,2);
    plot(t_pose,x_pose);
    ax3 = subplot(3,1,3);
    plot(t_velocity,wheelchair_body_velocity);
    linkaxes([ax1,ax2,ax3],'x')

    ind_joystick_end = find(t_velocity >= t_joy(end),1);
    ind_velocity_zero = find(wheelchair_body_velocity <= 0);
    ind_velocity_stop = find(diff(ind_velocity_zero) > 1, 1);

    time_until_stop(i) = t_velocity(ind_joystick_end) - t_velocity(ind_velocity_stop)
end


