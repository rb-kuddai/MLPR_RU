%launch via - tsk1_6_2(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_6_2(x_all_train, t_train, x_all_test, t_test)
    %t - means target values
    x_train = x_all_train(:, 912:1032);
    x_test  = x_all_test (:, 912:1032);
    
    [w, predictor] = cs_linear_regression(x_train, t_train);
    
    rmse_test = cs_rmse(t_test, predictor(x_test))
end


