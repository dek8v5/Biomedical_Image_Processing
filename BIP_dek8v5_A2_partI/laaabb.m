%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dewi Endah Kharismawati                    %
% 14231619 / dek8v5                          %
% Biomedical Image Processing                %
% Assignment 2 Part I                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%read the image
Img = imread('BreastCacer_img_1127.tif');
figure,
subplot(2,3,1);
imshow(uint8(Img));
title('Original Image');

%apply cform
cform = makecform('srgb2lab');
lab_img = applycform(Img,cform);

%get the ab color
Img_ab = double(lab_img(:,:,2:3));

[row, col, channel] = size(Img_ab);

%reshape based on ab feature
Img_ab = reshape(Img_ab,row*col,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
clustered = kmeans(Img_ab,nColors);

%reshape the clustered
clustered = reshape(clustered,row,col);
subplot(2,3,2);
imshow(clustered,[]), title('image clustered by index');

%segmenting the 
img_segmented = cell(1,3);
rgb_label = repmat(clustered,[1 1 3]);

for k = 1:nColors
    color = Img;
    color(rgb_label ~= k) = 0;
    img_segmented{k} = color;
end

%plot the result
subplot(2,3,3);
imshow(img_segmented{1});
title('objects in cluster 1');

subplot(2,3,4);
imshow(img_segmented{2})
title('objects in cluster 2');

subplot(2,3,5);
imshow(img_segmented{3})
title('objects in cluster 3');


