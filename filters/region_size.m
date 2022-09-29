function im_out = region_size(im)
% TODO: Add documentaton
% It replaces the value of each voxels with the number of voxels belonging
% to the region engulfing that voxel

is3D = check_image_dims(im);
if is3D
    im_label = bwlabeln(im);
else
    im_label = bwlabel(im);
end

labels = unique(im_label);
im_out = zeros(size(im));

% Start from 2 to avoid the 0s
for it=2:length(labels)
    tmp_mask = im_label == labels(it);
    num_voxels = numel(find(tmp_mask == true));
    im_out(tmp_mask) = num_voxels;
end