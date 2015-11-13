%launch via - tsk1_4(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_4(x_train, t_train, x_test, t_test)
    %t - means target values
    
    %train (it will add bias term automatically)
    [w, predictor] = cs_linear_regression(x_train, t_train);

    error_train = cs_rmse(t_train, predictor(x_train));
    error_test  = cs_rmse(t_test,  predictor(x_test));
    
    display(error_train, 'rmse on the training set');
    display(error_test,  'rmse on the test set');
end