%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Local thickness test %%%%%%%%%%%

clc;
clear;
close all;

%% Generate random structure 
im = generate_random_blobs([100, 100], 0.6);
figure, imagesc(im), colormap("gray")
axis image 

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

%% 
figure, imagesc(local_thickness), colormap("jet")
axis image 
