%load imgregdata.mat % I do it via terminal
%part a
xx = xtr ./ 63;
xx_std = std(xx,0,2);
h = histogram(xx_std,124);