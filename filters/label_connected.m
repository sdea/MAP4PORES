function im_out = label_connected(im, faces)
% TODO: include documentation

im_dims = length(size(im));
is3D = im_dims == 3;

switch nargin
    case 0
        disp("Not enough inputs arguments")
        return
    case 1
        if is3D 
            faces = [1, 1, 1, 1, 1, 1];
        else
            faces = [1, 1, 1, 1];
        end
end

if is3D
    im_label = bwlabel(im);
else  
    im_label = bwlabeln(im);
end

num_labels = max(im_label(:));

im_borders = create_borders(im, faces);
im_out = zeros(size(im));

for it=1:num_labels

    tmp_mask = im_label == it;
    intersect = tmp_mask & im_borders;

    if isempty(find(intersect == true, 1))
        im_out(tmp_mask) = 1;
    else
        im_out(tmp_mask) = 2;
    end

end

end