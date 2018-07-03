%% Finding if the Wheelchair Detected an Obstacle

% fileID = fopen(filename);
% C = textscan(fileID,'%s %s %f32 %d8 %u %f %f %s %f');
% fclose(fileID);

clc
close all
clear

textures = {'Carpet', 'DarkSurface', 'FauxWood', 'HardWood', 'Linoleum', 'ShinyPosterboard'}

for j = 6:6

	cd('/home/tbaum/Documents/CODE/MATLAB/Negative-Obstacle-Detection/Negative-Obstacle-Detection/Wheelchair_Experiment_3_ViariedSurfaceAccuracy/DATA')
	cd(textures{j})

	directory = dir;
	pattern = 'lidarlites.txt';
	count = 0;

	for i = 1:length(dir)
	    if contains(directory(i).name, pattern)
	        count = count + 1;
	        data = importdata(directory(i).name);
	        detection = data.data(:, 2);
	        detected(count) = sum(detection);
	    end
	end

	totalOnes = sum(detection(:) == 1);

	detections = sum(detection, 1);

end

 

