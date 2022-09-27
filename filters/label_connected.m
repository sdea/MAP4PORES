function im_out = label_connected(im, faces)
% This function only works in 2D for now
% Make seamingless work in 3D 
% Also, introduce the mask parameter for arbitrary edge shape connectivity

switch nargin
    case 0
        disp("Not enough inputs arguments")
        return
    case 1
        faces = [1, 1, 1, 1];
end

im_label = bwlabel(im);
num_labels = max(im_label(:));

% Make 
im_borders = create_borders(im, faces);
im_connected = zeros(size(im));

for it=1:num_labels

    tmp_mask = im_label == it;
    intersect = tmp_mask & im_borders;

    if isempty(find(intersect == true, 1))
        im_connected(tmp_mask) = 1;
    else
        im_connected(tmp_mask) = 2;
    end

end

im_out = im_connected;

end