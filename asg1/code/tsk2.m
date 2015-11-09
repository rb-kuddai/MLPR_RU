%load imgregdata.mat % I do it via terminal
n_offset = 5000;
x_left   = xtr_nf(1:n_offset, 1032);
x_above  = xtr_nf(1:n_offset, 1032 - 34);
x_target = ytr_nf(1:n_offset);

scatter3(x_left, x_above, x_target);