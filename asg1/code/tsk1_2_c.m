%load imgregdata.mat % I do it via terminal

function [] = tsk1_2_c(xtr_nf, ytr_nf, xte_nf, yte_nf)
    %left and above neighbours
    get_neighbours = @(x) [x(:, 1032), x(:, 1032 - 34)];

    %prepare training set
    X_train = get_neighbours(xtr_nf);
    %train (it will add bias term automatically)
    [w, predictor] = cs_linear_regression(X_train, ytr_nf);
    display(w, 'weights for neighbours pixels features');

    %compute rmse for training set
    Yp_train = predictor(X_train);
    error_train = cs_rmse(ytr_nf, Yp_train);
    display(error_train, 'rmse on the training set');

    %compute rmse for test set
    X_test = get_neighbours(xte_nf);
    Yp_test = predictor(X_test);
    error_test = cs_rmse(yte_nf, Yp_test);
    display(error_test, 'rmse on the test set');

    %show surface
    figure,
    %I chose smaller step because our function is just plane
    [dim1, dim2] = meshgrid(0:0.1:1, 0:0.1:1);
    %swapped ones from original snippet, because w(1) corresponds to bias
    %in my case
    ysurf = [ones(numel(dim1),1), [dim1(:), dim2(:)]] * w;
    surf(dim1, dim2, reshape(ysurf, size(dim1)));
    hold on;
    scatter3(xte_nf(:, 1032), xte_nf(:, 1032 - 34), yte_nf, 'red');

    xlabel('left pixel intensity');
    ylabel('above pixel intensity');
    zlabel('target pixel intensity');
    set(gca,'FontSize', 20);
end


