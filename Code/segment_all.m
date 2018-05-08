%% single objects
% pts_sc_000 = get_points_000(0, 390, 1);
% pts_sc_001 = get_points_001(0, 35, 1);
% pts_sc_002 = get_points_002(0, 376, 10);
% pts_sc_006 = get_points_006(0, 414, 1);
% pts_sc_008 = get_points_008(0, 460, 1);
% pts_sc_012 = get_points_012(0, 373, 10);
% pts_sc_022 = get_points_022(0, 373, 1);
% model=make_model(pts_sc_023,100);
% pp = get_points_023(0, 385, 10);
%% multiple objects scene
% pts_sc_025 = get_multObj_025(0, 558, 10);
% pts_sc_035 =  get_multObj_035(0, 468, 10);
% pts_sc_040 = get_multObj_040(0, 528, 10);
% pts_sc_044 = get_multObj_044(0, 556, 10);
% pts_sc_050 = get_multObj_050(0, 483, 5);

% pp=pts_sc_050;
% pp=pp(~cellfun('isempty',pp(:,1)),:);
% [P,r,g,b]=make_model(pp);
indices=1:100000;
model_050=pointCloud(P(indices,:),'Color',[r(indices),g(indices),b(indices)]);
figure;pcshow(model_050);
