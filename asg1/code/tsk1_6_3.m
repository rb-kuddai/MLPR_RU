%load imgregdata.mat % I do it via terminal

%launch via - tsk1_6_3(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_6_3(x_all_train, t_train, x_all_test, t_test)
    %t - means target values
    threshold = 5;
 
    function accepted = closest_pixels(vector_index)
        i = mod(vector_index, 35);
        j = vector_index / 35;
        r = sqrt((18 - i)^2 + (30 - j)^2);
        accepted = r < threshold; 
    end

    indexes = arrayfun(@closest_pixels, 1:1032);
    
    x_train = x_all_train(:, indexes);
    x_test  = x_all_test (:, indexes);
    
    x_train_size = size(x_train)
    
    [w, predictor] = cs_linear_regression(x_train, t_train);
    
    rmse_train = cs_rmse(t_train, predictor(x_train))
    rmse_test  = cs_rmse(t_test,  predictor(x_test))
end