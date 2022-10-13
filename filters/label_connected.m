function im_out = label_connected(im, faces)
% This function takes a binary image as input and returns an image
% with each voxel labeled as 1 if disconnected or 2 if connected. The 
% connectivity is checked against the active faces, as expressed by the 
% input array. The function performs the calculation on the phase labeled 
% with 1 (or true) in the binary input image im.    
%
% Inputs:
%   im:    binary image (can be 2D or 3D)
%   faces: a 1D array of 0s and 1s. If im is 2D, faces has length 4. For 3D, 
%          faces has length 6. Active faces are indicated with 1.    
% 
% Outputs:
%   :im_out: resulting image
%
% Notes:
%   The different faces of the volume are indicated by the position in the 
%   faces array. For instance, faces(1) is equal to im(1,:). faces(2) is
%   equal to im(end, :). 

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
    im_label = bwlabeln(im);
else  
    im_label = bwlabel(im);
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