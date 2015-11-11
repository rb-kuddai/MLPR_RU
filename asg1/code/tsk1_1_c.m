%load imgregdata.mat % I do it via terminal
xx = xtr ./ 63;
xx_std = std(xx,0,2);

%get indixes for flat and non-flat patches respectively
%the threshold 4/63 is taken from the task 
xx_f_ids  = bsxfun(@le, xx_std, ones(size(xx_std)) .* 4/63);
xx_nf_ids = bsxfun(@gt, xx_std, ones(size(xx_std)) .* 4/63);

%slicing
xx_f  = xx(xx_f_ids, :);
xx_nf = xx(xx_nf_ids,:); 

%pick one random example of flat patch and non-flat patch
get_rnd_row = @(X) randi(size(X, 1), 1); 

%flat
rnd_flat_id = get_rnd_row(xx_f);
display(rnd_flat_id, 'random index of flat patch');
flat_patch = xx_f(rnd_flat_id, :);

%non-flat
rnd_non_flat_id = get_rnd_row(xx_nf);
display(rnd_non_flat_id, 'random index of non-flat patch');
non_flat_patch = xx_nf(rnd_non_flat_id, :);

%expanding patches to the full size
flat_patch(1050) = 0;
non_flat_patch(1050) = 0;

%creating images
flat_image = reshape(flat_patch, [35, 30]);
non_flat_image = reshape(non_flat_patch, [35, 30]);

%show images
%inverting them to ensure right position 
%last index of the patch vector patch_vector(1050) == patch_image(30, 35)

%flat
figure;
imagesc(flat_image', [0, 1]);
title(strcat('flat image, id ', num2str(rnd_flat_id)));
colormap gray;

%non-flat
figure;
imagesc(non_flat_image', [0, 1]);
title(strcat('non-flat image, id ', num2str(rnd_non_flat_id)));
colormap gray;