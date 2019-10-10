function [ q ] = myimguidedfilter( I, p, r, epsilon )
%myimguidedfilter is a filtering method to smooth images
%   I = guidance image with range intensity 0-255
%   p = input image with range intensity 0-255
%   r = radius desired for the window size to get the local mean
%   epsilon = regularization to keep the ak controlled (not too big)

%converting the intensity of I and p from 0-255 to 0-1
I = mat2gray(I);
p = mat2gray(p);


%getting the window size, in this function we are going to use our own
%local mean function, which it needs window_size (based on number 3
%problem), to get the local mean.
w = 2*r + 1;

%step 1
%computing the mean and covariance of both images input
mean_I = local_mean(I, w);
mean_p = local_mean(p, w);
corr_I = local_mean(I.*I, w);
corr_Ip = local_mean(I.*p, w);

%step 2
%getting the variance of guidance image and covariance of guidance and
%input images using mean and correlation we compute in step 1
var_I = corr_I - mean_I.*mean_I;
cov_Ip = corr_Ip - mean_I.*mean_p;


%step 3
%get the value of a from variance divided by the sum of variance guidance img and epsilon
%getting the value of b by substracting the (multiplication of a and
%guidance image local mean) from input image local mean
a = cov_Ip ./ (var_I + epsilon);
b = mean_p - a.*mean_I;

%step 4
%retrieve the local mean of a and b
mean_a = local_mean(a, w);
mean_b = local_mean(b, w);

%step 5
%compute the output by multiply mean_a and I and add the result with mean_b
q = (mean_a.*I) + mean_b;

end

