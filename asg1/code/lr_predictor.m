function [w, predictor] = lr_predictor(x_tr, y_tr)
    %assume y is column vector
    
    %adding bias term
    function Phi = calc_Phi(x)
        N = size(x, 1);
        Phi = [ones(N, 1), x];
    end
    
    %computing weights
    w = pinv(calc_Phi(x_tr)) * y_tr;
    
    function y_predicted = predict(x)
        Phi = calc_Phi(x);
        y_predicted = Phi * w; 
    end    
    
    predictor = @predict;
end