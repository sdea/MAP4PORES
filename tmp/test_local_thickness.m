%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Local thickness test %%%%%%%%%%%

clc;
clear;
close all;

%% load image from file

%% Distance map 
im_dist = bwdist(~im);
figure, imagesc(im_dist), colormap("jet")
axis image 

%% Get the maximum of distance map 
max_dist = max(im_dist(:));
dist_vect = 1:max_dist;

local_thickness = zeros(size(im_dist));

for i=0:max_dist
    
    im_c = false(size(im));
    im_sum = false(size(im));
    c_max = i;
    im_c(im_dist >= c_max) = true;
    im_c_dist = bwdist(im_c);
    im_sum((im_c_dist <= c_max) & im) = true;
    local_thickness(im_sum) = i;
end

%% Local thickness test
figure, imagesc(local_thickness), colormap("jet")
axis image 

%% Test function 
local_t = local_thickness(im);
figure, imagesc(local_t), colormap("jet")
axis image

%% Test in 3D 
im3d = generate_random_blobs([300,300,300], 0.2, 3);
local_t_3d = local_thickness(im3d);
figure(1), imagesc(im3d(:,:,50)), colormap("gray")
figure(2), imagesc(local_t_3d(:,:,50)), colormap("jet")

%% Looping through local thickness values 
thickness_values = unique(local_thickness);

porosimetry_matrix = zeros(size(local_thickness));
for it=1:length(thickness_values)
    
    value = thickness_values(it);
    tmp_mask = local_thickness >= value & im;
    tmp_mask_trimmed = remove_disconnected(tmp_mask);
    porosimetry_matrix(tmp_mask_trimmed) = value;

end

%% 
figure, imagesc(porosimetry_matrix), colormap("jet")
axis image 



