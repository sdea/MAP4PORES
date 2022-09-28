function im = random_blobs(size, porosity, chunkiness)
% TODO: Include documentation 


switch nargin
    case 0
        disp('Not enough input variables');
    case 1
        porosity = 0.5;
        chunkiness = 1.5;
    case 2
        chunkiness = 1.5; 
end

tmp_im = rand(size);
sigma = mean(size) / (40 * chunkiness);

if length(size) == 2
    im_filt = imgaussfilt(tmp_im, sigma);
else
    im_filt = imgaussfilt3(tmp_im, sigma);
end

% Normalize between 0 and 1 after gaussian blur 
im_filt_normalized = im_normalize(im_filt);

im = zeros(size);
im(im_filt_normalized < porosity) = 1;

end