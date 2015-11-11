
function [w, predictor] = cs_linear_regression(x_tr, y_tr)
    %custom linear regression
    %it inserts bias term automatically
    %assume y is column vector N x 1
    %assume x_tr is N x num_features
    
    %adding bias term
    calc_Phi = @(x)[ones(size(x, 1), 1), x];
    
    %computing weights
    w = pinv(calc_Phi(x_tr)) * y_tr;
    
    predictor = @(x)calc_Phi(x) * w; 
end