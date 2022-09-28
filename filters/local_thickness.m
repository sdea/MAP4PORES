function im_out = local_thickness(im)
% TODO - add documentation 

im_dist = bwdist(~im); 
max_dist = max(im_dist(:));

local_thickness = zeros(size(im_dist));

for i=0:max_dist
    
    im_c = false(size(im));
    im_sum = false(size(im));
    c_max = i;
    im_c(im_dist >= c_max) = true;
    im_c_dist = bwdist(im_c);
    im_sum((im_c_dist <= c_max) & im) = true;
    local_thickness(im_sum) = i;
    
end

im_out = local_thickness;

end