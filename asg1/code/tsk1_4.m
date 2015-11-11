%load imgregdata.mat % I do it via terminal

%launch via - tsk1_4(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_4(x_train, t_train, x_test, t_test)
    %t - means target values
    
    %train (it will add bias term automatically)
    [w, predictor] = cs_linear_regression(x_train, t_train);

    compute_error = @(t, x) cs_rmse(t, predictor(x));
    
    error_train = compute_error(t_train, x_train);
    display(error_train, 'rmse on the training set');

    error_test = compute_error(t_test, x_test);
    display(error_test,  'rmse on the test set');
end