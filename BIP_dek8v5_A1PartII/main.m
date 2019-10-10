%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Dewi Endah Kharismawati                   %
%   14231619 / dek8v5                         %
%   Biomedical Image Processing Assignment 1  %
%   Part II                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clear all;
clc;

I = imread('cat.bmp'); %Guidance Image
p = imread('cat.bmp'); %Input Image

w = 3; %window size is given

%%%%%%%% No 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%call local mean function for I
local_mean_I = local_mean (I, w);
%call variance function for I
variance_I = variance (I, w);

%call local mean function for p
local_mean_p = local_mean (p, w);
%call variance for p
variance_p = variance (p, w);

%calculate the covariance of I and P by calling the covariance function
covariance_IP = covariance(I, p, w);


%%%%%%%% No 4 %%%%%%%%%

%call the myguidedfilter function to get the output image
%function syntax q = myimguidedfilter(I, p, r, epsilon);

figure,
subplot(1,2,1)
imshow(p);
title('original image');
subplot(1,2,2)
imhist(p)
title('histogram of original image')

figure,
subplot(3,3,1)
r = 2;
epsilon = 0.1^2;
tic
q1 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q1);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,2)
epsilon = 0.2^2;
tic
q2 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q2);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,3)
epsilon = 0.4^2;
tic
q3 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q3);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);



subplot(3,3,4)
r = 4;
epsilon = 0.1^2;
tic
q4 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q4);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,5)
epsilon = 0.2^2;
tic
q5 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q5);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,6)
epsilon = 0.4^2;
tic
q6 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q6);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);


subplot(3,3,7)
r=8;
epsilon = 0.1^2;
tic
q7 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q7);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,8)
epsilon = 0.2^2;
tic
q8 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q8);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

subplot(3,3,9)
epsilon=0.4^2;
tic
q9 = myimguidedfilter(I, p, r, epsilon);
toc
imshow(q9);
title(['r=' num2str(r) ' and epsilon=' num2str(sqrt(epsilon)) '^2']);

figure,
subplot(3,3,1);
imhist(q1);
title('r=2 and epsilon=0.1^2');
subplot(3,3,2);
imhist(q2);
title('r=2 and epsilon=0.2^2');
subplot(3,3,3);
imhist(q3);
title('r=2 and epsilon=0.4^2');
subplot(3,3,4);
imhist(q4);
title('r=4 and epsilon=0.1^2');
subplot(3,3,5);
imhist(q5);
title('r=4 and epsilon=0.2^2');
subplot(3,3,6);
imhist(q6);
title('r=4 and epsilon=0.4^2');
subplot(3,3,7);
imhist(q7);
title('r=8 and epsilon=0.1^2');
subplot(3,3,8);
imhist(q8);
title('r=8 and epsilon=0.2^2');
subplot(3,3,9);
imhist(q9);
title('r=8 and epsilon=0.4^2');