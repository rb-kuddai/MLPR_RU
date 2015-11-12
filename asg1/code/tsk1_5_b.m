%load imgregdata.mat % I do it via terminal

%launched via 
%tsk1_5_b(xtr_nf, ytr_nf, xte_nf, yte_nf)
function [] = tsk1_5_b(x_train, t_train, x_test, t_test)
    %t - means target values
    nhid = 10; % number of hidden units
    
    % Set up vector of options for the optimiser.
    options = zeros(1,18);
    options(1)  = 1; % This provides display of error values.
    options(9)  = 1; % Check the gradient calculations.
    options(14) = 200; % Number of training cycles.
    
    function [rmse_train, rmse_test] = launch_NN(seed)
        rng(seed,'twister')
        net = mlp(size(x_train,2), nhid, 1, 'linear');
        [net, tmp] = netopt(net, options, x_train(1:5000,:), t_train(1:5000,:), 'scg');
        
        rmse_train = cs_rmse(t_train, mlpfwd(net, x_train));    
        rmse_test  = cs_rmse(t_test,  mlpfwd(net, x_test));
    end
    
    seeds  = 2015:1:2019;
    table = zeros(length(seeds), 3);
    
    for i = 1:length(seeds)
        seed = seeds(i);
        [rmse_train, rmse_test] = launch_NN(seed);
        table(i, :) = [seed, rmse_train, rmse_test];
    end
    
    %LaTeX table format
    formatSpec = '%4.0f & %5.4f & %5.4f \\\\ \n';
    fprintf(formatSpec, table');
end