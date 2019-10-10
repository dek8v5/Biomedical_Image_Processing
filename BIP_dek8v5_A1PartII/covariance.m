function [ cov ] = covariance( Img, p, window_size )
%covariance getting the covariance from Image and guided image
%   Img: the original image
%   p: guided image
%   window_size: desired window size 


local_mean_img_p = local_mean(Img.*p, window_size);

local_mean_img = local_mean(Img, window_size);

local_mean_p = local_mean(p, window_size);


%covariance is derived from (local_mean XY)-(local_mean X * Local_mean Y)

cov = local_mean_img_p - (local_mean_img .* local_mean_p);


end

