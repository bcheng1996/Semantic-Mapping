function [best_pts_set] = RANSAC(Pts,num_planes)
%RANSAC Summary of this function goes here
%   Detailed explanation goes here

%%
num_samples = 2000;
threshold = 0.02;
best_num_inliers = 0;
X = Pts;
center = mean(X);
[ROI, nonROI] = getROI(center, X);  
max_perm = size(nonROI,1);
best_pts_set = {};

for i=1:num_planes
    best_pts = [];
    best_idx = [];
    max_perm = size(nonROI,1);
    num = size(X,1);
    for r = 1:num_samples
        curr_ran= randperm(max_perm, 8);
        p1 = nonROI(curr_ran(1), :);
        p2 = nonROI(curr_ran(2), :);
        p3 = nonROI(curr_ran(3), :);
        n = cross((p2 - p1), (p3-p1));
        n = repelem(n,num,1);
        p = X;
        d = abs(dot(n, p-p1,2));
        d = mat2gray(d);
        d_idx = find(d < threshold);
        curr_pts = X(d_idx,:);
        if(numel(curr_pts) > numel(best_pts))
            best_pts = curr_pts;
            best_idx = d_idx;
        end
    end
    X(best_idx,:) = [];
    [ROI, nonROI] = getROI(center, X);
    pcshow(nonROI);
    best_pts_set{i} = best_pts;
end
end
