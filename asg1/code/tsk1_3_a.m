%load imgregdata.mat % I do it via terminal

%launched via 
%tsk1_3_a(xtr_nf, ytr_nf, 5:5:30)
%and
%tsk1_3_a(xtr_nf, ytr_nf, 1:20)
function [] = tsk1_3_a(xtr_nf, ytr_nf, num_rbfs)
    X_train = [xtr_nf(:, 1032), xtr_nf(:, 1032 - 34)];
    opt = foptions;
    opt(1) = 1; % Display EM training
    opt(14) = 5; % number of iterations of EM
    dim = 2; % left_pixel, above_pixel in our case
    
    function regf = create_rbf_regf(num_rbf)
        function Y_pred = rbf_reg(X_train, Y_train, X_test)
            net = rbf(dim, num_rbf, 1, 'gaussian');
            net = rbftrain(net, opt, X_train, Y_train);
            Y_pred = rbffwd(net, X_test);
        end
        regf = @rbf_reg;
    end
    
    rbfs_rmse = zeros(1, length(num_rbfs));
    
    for i = 1:length(num_rbfs)
        num_rbf = num_rbfs(i);
        regf = create_rbf_regf(num_rbf);
        %default CV 10 folds 
        cvMse = crossval('mse', X_train, ytr_nf,'predfun',regf);
        rmse = cvMse ^ 0.5;
        
        %logging
        display(num_rbf, 'current number of kernels')
        display(rmse, 'rmse')
        
        rbfs_rmse(i) = rmse;
    end
    
    display(num_rbfs, 'number of kernels tried');
    display(rbfs_rmse, 'rmse for different number of kernels');
    
    plot(num_rbfs, rbfs_rmse)
    xlabel('number of rbf used');
    ylabel('Root Mean Square Error');
    set(gca,'FontSize', 18);
end