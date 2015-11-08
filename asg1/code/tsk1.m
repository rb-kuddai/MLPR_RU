%load imgregdata.mat % I do it via terminal
%xx = xtr ./ 63;
xx = xtr ./ 63;
xx_std = std(xx,0,2);
%h = histogram(xx_std, 64);
xx_std_flat = bsxfun(@lt, xx_std, ones(size(xx_std)) .* (4.0 / 63));
xx_f = xx(xx_std_flat, :);
size(xx_f)
xx_f_mean = mean(xx_f, 2);
xx_f_abs_diff = abs(bsxfun(@minus, xx_f, xx_f_mean));
xx_f_max_diff = max(xx_f_abs_diff, [], 2);

max(xx_f_max_diff)
histogram(xx_std, 30);
%a
%h = histogram(xx_std, 64);
%t = randi([0 9],1,10000);
%histogram(t, 100)