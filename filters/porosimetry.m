function im_out = porosimetry(im, faces)
% TODO: Add documentation

is3D = check_image_dims(im);

switch nargin
    case 1
        if is3D
            faces = [1, 1, 1, 1, 1, 1];
        else
            faces = [1, 1, 1, 1];
        end

end

im_thickness = local_thickness(im);
thickness_values = unique(im_thickness);

im_out = zeros(size(im_thickness));
for it=1:length(thickness_values)
    
    value = thickness_values(it);
    tmp_mask = im_thickness >= value & im;
    tmp_mask_trimmed = remove_disconnected(tmp_mask, faces);
    im_out(tmp_mask_trimmed) = value;

end

end