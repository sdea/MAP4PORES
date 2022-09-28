function im = create_borders(im, faces)
% TODO: insert checkers for im and faces, dimensions need to add up 

im = false(size(im));
im_dims = length(size(im));

%2D 
if im_dims == 2

    if faces(1) == 1
        im(1, :) = true;
    end
    if faces(2) == 1
        im(end, :) = true;
    end
    if faces(3) == 1
        im(:, 1) = true;
    end
    if faces(4) == 1
        im(:, end) = true;
    end

end

%3D
if im_dims == 3

    if faces(1) == 1
        im(1, :, :) = true;
    end
    if faces(2) == 1
        im(end, :, :) = true;
    end
    if faces(3) == 1
        im(:, 1, :) = true;
    end
    if faces(4) == 1
        im(:, end, :) = true;
    end
    if faces(5) == 1
        im(:, :, 1) = true;
    end
    if faces(6) == 1
        im(:, :, end) = true;
    end
    
end


end