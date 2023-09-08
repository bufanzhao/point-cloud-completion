function [modelInliers]=ransac_line2(points)
for j=1:10
plot(points(:,1),points(:,2),'o');
hold on
modelLeastSquares = polyfit(points(:,1),points(:,2),1);
x = [min(points(:,1)) max(points(:,1))];
y = modelLeastSquares(1)*x + modelLeastSquares(2);
plot(x,y,'r-')
evalLineFcn = ...   % distance evaluation function
  @(model, points) sum((points(:, 2) - polyval(model, points(:,1))).^2,2);
fitLineFcn = @(points) polyfit(points(:,1),points(:,2),1); % fit function using polyfit
[modelRANSAC, inlierIdx] = ransac(points,fitLineFcn,evalLineFcn, ...
  2,1);
modelInliers = polyfit(points(inlierIdx,1),points(inlierIdx,2),1);
inlierPts = points(inlierIdx,:);

kk=1;
kkk=1;
for i=1:size(inlierIdx,1)
    if inlierIdx(i)
        inliers(kkk,:) = points(i,:);
        kkk=kkk+1;
   %     plot(data(i,1),data(i,2),'+');
    else
       outliers(kk,:)=points(i,:);
       kk=kk+1;
    end
end
points=outliers;


x = [min(inlierPts(:,1)) max(inlierPts(:,1))];
y = modelInliers(1)*x + modelInliers(2);
plot(x, y, 'g-')
legend('Noisy points','Least squares fit','Robust fit');
hold off
end

end