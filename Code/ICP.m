function [R t newCld] = ICP(Pts1, Pts2,max_iter)
%temp
%%
normal = pcnormals(Pts1);
normal(any(isnan(normal),2),:) = [];
Pts1 = Pts1.removeInvalidPoints;
Pts1 = Pts1.Location;
Pts1(any(isnan(Pts1),2),:) = [];
Pts2 = Pts2.removeInvalidPoints;
Pts2 = Pts2.Location;
Pts2(any(isnan(Pts2),2),:) = [];


thresh = 0.001;
R = [1 0 0; 0 1 0; 0 0 1];
t = [0; 0; 0];

tree = KDTreeSearcher(Pts1);
s = Pts2;
d = Pts1;
%player = pcplayer([-300,200],[-200,200],[800,1400]);


%%

for i=1:max_iter
     mapping = knnsearch(tree, s,'K',3);
     map = mapping(:,1);
     dist = sqrt(sum((s - d(map,:)) .^2,2));
     dist = mean(dist);
     [R_, t_] = rigid_transform(s, d, normal(map,:), map);
      s = R_ * s' + t_;
      R = R_ * R;
      t = R_ * t_ + t;
      s = s';
       %pcshow([s;d]);
       % ptCloud = pointCloud(([s;d]));
        %view(player,ptCloud);
      %fprintf('Iteration: %u\n mean: %u\n', i, dist);
end

newCld = s;
%%

 
 



end

