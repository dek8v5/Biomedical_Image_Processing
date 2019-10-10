%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dewi Endah Kharismawati                    %
% 14231619 / dek8v5                          %
% Biomedical Image Processing                %
% Assignment 2 Part I                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

%task 1, use gaussian linear filtering to smooth and reduce noise

%read the image
Img = imread('BreastCacer_img_1127.tif');
%Img = imread('malaria_cropped2.tif');

I = Img; 
figure,
subplot(2,2,1)
imshow(I);
title('original image')
subplot(2,2,2)
imshow(I(:,:,1));
title('channel 1 original');
subplot(2,2,3)
imshow(I(:,:,2));
title('channel 2 original');
subplot(2,2,4)
imshow(I(:,:,3));
title('channel 3 original');

%display the original image
figure,
subplot(1,2,1);
imshow(Img);
title('original Image');

%apply gaussian filter with standard derivation = 3
sigma = 2;
Img = double(Img);
Img = imgaussfilt(Img, sigma);

subplot(1,2,2);
imshow(uint8(Img));
title(['Gaussian filtered with \sigma = ' num2str(sigma)]);

%reshape the image matrix to be nxp
%task2 use kmeans clustering method to segment the nuclei from background
[row, col, channel] = size(Img);

%reshape the matrix
Img = reshape(Img, [row*col, channel]);

clustered  = kmeans(Img(:), 4);

%reshape the result to row by col
clustered = reshape(clustered, [row, col, channel]);

%plot the result of channel 1 
figure,
subplot(2,2,1)
imshow(clustered(:,:,1)==1);
title('Img channel 1 (Red); cluster=1');

subplot(2,2,2)
imshow(clustered(:,:,1)==2);
title('Img channel 1 (Red); cluster=2');

subplot(2,2,3)
imshow(clustered(:,:,1)==3);
title('Img channel 1 (Red); cluster=3');

subplot(2,2,4)
imshow(clustered(:,:,1)==4);
title('Img channel 1 (Red); cluster=4');

%plot the result of channel 2
figure,
subplot(2,2,1)
imshow(clustered(:,:,2)==1);
title('Img channel 2 (Green); cluster=1');

subplot(2,2,2)
imshow(clustered(:,:,2)==2);
title('Img channel 2 (Green); cluster=2');

subplot(2,2,3)
imshow(clustered(:,:,2)==3);
title('Img channel 2 (Green); cluster=3');

subplot(2,2,4)
imshow(clustered(:,:,2)==4);
title('Img channel 2 (Green); cluster=4');

%plot the result of channel 3 
figure,
subplot(2,2,1)
imshow(clustered(:,:,3)==1);
title('Img channel 3 (Blue); cluster=1');

subplot(2,2,2)
imshow(clustered(:,:,3)==2);
title('Img channel 3 (Blue); cluster=2');

subplot(2,2,3)
imshow(clustered(:,:,3)==3);
title('Img channel 3 (Blue); cluster=3');

subplot(2,2,4)
imshow(clustered(:,:,3)==4);
title('Img channel 3 (Blue); cluster=4');

