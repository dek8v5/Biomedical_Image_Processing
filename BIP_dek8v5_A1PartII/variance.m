function [ variance_Img ] = variance( Img, window_size)
%local_variance getting the variance of the image.
%variance is for indentify the change of intensity in the image
%   Img = input image
%   window_size = window size desire for the 

Img_square = Img.^2;

local_mean_img_square = local_mean(Img_square, window_size);

loc_mean_img = local_mean(Img, window_size);

%loc_variance is derived from (local_mean X^2) - (local_mean X)^2

variance_Img = local_mean_img_square - (loc_mean_img.^2);

end

