%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Disconnected blobs test %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%% Create random structure
im = generate_random_blobs([100,100]);
figure, imagesc(im), colormap("gray");

%% Create the region labels from matlab 
im_label = bwlabel(im);
figure, imagesc(im_label), colormap("jet");

%% We perform the intersection with borders 
im_boders = create_borders(im);
figure, imagesc(im_boders), colormap("gray");

%% Create the intersection
labels = unique(im_label); % not sure if this is too slow 

im_connected = zeros(size(im_label));

for i=1:labels(end)

    tmp_mask = im_label == i;
    intersect = tmp_mask & im_boders;
    
    disp(isempty(find(intersect == true, 1)));
    
    if isempty(find(intersect == true, 1))
        im_connected(tmp_mask) = 1;
    else
        im_connected(tmp_mask) = 2;
    end

end

%% 
figure, imagesc(im_connected), colormap("jet")
