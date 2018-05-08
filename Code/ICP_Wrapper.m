function [P, r3, b3 ,g3] = ICP_Wrapper(Points)


% for Scene = 1: length(Scene)
    % for Scene = 1:1
    P = []; Q = []; r3 = []; g3 = []; b3 = [];
    % for Scene = 1:1
    disp('------------------------------------------------------------------------------------')
%     disp(['Starting Scene ', num2str(Scene)]);
    for i = 2:length(Points)
        %     for i = 2:16
        disp(['Starting ICP for frame ', num2str(i)]);
        
        Pts2 = Points{i};
        
        if i ~= 1
            Pts1 = Points{i-1};
        else
            Pts1 = Points{i};
        end
        
        if (isempty(Pts2) || isempty(Pts1))
            continue;
        end
        
        %         ICP algorithm
        [R, T] = ICP_Point2Plane(Pts1, Pts2);
        
        M = T*R;
%         size(M)
%         size(Pts2)
%         size(ones(length(Pts2),1))
        Pts = M'*[Pts2 ones(size(Pts2,1),1)]';
        
        Pts = Pts./Pts(4,:);
        Pts = Pts(1:3,:);
        P = [P; Pts1; Pts'];
        r3 = [r3; Points{i-1,2}(:,1); Points{i,2}(:,1)];
        g3 = [g3; Points{i-1,2}(:,2); Points{i,2}(:,2)];
        b3 = [b3; Points{i-1,2}(:,3); Points{i,2}(:,3)];
    end    
    size(P)
    indices=1:50000;
    figure, pcshow(P(indices,:),[r3(indices) g3(indices) b3(indices)]), drawnow, title('3D Point Cloud After ICP');
end

% end