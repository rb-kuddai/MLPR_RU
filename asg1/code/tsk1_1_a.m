%load imgregdata.mat % I do it via terminal
xx = xtr ./ 63;
xx_std = std(xx,0,2);

%plot histogram
figure;
h = histogram(xx_std,64);
title('histogram of patches standard deviations');
xlabel('standard deviation');
ylabel('number of patches');