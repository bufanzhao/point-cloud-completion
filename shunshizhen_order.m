function [order]=shunshizhen_order(jiaodian)
points2=jiaodian;
% [~,para] = RANSAC_para(points);
% [R]=xuanzhuanjuzhen2(para(1:3),[0 0 1]);
% points2=points*R;
xy=points2(:,1:2);
%center=mean(xy,1);
mmx=max(xy(:,1));
mnx=min(xy(:,1));
mmy=max(xy(:,2));
mny=min(xy(:,2));
xy2=[mmx mmy;mnx mmy;mmx mny;mnx mny];
center=mean(xy2,1);


b=[0 1];
for i=1:size(points2,1)
a=[points2(i,1)-center(1) points2(i,2)-center(2)];
angle1=subspace(b',a')*180/pi;
if a(1)>=0&&a(2)>=0
    angle(i)=angle1;
end
if a(1)>0&&a(2)<0
    angle(i)=180-angle1;
end
if a(1)<0&&a(2)<0
    angle(i)=angle1+180;
end
if a(1)<0&&a(2)>0
    angle(i)=360-angle1;
end
%angle(i)=subspace(a',b')*180/pi;
%angle(i)=atan(b*a'/sqrt(sum(a.^2))/sqrt(sum(b.^2)))/pi*180;
end
[~, order] = sort(angle);
% edges=[0 0];
% for i=1:size(order,2)
%     if i==size(order,2)
%        edges=[edges;order(i) order(1)]; 
%     else
%        edges=[edges;order(i) order(i+1)];
%     end
% end
% edges=edges(2:size(edges,1),:);
% [data_out]=add_edge([0 0 0 0 0],points,edges);
% data_out=data_out(2:size(data_out,1),:);
end