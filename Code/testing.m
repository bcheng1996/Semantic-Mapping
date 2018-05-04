function [outputArg1,outputArg2] = testing(inputArg1,inputArg2)
%TESTING Summary of this function goes here
%   Detailed explanation goes here


%%
% X = Pts;
% threshold = ;
% %for i=1:num_planes
%     best_pts = [];
%     best_idx = [];
%     max_perm = size(nonROI,1);
%     num = size(X,1);
%     for r = 1:num_samples
%         curr_ran= randperm(max_perm, 8);
%         p1 = nonROI(curr_ran(1), :);
%         p2 = nonROI(curr_ran(2), :);
%         p3 = nonROI(curr_ran(3), :);
%         n = cross((p3 - p1), (p2-p1));
%         p = X;
%         d = dot(n, p3);
%         a = n(1);
%         b = n(2); 
%         c = n(3);
%         d_1 = a*X(:,1);
%         d_2 = b*X(:,2);
%         d_3 = c*X(:,3);
%         d_4 = d;
%         d_top = abs(d_1 + d_2 + d_3 + d_4);
%         d = d_top / (sqrt(a^2 + b^2 + c^2));
%         d_idx = find(d < threshold);
%         curr_pts = X(d_idx,:);
%         if(numel(curr_pts) > numel(best_pts))
%             best_pts = curr_pts;
%             best_idx = d_idx;
%         end
%     end
%     X(best_idx,:) = [];
%     [ROI, nonROI] = getROI(center, X);
%     pcshow(nonROI);
%     best_pts_set{i} = best_pts;
%end

num_samples = 1000;
threshold = 0.05;
best_num_inliers = 0;
num_planes = 3;
X = Pts;
center = mean(X);
[ROI, nonROI] = getROI(center, X);  
max_perm = size(nonROI,1);
best_pts_set = {};

for i=1:1000
     curr_ran= randperm(max_perm, 8);
     p1 = nonROI(curr_ran(1), :);
     p2 = nonROI(curr_ran(2), :);
     p3 = nonROI(curr_ran(3), :);
     n = cross((p3 - p1), (p2-p1));
    
     
     
     
end


end

