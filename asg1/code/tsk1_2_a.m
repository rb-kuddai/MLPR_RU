%load imgregdata.mat % I do it via terminal

%launch via - tsk1_2_a(xtr_nf, ytr_nf)
function [] = tsk1_2_a(xtr_nf, ytr_nf)
    %I choose 5000 so plot doesn't look cluttered
    num_data_points = 5000; 
    x_left   = xtr_nf(1:num_data_points, 1032);
    x_above  = xtr_nf(1:num_data_points, 1032 - 34);
    x_target = ytr_nf(1:num_data_points);

    scatter3(x_left, x_above, x_target);
    xlabel('left pixel intensity');
    ylabel('above pixel intensity');
    zlabel('target pixel intensity');
    set(gca,'FontSize', 20);
end