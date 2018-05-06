function [ROI, nonROI] = getROI(center, Pts)
%Returns the ROI of pointclouds given a center [x y z] with radius 
% up to a threshold
%%
threshold = 300;
Ptsdif = Pts - center;
norms = sqrt(sum(Ptsdif.^2,2));
ROIcord = find(norms < threshold);
NONROIcord = find(norms >= threshold);
ROI = Pts(ROIcord,:);
nonROI = Pts(NONROIcord,:);



end

