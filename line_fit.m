function [para]=line_fit(data)
points=data;

maxx=max(points(:,1));
maxy=max(points(:,2));
minx=min(points(:,1));
miny=min(points(:,2));
p1=[maxx maxy];
p2=[maxx miny];
p3=[minx maxy];
p4=[minx miny];

point1 = p1;
point2 = p2;
k1=(point1(2)-point2(2))/((point1(1)-point2(1))+0.1);      %直线斜率

b1 = point1(2) - k1*point1(1);
line1 = [k1 -1 b1];
point1 = p3;
point2 = p4;
k2=(point1(2)-point2(2))/((point1(1)-point2(1))+0.1);      %直线斜率

b2 = point1(2) - k2*point1(1);
line2 = [k2 -1 b2];
point1 = p1;
point2 = p3;
k3=(point1(2)-point2(2))/((point1(1)-point2(1))+0.1);      %直线斜率
b3 = point1(2) - k3*point1(1);
line3 = [k3 -1 b3];
point1 = p2;
point2 = p4;
k4=(point1(2)-point2(2))/((point1(1)-point2(1))+0.1);      %直线斜率
b4 = point1(2) - k4*point1(1);
line4 = [k4 -1 b4];

para=[line1;line2;line3;line4];
% hold on; plot(pp1(:,1),polyval(line1,pp1(:,1)),'k');
% for i=1:size(data,1)
%     Q1=line1(1,:);
%     Q2=line1(2,:);
%     Q3=line2(1,:);
%     Q4=line2(2,:);
%     d1(i) = abs(det([Q2-Q1;data(i,:)-Q1]))/norm(Q2-Q1);
%     d2(i) = abs(det([Q4-Q3;data(i,:)-Q3]))/norm(Q4-Q3);
% end
% d1=sort(d1);
% d2=sort(d2);

end