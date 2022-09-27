function im_out = remove_disconnected(im, faces)
% TODO add documentation 
% Only works in 2D

% Need to polish this
switch nargin
    case 1
        faces = [1, 1, 1, 1];
end

im_conn = label_connected(im, faces);
im_out = im;
im_out(im_conn == 1) = 0;

end