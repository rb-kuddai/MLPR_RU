%lauch via
% b) tsk2_1_bc(x_train, y_train, x_test, y_test)
% and 
% c) tsk2_1_bc(x_train, y_train, x_test, y_test, 100)
function [] = tsk2_1_bc(x_train, y_train, x_test, y_test, varargin)
    %default parameters
    MAX_LIN_SEARCHES = 5000;
    if length(varargin) == 0
        train_limit = size(x_train, 1)
    else
        train_limit = varargin{1}
    end
    
    %logistic regression function
    lr = @(ww, xx, yy) 1./(1 + exp(-yy.*(xx*ww)));
    
    function [] = report(ww, xx, yy, type_str)
        sigmas = lr(ww, xx, yy);
        accuracy = sigmas > 0.5;
        log_sigmas = log(sigmas); 
        
        fprintf('%s accuracy = %s \n',type_str ,errorbar_str(accuracy));
        fprintf('%s log probability = %s \n',type_str, errorbar_str(log_sigmas));
    end

    function [nLp, dnLp_dw] = neg_lr_loglike(ww, xx, yy)
        [Lp, dLp_dw] = lr_loglike(ww, xx, yy);
        nLp = -1 * Lp;
        dnLp_dw = -1 * dLp_dw;
    end
    
    function ww = train_lr(xx, yy)
        initial_ww = zeros(size(xx, 2), 1);
        ww = minimize(initial_ww, @neg_lr_loglike, MAX_LIN_SEARCHES, xx, yy);
    end

    weights = train_lr(x_train(1:train_limit, :), y_train(1:train_limit, :));
    report(weights, x_train, y_train, 'training set');
    report(weights, x_test,  y_test,  'test set');
end