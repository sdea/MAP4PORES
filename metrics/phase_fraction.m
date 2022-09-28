function phase_fraction = compute_phase_fraction(im, label)
% TODO - Add documentation

num_voxels = numel(im);
num_label_voxels = numel(find(im == label));

phase_fraction = num_label_voxels/num_voxels;

end