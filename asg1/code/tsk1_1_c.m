%load imgregdata.mat % I do it via terminal

%launch via tsk1_1_c(xtr)
function [] = tsk1_1_c(xtr)
    %normalising
    patches = xtr ./ 63;
    patches_std = std(patches,0,2);

    %the threshold 4/63 is taken from the task 
    split_threshold = ones(size(patches_std)) .* 4/63;
    flat_patches_ids     = bsxfun(@le, patches_std, split_threshold);
    non_flat_patches_ids = bsxfun(@gt, patches_std, split_threshold);

    %split on flat and non-flat patches
    flat_patches     = patches(flat_patches_ids, :);
    non_flat_patches = patches(non_flat_patches_ids,:); 

    function [rnd_image, rnd_image_id] = get_rnd_image(patches)
        rnd_image_id = randi(size(patches, 1), 1);
        patch = patches(rnd_image_id, :);
        %expanding patch to the full size
        patch(1050) = 0;
        %reshaping to image
        rnd_image = reshape(patch, [35, 30]);
        %transposing them to ensure right position on the plot
        rnd_image = rnd_image';
    end

    function [] = show_image(image, title_str, image_id)
        figure;
        imagesc(image, [0, 1]);
        title(strcat(title_str, num2str(image_id)));
        colormap gray;
    end

    [flat_image, rnd_flat_id] = get_rnd_image(flat_patches);
    [non_flat_image, rnd_non_flat_id] = get_rnd_image(non_flat_patches);

    show_image(flat_image, 'flat image, id ', rnd_flat_id);
    show_image(non_flat_image, 'non-flat image, id ', rnd_non_flat_id);
end