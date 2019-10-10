function [ c ] = LCS( Img )
%LCS Summary of this function goes here
% Img = image imported from main

%convert the image into double
Img = double(Img);

%to get the min limit and max limit of the image
minLimit = min(Img(:));
maxLimit = max(Img(:));

a=256/(maxLimit-minLimit);
b= minLimit*a;
b = -b;

Iresult = a*Img+b;

c = uint8(Iresult);

end

