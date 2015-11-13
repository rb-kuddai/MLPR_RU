%launch via - tsk1_5_a(net, xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_5_a(net, x_train, t_train, x_test, t_test)
    %t - means target values

    rmse_train = cs_rmse(t_train, mlpfwd(net, x_train));
    rmse_test  = cs_rmse(t_test,  mlpfwd(net, x_test));

    display(rmse_train, 'rmse on the training set');
    display(rmse_test,  'rmse on the test set');
end