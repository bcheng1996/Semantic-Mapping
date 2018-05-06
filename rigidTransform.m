function [R,t,r,c,normal,src,des] = rigidTransform( Pts2,Pts1, mapping)
%RIGIDTRANSFORM Summary of this function goes here
%   Detailed explanation goes here
%%
PTSClouds =  load('PointClouds_scene_001.mat');
PTSClouds = PTSClouds.PTSClouds;
Pc1 = PTSClouds{1}; % destination
Pc2 = PTSClouds{2}; % source
src = Pts2;
des = Pts1;
vectorSize = min(size(src),size(des));

%%
src = src(1:vectorSize,:);
des = des(1:vectorSize,:);

Pc2=pointCloud(src).removeInvalidPoints;
Pc1=pointCloud(des).removeInvalidPoints;

src=Pc2.Location;
des=Pc1.Location;

normal = pcnormals(Pc1);
normal(any(isnan(normal),2),:) = [];
normal = normal(1:vectorSize,:);
c = cross(src,normal);
NW = zeros(3,3);
NE = zeros(3,3);
SW = zeros(3,3);
SE = zeros(3,3);
b = zeros(6,1);
for i = 1:vectorSize
    NW = NW + c(i,:)'*c(i,:);
    NE = NE + c(i,:)'*normal(i,:);
    SW = SW + normal(i,:)'*c(i,:);
    SE = SE + normal(i,:)'*normal(i,:);
    b = b - dot((src(i,:)-des(mapping(i),:)),normal(i,:))*[c(i,1);c(i,2);c(i,3);normal(i,1);normal(i,2);normal(i,3)];
end
C = [NW,NE;SW,SE];
x = C\b;
R = [1,-x(3),x(2);x(3),1,-x(1);-x(2),x(1),1];
t = x(4:6);
r=x(1:3);
end