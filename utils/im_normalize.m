function im_norm = im_normalize(im)

max_im = max(im(:));
min_im = min(im(:));

im_norm = (im - min_im)/(max_im - min_im);

end