%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dewi Endah Kharismawati                    %
% 14231619 / dek8v5                          %
% Biomedical Image Processing                %
% Assignment 2 Part I                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% median filter
% morphological disk-shaped structuring element, where r specifies the radius
% 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clc;
clear all;
close all;

%task 1, use gaussian linear filtering to smooth and reduce noise

%read the image
Img = imread('lungCT.jpg');
%Img = imread('3TS0007.tif');
%Img = imread('BreastCacer_img_1127.tif');
%Img = imread('malaria_cropped2.tif');

[row, col, channel] = size(Img);
if channel > 1
   Img = rgb2gray(Img); 
end

%display the original image
figure,
subplot(2,3,1);
imshow(Img);
title('original Image');

%apply gaussian filter with standard derivation = 3
sigma = 1;
Img = double(Img);

Img = imgaussfilt(Img, sigma);

subplot(2,3,2);
imshow(uint8(Img));
title(['Gaussian filtered with \sigma = ' num2str(sigma)]);

%task2 use kmeans clustering method to segment the nuclei from background
%reshape the matrix
Img = reshape(Img, [row*col, 1]);

clustered  = kmeans(Img(:), 4);

%reshape the result to row by col
clustered = reshape(clustered, [row, col]);

%plot the result
subplot(2,3,3)
imshow(clustered==1);
title('Img cluster = 1');

subplot(2,3,4)
imshow(clustered==2);
title('Img cluster = 2');

subplot(2,3,5)
imshow(clustered==3);
title('Img cluster = 3');

subplot(2,3,6)
imshow(clustered==4);
title('Img cluster = 4');

