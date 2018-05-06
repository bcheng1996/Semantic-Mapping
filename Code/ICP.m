function [out] = ICP(Pts1, Pts2)
%ICP Summary of this function goes here
%   Detailed explanation goes here
%%
%temp
PTSClouds =  load('PointClouds_scene_001.mat');
PTSClouds = PTSClouds.PTSClouds;
Pc1 = PTSClouds{1};
Pc2 = PTSClouds{2};

Pts1 = Pc1.Location;
Pts1(any(isnan(Pts1),2),:) = [];


Pts2 = Pc2.Location;
Pts2(any(isnan(Pts2),2),:) = [];



max_iter = 1000;
thresh = 0.001;
dist = 9999999;
R = [1 0 0; 0 1 0; 0 0 1];
t = [0, 0, 0];

tree = KDTreeSearcher(Pts1);

 while i < 500 && dist > thresh
     mapping = knnsearch(tree, Pts2,'K',3);
     map = mapping(:,1);
     dist = sqrt(sum((Pts2 - Pts1(map,:)) .^2,2));
     dist = mean(dist)
     [Ri,ti] = rigidTransform(Pts2,Pts1,map);
     Pts2 = Ri*Pts2'+ti;
     Pts2 = Pts2';
     R = Ri*R;
     t = Ri*ti+t;
 end

%% 

 mapping_sub = mapping(1:500,:);
 mapping_sub = mapping_sub(:,1);
 
 pts2 = Pts2(1:500,:); 
 pts1 = Pts1(mapping_sub,:);


 
 



end

