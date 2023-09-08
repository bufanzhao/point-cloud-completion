function [ data_out,RR2]=direction_nor(datas)
%qiu dan ge chao ti su de normal

 
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
   
       if size(data1{i,j},1)>50
          
           data_out=[data_out data1{i,j}'];
           
       end
        
    end
end
datas1=data_out(:,2:size(data_out,2))';
 
data=[datas1(:,1:2) repmat(0,size(datas1,1),1)];
%     [m,~]=size(data);
%      P=data(:,1:3);
%      center=sum(P,1)/m;
%      P = P-ones(m,1)*(sum(P,1)/m);
%      C = P.'*P./(m-1);
%      
%      [V, D] = eig(C);
  xmax=max(data(:,1));
  xmin=min(data(:,1));
  ymax=max(data(:,2));
  ymin=min(data(:,2));
  p1=[xmax ymin 0];
  p2=[xmax ymax 0];
  p3=[xmin ymin 0];
  p4=[xmin ymax 0];

  kuan=norm(p1-p2);
  chang=norm(p2-p4);

  tiji_min=kuan*chang;
  RR2=1;
  RR1=1;
   for i=0:1:360  
   xx=sin(i);
   yy=cos(i);
   vector=[xx yy 0];
  [R1]=xuanzhuanjuzhen2(vector,[1,0,0]);
  [R2]=xuanzhuanjuzhen2([1,0,0],vector);
  data1=data*R1;
  xmax=max(data1(:,1));
  xmin=min(data1(:,1));
  ymax=max(data1(:,2));
  ymin=min(data1(:,2));
  p1=[xmax ymin 0];
  p2=[xmax ymax 0];
  p3=[xmin ymin 0];
  p4=[xmin ymax 0];
  p5=[p1;p2;p3;p4];
 kuan=norm(p1-p2);
  chang=norm(p2-p4);
  tiji=kuan*chang;
  if tiji<tiji_min
     RR1=R1;
     RR2=R2;
     tiji_min=tiji;
  end

   end
   data2=data*RR1;
   data_out=datas*RR1;
%   v2=V(:,2)'*R1;
%   [R2]=xuanzhuanjuzhen2(v2,xyz(:,2)');
%   R=R1*R2;
%   data1=data(:,1:3)*R1*R2;
%   data2=data(:,1:3)*R;
%   R3=R;
%   R3(1,3)=-R(1,3);
%   R3(2,3)=-R(2,3);
%   R3(3,1)=-R(3,1);
%   R3(3,2)=-R(3,2);
%   data3=data2*R3;
end
