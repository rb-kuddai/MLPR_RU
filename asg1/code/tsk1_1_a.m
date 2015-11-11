%load imgregdata.mat % I do it via terminal

%launch via - tsk1_1_a(xtr)
function [] = tsk1_1_a(xtr)
    patches = xtr ./ 63;
    patches_std = std(patches,0,2);

    figure;
    histogram(patches_std,64);
    title('histogram of patches standard deviations');
    xlabel('standard deviation');
    ylabel('number of patches');
end