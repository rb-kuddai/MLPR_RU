%load imgregdata.mat % I do it via terminal

%launched via
%tsk1_3_b(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_3_b(xtr_nf, ytr_nf, xte_nf, yte_nf)
    %left and above neighbours
    get_neighbours = @(x) [x(:, 1032), x(:, 1032 - 34)];

    X_train = get_neighbours(xtr_nf);
    X_test  = get_neighbours(xte_nf);

    opt = foptions;
    opt(1) = 1; % Display EM training
    opt(14) = 5; % number of iterations of EM
    dim = 2; % left_pixel, above_pixel in our case
    num_rbf = 5; %determined from previous task

    net = rbf(dim, num_rbf, 1, 'gaussian');
    net = rbftrain(net, opt, X_train, ytr_nf);

    Y_pred_train = rbffwd(net, X_train);
    Y_pred_test  = rbffwd(net, X_test);

    rmse_train = rmse(Y_pred_train, ytr_nf);
    rmse_test  = rmse(Y_pred_test,  yte_nf);

    display(rmse_train, 'rmse on the training set');
    display(rmse_test,  'rmse on the test set');
end