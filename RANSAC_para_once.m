function [bestplane] = RANSAC_para_once(data_in)
%UNTITLED2 此处显示有关此函数的摘要 [ PlaneClsut ] = sq_RANSAC(data_in)
%   此处显示详细说明
% data2=data_in;
% num=size(data2,1);
% o=1;
% for m=1:1:10
% [data1,indx]=opt(data2,50);
% data=data1(:,1:3)';
tic;
%data2=sortrows(data_in,-4);
%  hold on
% scatter3(data_in(:,1),data_in(:,2),data_in(:,3));

data=data_in(:,1:3);
iter = 5000; 
%dc=data_in(:,5);
%  bestParameter1=0; bestParameter2=0; bestParameter3=0; % 最佳匹配的参数

    %符合拟合模型的数据的个数
%number=floor(number);

    
    number = size(data,1); % 总点数

    data=data';
    pretotal=0; 
    sigma =0.02;
for i=1:iter
%%% 随机选择三个点
     idx= randperm(number,3); 
     sample = data(:,idx);
     %%%拟合平面方程 z=ax+by+c 
     plane = zeros(1,4);
     x = sample(1, :);
     y =sample(2, :);
     z = sample(3, :);
     a = ((z(1)-z(2))*(y(1)-y(3)) - (z(1)-z(3))*(y(1)-y(2)))/((x(1)-x(2))*(y(1)-y(3)) - (x(1)-x(3))*(y(1)-y(2)));
     b = ((z(1) - z(3)) - a * (x(1) - x(3)))/(y(1)-y(3));
     c = z(1) - a * x(1) - b * y(1);
    
     plane = [a b -1 c];
     mask=abs(plane*[data; ones(1,size(data,2))])/sqrt(plane(1)^2+plane(2)^2+plane(3)^2);    %求每个数据到拟合平面的距离
    
     total=sum(mask<sigma);              %计算数据距离平面小于一定阈值的数据的个数
     
     if total>pretotal            %找到符合拟合平面数据最多的拟合平面
         pretotal=total;
         bestplane=plane;          %找到最好的拟合平面
     end  
      %mask123=abs(plane*[data; ones(1,size(data,2))])/sqrt(plane(1)^2+plane(2)^2+plane(3)^2)<sigma;
    

 end
% mask2=abs(bestplane*[data; ones(1,size(data,2))])/sqrt(bestplane(1)^2+bestplane(2)^2+bestplane(3)^2);
%  mask=abs(bestplane*[data; ones(1,size(data,2))])/sqrt(bestplane(1)^2+bestplane(2)^2+bestplane(3)^2)<1;
%  para=[para;bestplane(1:3)];
%  data=data';
%  datain{j}=data(mask,:);
%  data=data(~mask,:);

% scatter3(datain(:,1),datain(:,2),datain(:,3));
% axis equal
 
 
 



%  k = 1;
% s=1;
% dmax=0;
% for i=1:length(mask)
%     if mask(i)
%         inliers(1,k) = data(1,i);
%         inliers(2,k) = data(2,i);
%         inliers(3,k) = data(3,i);
%         inliers(4,k) = dc(i);
%         k = k+1;
%     end
% %     if mask(i)==0
% %         outliers(1,s) = data(1,i);
% %         outliers(2,s) = data(2,i);
% %         outliers(3,s) = data(3,i);
% %         s=s+1;
%     end



%   data2=size(outliers,2);
%    data2=outliers';

% %    PlaneClsutPoint(o)=inliers;

 %绘制最佳匹配平面
%  bestParameter1 = num2str(bestplane(1));
%  bestParameter2 = num2str(bestplane(2));
%  bestParameter3 = num2str(bestplane(4));
%  PlaneClsut(o,:)=bestplane;
%  o=o+1;
%  num=size(data2,1);
%  if num<3000
%      break;
%  end
toc;
end



