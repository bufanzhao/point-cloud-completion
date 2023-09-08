function [buliao_out,data_out,high,data_out3]=buliaomoni(datas,kk,normal_pts,juli,zhengping)

if kk~=1
normal2=normal_pts;
  if normal2.*[0 0 1]==0
  [R]=xuanzhuanjuzhen2(normal2,[0 0 1]);
  [R2]=xuanzhuanjuzhen2([0 0 1],normal2);
  else
    R=1;
    R2=1;
  end
%[R]=xuanzhuan([0,0,1],normal2);
  center=mean(datas(:,1:3),1);
  data=datas(:,1:3)-center;
  data=data*R;
else
    data=datas;
end

% [ datasss,RR]=direction_nor(datass);
% [data,RR2]=direction_tiji(datasss);
data_zhi=[data(:,1:3)];
[data_out,xmin,xmax,ymin,ymax,zmax]=quedingbianjie(data_zhi,20);

%xy=data(:,1:2);
% xmin=min(xy(:,1));
% xmax=max(xy(:,1));
% ymin=min(xy(:,2));
% ymax=max(xy(:,2));
% zmax=max(data(:,3));
% zmin=min(data(:,3));
k=1;
xi=1;
[idx,dis] = knnsearch(data(:,1:3),data(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',3); %计算点云中每个点的最优k近邻点的索引
d=mean(dis(:,2));
d=d*1;
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
for i=zmax-juli:0.1:zmax

  [buliao]=down_buliao(data,buliao,d*2,1,0.1);
  high(kkk)=zmax-(kkk-1)*0.1;
  kkk=kkk+1;
end
high(kkk)=zmax-(kkk-1)*0.1;
[buliao]=quzao(buliao);
buliao_out=buliao;
buliao_out = [buliao_out(:,1:3) buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)]; 

[data_out]=fantan(buliao_out,high);
data_out123=data_out;
minhigh=min(high);
data_zhi_3D=data_zhi(data_zhi(:,3)>minhigh,:);
%data_zhi_2D=data_zhi_3D(:,1:2);
[polyin]=wanggehua(data_zhi_3D);
plot(polyin);
%[data]=save_data(data_zhi_3D,'C:\Users\ZBF\Desktop\','datas_new2.txt');

data_out2=[data_out(:,1:3)];
data_out2_2D=data_out2(:,1:2);
TFin = isinterior(polyin,data_out2_2D(:,1),data_out2_2D(:,2));
%data_out2=data_out2(TFin,:);
%data_out=data_out(TFin,:);

if zhengping==1&&size(data_out,1)>50
[data_out2]=refine_buliao3(data_out(TFin,:));
else
data_out2=data_out2(TFin,:);
end
%  buliao_out=buliao(buliao(:,4)==1,:);
buliao_out=buliao;

% [data]=save_data(data_zhi_3D,'C:\Users\ZBF\Desktop\','datas_new.txt');
% [data]=save_data(buliao_out(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out.txt');
% [data]=save_data(data_out2,'C:\Users\ZBF\Desktop\','data_out2.txt');

 if kk~=1
%      if normal2.*[0 0 1]==0
%      [R2]=xuanzhuanjuzhen2([0 0 1],normal2);
%      else
%          R2=1;
%      end
  %  buliao_out=[buliao_out(:,1:3)*RR2*RR*R2 buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)];
  %  data_out3=[data_out2*RR2*RR*R2];
     buliao_out=[buliao_out(:,1:3)*R2 buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)];
     data_out3=[data_out2*R2+center];
 else
     buliao_out = [buliao_out(:,1:3)*RR2*RR buliao_out(:,4) buliao_out(:,6:7) buliao_out(:,5)];
     data_out3=data_out2*RR2*RR;
      
 end
 
 
%buliao_out=[buliao_out(:,1) buliao_out(:,2) buliao_out(:,3) buliao_out(:,4:6)];
buliao_out=[data_out3];
%[data_out]=refine_buliao2(data_out3);
%[buliao_out]=refine_buliao(buliao_out);

end