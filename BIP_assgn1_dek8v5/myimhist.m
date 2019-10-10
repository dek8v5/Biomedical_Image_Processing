%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Dewi Endah Kharismawati                   %
%   14231619 / dek8v5                         %
%   Biomedical Image Processing Assignment 1  %
%   Part I                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function H = myimhist(I, nbins)
%I = input image
%nbins = number of bins

%define the number of element on each bin
group = ceil(256/nbins);

%initialize histo
histo = zeros(1,group*nbins);

Ivector = I(:);

for i = 1:numel(Ivector)   
        histo(Ivector(i)+1) = histo(Ivector(i)+1)+1;
end

%grouping the data based on number of bins
res = sum(reshape(histo,group,nbins));

%plotting the data into bar
x_axis = ceil(group/2):group:group*nbins;
bar(x_axis, res, 'BarWidth', 1.0);
set(gca,'XLim',[0 300])
set(gca,'XTick',(0:50:300))
title('My Histogram');

%return
H = histo(:, 1:256);

end

