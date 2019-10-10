function [ advancelcs ] = AdvanceLCS( Img, percentage )
%AdvanceLCS Summary of this function goes here
% Img = image imported from main
% percentage = desired percentage to be discarded

%calculated the high percentage
highPercentage= 1-percentage;

%the reduction
[pixelCount, grayLevels] = imhist(Img);
%cummulative histogram distribution, to get the 1st and end percentage to
%be discarded
cumulativePC=cumsum(pixelCount);
cumDist = cumulativePC/numel(Img);

%new min limit
%find the 1st cdf which has more than percentage, and give me the first
%value
newMinIndex = find(cumDist>percentage, 1, 'first');
newMinLimit = grayLevels(newMinIndex);

%new Max Limit
newMaxIndex = find(cumDist>highPercentage, 1, 'first');
newMaxLimit = grayLevels(newMaxIndex);

%finding the gain
a=256/(newMaxLimit-newMinLimit);

%calculated the bias
b= newMinLimit*a;
b = -b;

%implement gain and bias we calculated previously on the image
Iresult = a*Img+b;

%return
advancelcs = uint8(Iresult);

end

