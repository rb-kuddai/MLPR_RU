%launch via - tsk1_3_b(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_3_b(x_all_train, t_train, x_all_test, t_test)
    %t - means target values
    get_adjacent_pixels = @(x) [x(:, 1032), x(:, 1032 - 34)];

    x_train = get_adjacent_pixels(x_all_train);
    x_test  = get_adjacent_pixels(x_all_test);

    opt = foptions;
    opt(1)  = 1; % Display EM training
    opt(14) = 5; % number of iterations of EM
    dim     = 2; % left_pixel, above_pixel in our case
    num_rbf = 5;% determined from previous task

    net = rbf(dim, num_rbf, 1, 'gaussian');
    net = rbftrain(net, opt, x_train, t_train);

    rmse_train = cs_rmse(t_train, rbffwd(net, x_train));
    rmse_test  = cs_rmse(t_test,  rbffwd(net, x_test));

    display(rmse_train, 'rmse on the training set');
    display(rmse_test,  'rmse on the test set');
end