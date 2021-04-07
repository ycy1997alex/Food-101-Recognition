close all; clear; clc;

src_mother_folder = './Data/food-101/images/';
src_mother_dir = dir(src_mother_folder);
dst_mother_folder = './Data/representative_images101/';
mkdir(dst_mother_folder)
for idx_label = 1:101
    child_name = src_mother_dir(idx_label+2).name;
    src_child_folder = fullfile(src_mother_dir(idx_label+2).folder,child_name);
    src_child_dir = dir([src_child_folder,'\*.jpg']);
    dst_child_folder = fullfile(dst_mother_folder,child_name);
    mkdir(dst_child_folder)
    loc = randsample(length(src_child_dir),1);
    for idx = 1:length(loc)
        idx_file = loc(idx);
        src_img = fullfile(src_child_dir(idx_file).folder,src_child_dir(idx_file).name);
        copyfile(src_img,dst_child_folder)
    end
end
fprintf('Finish!!!')