%load imgregdata.mat % I do it via terminal
xx = xtr ./ 63;
xx_std = std(xx,0,2);
h = histogram(xx_std,64);