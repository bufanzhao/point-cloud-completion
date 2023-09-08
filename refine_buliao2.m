function [data_out]=refine_buliao2(datas)
datass=pointCloud(datas);
data_pc=pcdenoise(datass,'NumNeighbors',10,'Threshold',0.2);
data=data_pc.Location;

Y=pdist(data,'euclidean');
Z = linkage(Y);
T = cluster(Z, 'cutoff', 1.15);


data_p=[data T];
n=max(T);
for i=1:max(T)
    
    idx=(data_p(:,4)==i);
    points=data_p(idx,1:3);
    if size(points,1)>3
    %   [bestplane] = RANSAC_para(points);
       ptCloud=pointCloud(points);
       normals = pcnormals(ptCloud);
       center=mean(points);
       bestplane=mean(normals);
       d=center*bestplane';
       bestplane=[bestplane d];
       [p{i}]=VerticalFootCoordinates(bestplane,points);
    end
end
data_out=p{1};
for i=2:size(p,2)
   data_out=[data_out;p{i}]; 
end

end