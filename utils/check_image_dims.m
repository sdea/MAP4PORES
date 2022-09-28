function is3D = check_image_dims(im)

im_dims = length(size(im));
is3D = im_dims == 3;

end