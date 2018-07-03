function [ pose_data, joystick_data, velocity_data, files ] = func_readInPoseJoystickVelocity( folder_name )
%UNTITLED3 Read in laser odometry and wheelchair data
%   Takes csv files and extracts data arrays for pose-based odometry,
%   joystick, and velocity.


%%% Read in Wheelchair data
pose_topic = '-pose.txt';
encoder_vel_topic = '-encoder_vel.txt';
joy_topic = '-joy.txt';

pose_files = dir([folder_name '/*' pose_topic]);

file_names = [];
for f = 1:length(pose_files)
    
    file_names = [file_names; pose_files(f).name(1:end-(length(pose_topic)))];
    
end

file_names = cellstr(file_names);


%%% Extract Wheelchair and Lidar-based Odometry Data

for i = 1:length(file_names)
    
    bagfile = file_names(i);

    %%% Define full file names within folder
    pose_file = char(strcat(folder_name,'/',bagfile,pose_topic));
    joystick_file = char(strcat(folder_name,'/',bagfile,joy_topic));
    velocity_file = char(strcat(folder_name,'/',bagfile,encoder_vel_topic));
     
    %%% Pose data from odometry
    data_pose = csvread(pose_file);
    sec = data_pose(:,2); % This does not begin at zero, so you will need to subtract the first value to get a time line that makes sence
    t_sec = sec - sec(1);
    nsec_pose = data_pose(:,3)*10^(-9); % Again, this does not begin at zero
    t_nsec = nsec_pose - nsec_pose(1);
    t_pose = t_sec + t_nsec;
    pose_x = data_pose(:,4); % x-axis position
    pose_y = data_pose(:,5); % y-axis position
    pose_q1 = data_pose(:,7);
    pose_q2 = data_pose(:,8);
    pose_q3 = data_pose(:,9);
    pose_q0 = data_pose(:,10);
    
    % Calculate heading (psi)
    pose_psi = atan2(2*(pose_q0.*pose_q3 + pose_q1.*pose_q2),...
                1-2*(pose_q2.^2 + pose_q3.^2));
    pose_psi = unwrap(pose_psi);
    
    %%% Joystick data
    data_joy = csvread(joystick_file);
    sec_joy = data_joy(:,2); % This does not begin at zero, so you will need to subtract the first value to get a time line that makes sence
    t_sec_joyl = sec_joy - sec_joy(1);
    nsec_joy = data_joy(:,3)*10^(-9); % Again, this does not begin at zero
    t_nsec_joy = nsec_joy - nsec_joy(1);
    t_joy = t_sec_joyl + t_nsec_joy;
    forward = -data_joy(:,4);
    steering = -data_joy(:,5);
    
    % Note: 
    % if forward => 1, the wheelchair was commanded to go forward by
    % the joystick
    % if forward < 1, the wheelchair was commanded to go backward by
    % the joystick
    % if steering => 1, the wheelchair was commanded to go left by
    % the joystick
    % if steering < 1, the wheelchair was commanded to go right by
    % the joystick
    
    %%% Velocity data from encoders
    data_encoder_vel = csvread(velocity_file);
    sec_encoder_vel = data_encoder_vel(:,2); % This does not begin at zero, so you will need to subtract the first value to get a time line that makes sence
    t_sec_encoder_vel = sec_encoder_vel - sec_encoder_vel(1);
    nsec_encoder_vel = data_encoder_vel(:,3)*10^(-9); % Again, this does not begin at zero
    t_nsec_encoder_vel = nsec_encoder_vel - nsec_encoder_vel(1);
    t_encoder_vel = t_sec_encoder_vel + t_nsec_encoder_vel;
    left_wheel_velocity = data_encoder_vel(:,4);
    right_wheel_velocity = data_encoder_vel(:,5);
%     wheelchair_body_velocity = data_encoder_vel(:,6);
    
    %%% Function output
    pose_data{i} = [t_pose pose_x pose_y pose_psi]; %pose_vel
    joystick_data{i} = [t_joy forward steering];
    velocity_data{i} = [t_encoder_vel left_wheel_velocity right_wheel_velocity]; %wheelchair_body_velocity
    files{i} = file_names(i);

    
end
end
