%% CMSC 426: Project 5 Helper Code
% Written by: Nitin J. Sanket (nitinsan@terpmail.umd.edu)
% PhD in CS Student at University of Maryland, College Park
% Acknowledgements: Bhoram Lee of University of Pennsylvania for help with depthToCloud function

clc
% clear all
close all

%% Setup Paths and Read RGB and Depth Images
Path = 'Data/MultipleObjects/'; 
SceneNum = 50;
SceneName = sprintf('%0.3d', SceneNum);
FrameNum = num2str(1);

I = imread([Path,'scene_',SceneName,'/frames/frame_',FrameNum,'_rgb.png']);
ID = imread([Path,'scene_',SceneName,'/frames/frame_',FrameNum,'_depth.png']);

%% Extract 3D Point cloud
% Inputs:
% ID - the depth image
% I - the RGB image
% calib_file - calibration data path (.mat) 
%              ex) './param/calib_xtion.mat'
%              
% Outputs:
% pcx, pcy, pcz    - point cloud (valid points only, in RGB camera coordinate frame)
% r,g,b            - color of {pcx, pcy, pcz}
% D_               - registered z image (NaN for invalid pixel) 
% X,Y              - registered x and y image (NaN for invalid pixel)
% validInd	   - indices of pixels that are not NaN or zero
% NOTE:
% - pcz equals to D_(validInd)
% - pcx equals to X(validInd)
% - pcy equals to Y(validInd)

% PTSClouds = {};
%%
% for p=1:0
% FrameNum = num2str(p);

% I = imread([Path,'scene_',SceneName,'/frames/image_',FrameNum,'_rgb.png']);
% ID = imread([Path,'scene_',SceneName,'/frames/image_',FrameNum,'_depth.png']);

[pcx, pcy, pcz, r, g, b, D_, X, Y,validInd] = depthToCloud_full_RGB(ID, I, './params/calib_xtion.mat');
Pts = [pcx pcy pcz];
% 
% %% Background and noise removal
% % Get ROI by finding pixels a certain radius 
% % from the center of the image
% 
% 
% BPS = RANSAC(Pts,2);
% %%
% newPts = Pts;
% for i=1:numel(BPS)
% pcData = BPS{i};
% newPts(ismember(Pts, pcData,'rows'),:) = NaN;
% end
% 
% %%
% % clean up
% center = mean(Pts);
% [ROI, nonROI] = getROI(center, Pts);  
% newPts(ismember(newPts, nonROI,'rows'),:) = NaN;
% %%
% Pc = pointCloud(newPts, 'Color', [r g b]/255);
% PTSClouds{p} = Pc;
% 
% fprintf('Iteration: %u\n', p);
% end
% 
% %% ICP
% 
% [R] = ICP(r,g,b);
% size(indices)
% 


%% Display Images and 3D Points
% Note this needs the computer vision toolbox.
figure,
subplot 121
imshow(I);
title('RGB Input Image');
subplot 122
imagesc(ID);PTSClouds = {};
title('Depth Input Image');
%%
figure,
pcshow(Pts,[r g b]/255);
drawnow;
title('3D Point Cloud');
%% Testing area


