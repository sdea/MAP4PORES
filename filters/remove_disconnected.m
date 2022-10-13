function im_out = remove_disconnected(im, faces)
% This function removes the regions disconnected from the selected faces.     
%
% Inputs:
%   im:    binary image (can be 2D or 3D) 
%   faces: a 1D array of 0s and 1s. If im is 2D, faces has length 4. For 3D, 
%          faces has length 6. Active faces are indicated with 1.
% 
% Outputs:
%   im_out: resulting image
%
% Notes:
%   The different faces of the volume are indicated by the position in the 
%   faces array. For instance, faces(1) is equal to im(1, :), faces(2) is
%   equal to im(end, :) etc..


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