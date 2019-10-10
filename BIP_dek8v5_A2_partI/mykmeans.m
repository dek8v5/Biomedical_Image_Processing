function [ km ] = mykmeans( Img, k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

sigma = 1;
Img = double(Img);
Img = imgaussfilt(Img, sigma);

Img = reshape(Img, [row*col, 1]);

clustered  = kmeans(Img(:), k);

clustered = reshape(clustered, [row, col]);

figure,
imshow(clustered);

km = clustered;

end

