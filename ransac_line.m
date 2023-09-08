function [para]=ransac_line(data)
%data=data-mean(data,1);

for j=1:10
%%%二维直线拟合
%%%生成随机数据
%data=data';
iter = 10000; 
 %%% 绘制数据点
 number = size(data,1); % 总点数
 bestParameter1=0; bestParameter2=0; % 最佳匹配的参数
 sigma = 0.2;
 pretotal=0;     %符合拟合模型的数据的个数
 
%  close all;
 %plot(data(:,1),data(:,2),'.');axis equal;
 %hold on;
 for i=1:iter
 %%% 随机选择两个点
     idx = randperm(number,2); 
     sample = data(idx,:); 

     %%%拟合直线方程 y=kx+b 
     line = zeros(1,3);
     point1 = sample(1, :);
     point2 = sample(2, :);

     k=(point1(2)-point2(2))/(point1(1)-point2(1));      %直线斜率
     b = point1(2) - k*point1(1);
     line = [k -1 b];
     
%      k=(x(1)-y(1))/(x(2)-y(2));      %直线斜率
%      b = k*x(2) - x(1);
%      line = [k -1 b];
     
     mask=abs(line*[data ones(size(data,1),1)]')/sqrt(k^2+1);    %求每个数据到拟合直线的距离
     total=sum(mask<sigma);              %计算数据距离直线小于一定阈值的数据的个数

     if total>pretotal            %找到符合拟合直线数据最多的拟合直线
         pretotal=total;
         bestline=line;          %找到最好的拟合直线
    end  
 end
 %显示符合最佳拟合的数据
 mask1=abs(bestline*[data ones(size(data,1),1)]')/sqrt(bestline(1)^2+1)<1;    

kk=1;
kkk=1;
% for i=1:length(mask)
%     if mask(i)
%         inliers(kkk,:) = data(i,:);
%         kkk=kkk+1;
%    %     plot(data(i,1),data(i,2),'+');
%     else
%        outliers(kk,:)=data(i,:);
%        kk=kk+1;
%     end
% end
inliers=data(mask1,:);
outliers=data(~mask1,:);
data=outliers;
% 
para(j,:)=bestline;

% %  %%% 绘制最佳匹配曲线
% if abs(bestline(1))<=1
%  bestParameter1 = -bestline(1)/bestline(2);
%  bestParameter2 = -bestline(3)/bestline(2);
%  xAxis = min(inliers(:,1)):max(inliers(:,1));
%  yAxis = bestParameter1*xAxis + bestParameter2;
%  plot(xAxis,yAxis,'r-','LineWidth',2);
%  title(['bestLine:  y =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2)]);axis equal;
% else
%  bestParameter1 = -bestline(1)/bestline(2);
%  bestParameter2 = -bestline(3)/bestline(2);
%  yAxis = min(inliers(:,2)):max(inliers(:,2));
%  xAxis = 1/bestParameter1*(yAxis-bestParameter2);
%  plot(xAxis,yAxis,'r-','LineWidth',2);
%  title(['bestLine:  y =  ',num2str(bestParameter1),'x + ',num2str(bestParameter2)]);axis equal;   
% end
if size(outliers,1)<10
   break; 
end
end

end