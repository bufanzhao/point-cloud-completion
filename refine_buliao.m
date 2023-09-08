function [data_out]=refine_buliao(datas)

data=datas;
num=unique(data(:,6));
% a=[1;4];
% b=[3.2;4];
% c=[6;5];
for i=1:size(num,1)
    idx=(data(:,6)==num(i));
    num_sum=sum(idx);
    if num_sum<10
       data(idx,:)=[]; 
    end
end

num2=unique(data(:,6));

T=clusterdata(num2,1);
julei=[num2 T];

ceng=unique(T);
for i=1:size(ceng,1)
   idxT=(julei(:,2)==ceng(i));
   num3=num2(idxT,1);
   points=[0;0;0];
   for j=1:size(num3,1)
       idx=(data(:,6)==num3(j));
       point1=data(idx,1:3);
       points=[points point1'];
   end
   points=points';
   points=points(2:size(points,1),:);
   [bestplane] = RANSAC_para_once(points);
  % a(3)=a(1)*bestplane(1)+bestplane(2)*a(2)+bestplane(4);
  % b(3)=b(1)*bestplane(1)+bestplane(2)*b(2)+bestplane(4);
  % c(3)=c(1)*bestplane(1)+bestplane(2)*c(2)+bestplane(4);
   [p{i}]=VerticalFootCoordinates(bestplane,points)
  % [p{i}]=chuizu(points,a,b,c,bestplane);
   
end
data_out=p{1};
for i=2:size(p,2)
   data_out=[data_out;p{i}]; 
end

end