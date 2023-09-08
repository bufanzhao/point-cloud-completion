function [data_out]=refine_buliao3(datas)

data=datas;
num=unique(data(:,7));
% a=[1;4];
% b=[3.2;4];
% c=[6;5];
for i=1:size(num,1)
    idx=(data(:,7)==num(i));
    num_sum=sum(idx);
    if num_sum<10
       data(idx,:)=[]; 
    end
end

% num2=unique(data(:,7));
% 
% T=clusterdata(num2,1);
% julei=[num2 T];
% 
% ceng=unique(T);

points=pointCloud(data(:,1:3));
minDistance = 0.5;
[labels,numClusters] = pcsegdist(points,minDistance);
pt=data;
k=1;
 for j=1:numClusters
      if size(pt(labels(:,1)==j,:),1)>5
        cluster_data{k} = pt(labels(:,1)==j,:);
        k=k+1;
      end
 end
 
 
 
 
for i=1:size(cluster_data,2)
   
   points=cluster_data{i};
   n1=size(unique(points(:,1)),1);
   n2=size(unique(points(:,2)),1);
   n3=size(unique(points(:,3)),1);
   if n1>1&&n2>1&&n3>=1
   [bestplane] = RANSAC_para_once(points);

%    planeData=points;
%  
% % 协方差矩阵的SVD变换中，最小奇异值对应的奇异向量就是平面的方向
%    xyz0=mean(planeData,1);
%    centeredPlane=bsxfun(@minus,planeData,xyz0);
%    [U,S,V]=svd(centeredPlane);
%  
%    a=V(1,3);
%    b=V(2,3);
%    c=V(3,3);
%    d=-dot([a b c],xyz0);
%    bestplane=[a b c d];
%    
   

   [p{i}]=VerticalFootCoordinates(bestplane,points);
  % [p{i}]=chuizu(points,a,b,c,bestplane);
   end
end
data_out=p{1};

for i=2:size(p,2)
   data_out=[data_out;p{i}]; 
end
zaosheng=unifrnd(-0.05,0.05,size(data_out,1),1);
data_out=[data_out(:,1)+zaosheng data_out(:,2)+zaosheng data_out(:,3)+zaosheng];
end