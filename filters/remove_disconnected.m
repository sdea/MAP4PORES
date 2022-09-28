function im_out = remove_disconnected(im, faces)
% TODO add documentation 

is3D = check_image_dims(im);

switch nargin
    case 1
        if is3D
            faces = [1, 1, 1, 1, 1, 1];
        else
            faces = [1, 1, 1, 1];
        end      
end

im_conn = label_connected(im, faces);
im_out = im;
im_out(im_conn == 1) = 0;

end