%launch via - tsk1_6_4(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_6_4(x_all_train, t_train, x_all_test, t_test)
    %t - means target values
    x_train = get_closest_pixels(x_all_train, 4);
    x_test  = get_closest_pixels(x_all_test, 4);
    
    [w, predictor] = cs_linear_regression(x_train, t_train);
    
    rmse_test = cs_rmse(t_test, predictor(x_test))
end

