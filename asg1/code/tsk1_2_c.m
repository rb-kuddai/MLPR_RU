%load imgregdata.mat % I do it via terminal

%launch via - tsk1_2_c(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_2_c(x_all_train, t_train, x_all_test, t_test)
    %t - means target values
    get_adjacent_pixels = @(x) [x(:, 1032), x(:, 1032 - 34)];

    %prepare sets
    x_train = get_adjacent_pixels(x_all_train);
    x_test  = get_adjacent_pixels(x_all_test);
    
    %train (it will add bias term automatically)
    [w, predictor] = cs_linear_regression(x_train, t_train);
    display(w, 'weights for neighbours pixels features');
    
    error_train = cs_rmse(t_train, predictor(x_train));
    error_test  = cs_rmse(t_test,  predictor(x_test));
    
    display(error_train, 'rmse on the training set');
    display(error_test,  'rmse on the test set');

    %show surface
    figure,
    %I chose smaller step because our function is just a plane
    [dim1, dim2] = meshgrid(0:0.1:1, 0:0.1:1);
    %swapped ones from original snippet, because w(1) corresponds to bias
    %in my case
    ysurf = [ones(numel(dim1),1), [dim1(:), dim2(:)]] * w;
    surf(dim1, dim2, reshape(ysurf, size(dim1)));
    
    hold on;
    
    %show test set data points
    scatter3(x_test(:, 1), x_test(:, 2), t_test, 'red');
    xlabel('left pixel intensity');
    ylabel('above pixel intensity');
    zlabel('target pixel intensity');
    set(gca,'FontSize', 20);
end


