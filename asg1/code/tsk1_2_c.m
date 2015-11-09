%load imgregdata.mat % I do it via terminal

%left and above neighbours
get_neighbours = @(x) [x(:, 1032), x(:, 1032 - 34)];

%prepare training set
X_train = get_neighbours(xtr_nf);
%train (it will add bias term automatically)
[w, predictor] = lr_predictor(X_train, ytr_nf);
display(w, 'weights for neighbours pixels features');

%predicted y on the training set
Yp_train = predictor(X_train);
%display training error
error_train = rmse(ytr_nf, Yp_train);
display(error_train, 'rmse on the training set');

%prepare testing set
X_test = get_neighbours(xte_nf);
%predicted y on the test set
Yp_test = predictor(X_test);
%display test error
error_test = rmse(yte_nf, Yp_test);
display(error_test, 'rmse on the test set');

%show surface
figure,
[dim1, dim2] = meshgrid(0:0.01:1, 0:0.01:1);
%swapped ones from original snippet, because w(1) corresponds to bias
%in my case
ysurf = [ones(numel(dim1),1), [dim1(:), dim2(:)]] * w;
surf(dim1, dim2, reshape(ysurf, size(dim1)));
hold on;
scatter3(xte_nf(:, 1032), xte_nf(:, 1032 - 34), yte_nf, 'red');


