clear; clc;
i = imread('Data/SingleObject/scene_001/frames/image_0_rgb.png');
id = imread('Data/SingleObject/scene_001/frames/image_0_depth.png');

rec = [0, 0, 500, 400];
i = imcrop(i, rec);
id = imcrop(id, rec);
imshow(i);

%%
[pcx, pcy, pcz, r, g, b, D_, X, Y,validInd] = depthToCloud_full_RGB(id, i, 'params/calib_xtion.mat');
Pts = [pcx pcy pcz];
rgb = [r g b]/255;figure;
pcshow(Pts, rgb);

%%
[Pts, rgb] = removeLargestPlain(Pts, rgb, 15, 40);figure;
pcshow(Pts, rgb);

%%
[Pts, rgb] = removeLargestPlain(Pts, rgb, 15, 20);figure;
pcshow(Pts, rgb);

%%
[Pts, rgb] = outlier_rejection(Pts, rgb,250);figure;
pcshow(Pts, rgb);



