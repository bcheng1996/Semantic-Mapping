function [R, t] = rigid_transform(src, des, normal, mapping)
%RIGID_TRANSFORM Summary of this function goes here
%   Detailed explanation goes here

v = min(size(des),size(mapping));
% Pc1=Pc1.removeInvalidPoints;
%%
% src = src(1:vectorSize,:);
% des = des(1:vectorSize,:);
% normal = normal(1:vectorSize,:);
% c = cross(src,normal);
% NW = zeros(3,3);
% NE = zeros(3,3);
% SW = zeros(3,3);
% SE = zeros(3,3);
% b = zeros(6,1);
% for i = 1:vectorSize
%     NW = NW + c(i,:)'*c(i,:);
%     NE = NE + c(i,:)'*normal(i,:);
%     SW = SW + normal(i,:)'*c(i,:);
%     SE = SE + normal(i,:)'*normal(i,:);
%     %b = b + dot([c(i,1);c(i,2);c(i,3);normal(i,1);normal(i,2);normal(i,3)] .* (src(i,:) - des(mapping(i),:)),normal(i,:));
%     b = b - dot((src(i,:)-des(mapping(i),:)),normal(i,:))*[c(i,1);c(i,2);c(i,3);normal(i,1);normal(i,2);normal(i,3)];
%     %b = -b;
% end
% C = [NW,NE;SW,SE];
% x = C\b;
% R = [1,-x(3),x(2);x(3),1,-x(1);-x(2),x(1),1];
% t = x(4:6);


mapping = mapping(1:v);
n = normal;
s = src(1:v,1:3);
d = des(mapping,:);
n = normal(1:v,1:3);
c = cross(s,n);
cx = c(1:v,1:1);
cy = c(1:v,2:2);
cz = c(1:v,3:3);
nx = n(1:v,1:1);
ny = n(1:v,2:2);
nz = n(1:v,3:3);



C = [sum(cx .* cx) sum(cx.*cy) sum(cx.*cz) sum(cx .* nx) sum(cx.*ny) sum(cx.*nz);...
    sum(cy .* cx) sum(cy.*cy) sum(cy.*cz) sum(cy .* nx) sum(cy.*ny) sum(cy.*nz);...
    sum(cz .* cx) sum(cz.*cy) sum(cz.*cz) sum(cz .* nx) sum(cz.*ny) sum(cz.*nz);...
    sum(nx .* cx) sum(nx.*cy) sum(nx.*cz) sum(nx .* nx) sum(nx.*ny) sum(nx.*nz);...
    sum(ny .* cx) sum(ny.*cy) sum(ny.*cz) sum(ny .* nx) sum(ny.*ny) sum(ny.*nz);...
    sum(nz .* cx) sum(nz.*cy) sum(nz.*cz) sum(nz .* nx) sum(nz.*ny) sum(nz.*nz)]; 


b = [-sum(dot(cx.*(s-d),n,2));...
    -sum(dot(cy.*(s-d),n,2));...
    -sum(dot(cz.*(s-d),n,2));...
    -sum(dot(nx.*(s-d),n,2));...
    -sum(dot(ny.*(s-d),n,2));...
    -sum(dot(nz.*(s-d),n,2))]; 


x = C\b;
R = [1,-x(3),x(2);x(3),1,-x(1);-x(2),x(1),1];
t = x(4:6);




end

