function im_out = region_size(im)
% This function replaces each voxel of the input image with the size of 
% the region engulfing that voxel. The region size is expressed in number 
% of voxels.      
%
% Inputs:
%   im:    binary image (can be 2D or 3D)    
% 
% Outputs:
%   :im_out: resulting image
%
% Notes:
%   The calculations are performed on the part of the binary image labeled
%   with 1 or true.

is3D = check_image_dims(im);

if is3D
    im_label = bwlabeln(im);
else
    im_label = bwlabel(im);
end

labels = unique(im_label);
im_out = zeros(size(im));

for it=2:length(labels)
    tmp_mask = im_label == labels(it);
    num_voxels = numel(find(tmp_mask == true));
    im_out(tmp_mask) = num_voxels;
end