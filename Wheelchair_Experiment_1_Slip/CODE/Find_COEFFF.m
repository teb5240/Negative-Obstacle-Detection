%% find frictional coefficient

for i = 1:42
    maxValue1_Vector(i) = maxValue1{i};
    change_in_t_Vector(i) = change_in_t{i, 1};
end

coefficient = maxValue1_Vector./((time_until_stop - change_in_t_Vector).*9.8);

d_Vector = (maxValue1_Vector.^2) ./ (2 * 9.8 * .366) + (maxValue1_Vector .* change_in_t_Vector)

figure(4); whitebg('white'); hold off; 
set(gcf,'color',[1 1 1]);

plot(maxValue1_Vector, d_Vector, 'ok', 'LineWidth',1.5)
% b1 = maxValue1_Vector\d_Vector;
% yCalc1 = b1*linspace(0, 1, length(maxValue1_Vector));
% plot(maxValue1_Vector,yCalc1, '-k', 'LineWidth',1.5)
plotregression(maxValue1_Vector, d_Vector);
% set(gca,'FontName','Times','FontSize',10); 
xlabel('v_0')
ylabel('Distance Traveled until t_s')