%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Dewi Endah Kharismawati                   %
%   14231619 / dek8v5                         %
%   Biomedical Image Processing Assignment 1  %
%   Part I                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

%%%%%%%%%%%%%% Part No 1A %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nbins = 10;

Img = imread('cat.bmp');

subplot(2,1,1)
imshow(Img);
title('Source Image');

Img = double(Img);

subplot(2,1,2)

disp('time for my own histogram function');
tic
myimhist(Img, nbins);
toc

figure,
disp('time for build in imhist');
tic
imhist(uint8(Img), nbins);
toc
%%%%%%%%%%%%%%%% Part No 1B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nbins = 8;

mask = imread('mask_mrc5large2.tif');
Img = imread('mrc5large2.jpg');

%get the red layer of the image
Img = double(Img(:,:,1));
mask = double(mask);

figure,
subplot(3,2,2)
tic
myimhist(Img, nbins);
toc
title('Original Histogram');

subplot(3,2,3)
imshow(mask);
title('Mask Image');

subplot(3,2,4)
tic
myimhist(mask, nbins);
toc
title('Mask Histogram');

%call histogram masking
tic
myimhistmask(Img, nbins, mask);
toc

%%%%%%%%%%%%%% Part No 2A %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Img = imread('3TS0007.tif');
%Img = imread('cat.bmp');

figure,
subplot(2,2,1);
imshow(Img);
title('original Image');

subplot(2,2,2)
imhist(Img, 64);
title('Original Image Histogram');

% call the stretch operation
Iresult = LCS(Img);

subplot(2,2,3);
imshow(Iresult);
title('Image after stretch');

subplot(2,2,4);
imhist(Iresult);
title('histogram of stretched Image');

% %%%%%%%%%%%%%% Part No 2B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%put the percentage to be discarded as you want

desirePercentage = 5;
percentage = desirePercentage/100;
Img = imread('3TS0007.tif');
%Img = imread('cat.bmp');

figure
subplot(2,2,1)
imshow(Img);
title('original Image');

subplot(2,2,2)
imhist(Img);
title('Original Histogram');


Iresult = AdvanceLCS(Img, percentage);

subplot(2,2,3)
imshow(Iresult);
title(['image result after ' num2str(desirePercentage) '% discard']); 

subplot(2,2,4)
imhist(Iresult);
title(['histogram result after ' num2str(desirePercentage) '% discard']); 














