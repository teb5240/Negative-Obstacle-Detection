%% Finding if the Wheelchair Detected an Obstacle

clc
close all
clear

textures = {'Carpet', 'DarkSurface', 'FauxWood', 'HardWood', 'Linoleum', 'ShinyPosterboard'}

figure; hold on; set(gcf,'color',[1 1 1]);

for j = 1:6

	cd('/home/tbaum/Documents/CODE/MATLAB/Negative-Obstacle-Detection/Negative-Obstacle-Detection/Wheelchair_Experiment_3_ViariedSurfaceAccuracy/DATA')
	cd(textures{j})

	directory = dir;
	pattern = 'lidarlites.txt';
	count = 0;

	for i = 1:length(dir)
	    if contains(directory(i).name, pattern)
	        count = count + 1;
	        data = importdata(directory(i).name);
	        detection = data.data(:, 3);

	        detected(count, j) = 0;

	        for k = 1:length(detection) - 1

	        	if (detection(k + 1) - detection(k)) > (9/100)
	        		detected(count, j) = detected(count, j) + 1;
	        	end

	        end

	    end
	end

	totalOnes = sum(detected(:) == 1);

	plot(j, sum(detected(:, j))/10, 'o');


end

xticks([1, 2, 3, 4, 5, 6])
xticklabels( {'Carpet', 'Dark Surface', 'Faux Wood', 'Hardwood', 'Linoleum', 'Shiny Posterboard'} );

ylabel('Average Number of Negative Obstacle Detections')
xlabel(['Surface'])
set(gca, 'LineWidth', 1)

ylim([0 3])