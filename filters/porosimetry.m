function im_out = porosimetry(im, faces)
% TODO: Add documentation 

im_thickness = local_thickness(im);

im_out = zeros(size(im_thickness));
for it=1:length(thickness_values)
    
    value = thickness_values(it);
    tmp_mask = local_thickness >= value & im;
    tmp_mask_trimmed = remove_disconnected(tmp_mask, faces);
    im_out(tmp_mask_trimmed) = value;

end

end