%launch via:
% b) tsk2_1_bc(x_train, y_train, x_test, y_test)
% c) tsk2_1_bc(x_train, y_train, x_test, y_test, 100)
function [] = tsk2_1_bc(x_train, y_train, x_test, y_test, varargin)
    %default parameters
    MAX_LIN_SEARCHES = 8000;
    if length(varargin) == 0
        train_limit = size(x_train, 1)
    else
        train_limit = varargin{1}
    end

    function [Lp, dLp_dw] = target_fun(ww, xx, yy)
        [Lp, dLp_dw] = lr_loglike(ww, xx, yy);
        Lp = -1 * Lp;
        dLp_dw = -1 * dLp_dw;
    end
    
    function ww = train(xx, yy)
        initial_ww = zeros(size(xx, 2), 1);
        ww = minimize(initial_ww, @target_fun, MAX_LIN_SEARCHES, xx, yy);
    end

    weights = train(x_train(1:train_limit, :), y_train(1:train_limit, :))
    report_lr(weights, x_train(1:train_limit, :), y_train(1:train_limit, :), 'training set');
    report_lr(weights, x_test,  y_test,  'test set');
end