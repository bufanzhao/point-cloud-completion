function [data_out3]=buliaomoni_bulou(datas,kk,normal2)
%
if kk~=1
%normal2=[0 0 -1];
%[R]=xuanzhuan([0,0,1],normal2);
[R]=xuanzhuanjuzhen2(normal2,[0 0 1]);
datass=datas*R;
else
    datass=datas;
end
%data=datass;
%[data,RR]=direction_nor(datass);
 %[data,RR2]=direction_tiji(datasss);
 RR=1;
 data=datass;
 xy=data(:,1:2);
 xmin=min(xy(:,1));
 xmax=max(xy(:,1));
 ymin=min(xy(:,2));
 ymax=max(xy(:,2));
 zmax=max(data(:,3));
 zmin=min(data(:,3));
k=1;
xi=1;
[idx,dis] = knnsearch(data(:,1:3),data(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',3); %计算点云中每个点的最优k近邻点的索引
d=mean(dis(:,2));
for i=xmin:d:xmax
    yi=1;
    for j=ymin:d:ymax
        plane(k,:)=[i j xi yi];
        yi=yi+1;
        k=k+1;
    end
    xi=xi+1;
end

buliao=[plane(:,1:2) repmat(zmax,size(plane,1),1) repmat(0,size(plane,1),1) repmat(1,size(plane,1),1) plane(:,3:4)];
kkk=1;
for i=zmax-5:0.1:zmax

  [buliao]=down_buliao(data,buliao,d,2,0.2);
  high(kkk)=zmax-(kkk-1)*0.1;
  kkk=kkk+1;
end
[buliao]=quzao(buliao);
buliao_out=buliao;
%buliao_out = [buliao_out(:,1:3) buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)]; 
buliao_out=buliao_out(buliao_out(:,4)==1,:);
%[data_out]=fantan(buliao_out,high);
data_out2=[buliao_out(:,1:3)];
%  buliao_out=buliao(buliao(:,4)==1,:);
%buliao_out=buliao;



 if kk~=1
 %[R2]=xuanzhuan(normal2,[0,0,1]);
 [R2]=xuanzhuanjuzhen2([0 0 1],normal2);
 buliao_out=[buliao_out(:,1:3)*RR*R2 buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)];
 data_out3=[data_out2*RR*R2];
 else
    buliao_out = [buliao_out(:,1:3)*RR buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)];
    data_out3=data_out2*RR;
 end
 
 
%buliao_out=[buliao_out(:,1) buliao_out(:,2) buliao_out(:,3) buliao_out(:,4:6)];
buliao_out=[data_out3 buliao_out(:,5:7)];
%[buliao_out]=refine_buliao(buliao_out);


end