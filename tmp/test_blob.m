%%%% Test blob generation %%%%

clc;
clear;
close all; 

%% Generate random noise and gauss filt
im = rand(200);
% Calculate sigma following tomopy 
chunkiness = 1.5;
sigma = mean(size(im)) / (40 * chunkiness);
im_filt = imgaussfilt(im, sigma);
% Normalize the image from 0 to 1
im_filt_normalized = (im_filt - min(im_filt(:)))/(max(im_filt(:)) - min(im_filt(:)));

%% Threshold
%  The threshold is calculated to respect a given porosity
porosity = 0.5;
im_binary = zeros(200);
im_binary(im_filt_normalized <= porosity) = 1;

%% Display image 
figure, imagesc(im_binary), colormap("gray")
axis image



