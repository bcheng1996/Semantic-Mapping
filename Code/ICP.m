function [out] = ICP(Pts1, Pts2)
%ICP Summary of this function goes here
%   Detailed explanation goes here
%%
%temp
Pc1 = PTSClouds{1};
Pc2 = PTSClouds{2};

Pts1 = Pc1.Location;
Pts1(any(isnan(Pts1),2),:) = [];


Pts2 = Pc1.Location;
Pts2(any(isnan(Pts2),2),:) = [];



max_iter = 1000;
thresh = 0.001;
R = [1 0 0; 0 1 0; 0 0 1];
t = [0, 0, 0];

tree = KDTreeSearcher(Pts1);

 for i=1:1
     mapping = knnsearch(tree, Pts2,'K',3);
     map = mapping(:,1);
     dist = sqrt(sum((Pts2 - Pts1(map,:)) .^2,2));
     dist = mean(dist);
     
     
 end

%% 
 mapping_sub = mapping(1:500,:);
 mapping_sub = mapping_sub(:,1);
 
 pts2 = Pts2(1:500,:); 
 pts1 = Pts1(mapping_sub,:);


 
 



end

