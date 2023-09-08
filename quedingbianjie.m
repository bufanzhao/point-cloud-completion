function [data_out,xmin,xmax,ymin,ymax,zmax]=quedingbianjie(datas,dd)

data=datas;

data_plane=[data(:,1:2) repmat(0,size(data,1),1)];
%[idx2,dis] = knnsearch(data_plane(:,1:3),data_plane(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',2);

%dd=mean(dis(:,2));
xy=data_plane(:,1:2);
xmm=max(xy(:,1));
xmn=min(xy(:,1));
ymm=max(xy(:,2));
ymn=min(xy(:,2));
for i=1:size(xy,1)
   
    ge(i,1)=ceil(abs(xy(i,1)-xmn)/0.5);
    ge(i,2)=ceil(abs(xy(i,2)-ymn)/0.5);
    
end

for i=1:max(ge(:,1))
    for j=1:max(ge(:,2))
   
        idxi=(ge(:,1)==i);
        idxj=(ge(:,2)==j);
        idxij=(idxi+idxj);
        data1{i,j}=data(idxij==2,1:3);
    end
end
    
%xy=data_plane((dis(:,2)<dd/10),:);
data_out=[0;0;0];
for i=1:size(data1,1)
    for j=1:size(data1,2)
   
       if size(data1{i,j},1)>dd
          
           data_out=[data_out data1{i,j}'];
           
       end
        
    end
end
data_out=data_out(:,2:size(data_out,2))';
xmin=min(data_out(:,1));
xmax=max(data_out(:,1));
ymin=min(data_out(:,2));
ymax=max(data_out(:,2));

data_z=data(:,3);
mmz=max(data_z);
mnz=min(data_z);

for i=1:size(data_z,1)
   
    gz(i)=ceil(abs(data_z(i)-mnz)/0.2);
    
end
gz=gz';
for i=1:max(gz)
   
    idxz=(gz(:,1)==i);
    dataz{i}=data(idxz,1:3);
end
data_outz=[0;0;0];
for i=1:size(dataz,2)
   if size(dataz{i},1)>100
      data_outz=[data_outz dataz{i}']; 
   end
end
data_outz=data_outz(:,2:size(data_outz,2))';

zmax=max(data_outz(:,3));
end