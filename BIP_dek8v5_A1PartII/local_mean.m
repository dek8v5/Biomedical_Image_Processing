function [ loc_mean ] = local_mean( Img, window_size )
%UNTITLED2 Summary of this function goes here
%   Img = input image matrix
%   window_size = window size for local mean

Img = double(Img); %convert image into double

%creating the window_matrix for the convolution 2D
%this window matrix is w*w matrix, which contains 1/(w^2)
window_matrix = 1/window_size^2 .* (ones(window_size));

%2D convolving the Image with the window matrix
%shape same means will have the sane aize as the Img size
img_mean = conv2(Img, window_matrix, 'same');

%return values
loc_mean = img_mean;

end

