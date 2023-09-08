function [data_out]=fantan(datas,high)

points=datas(:,1:3);
value=datas(:,4);
XYZ=[datas(:,5) datas(:,6:7)];
maxz=max(XYZ(:,3));
zmax=max(points(:,3));
for i=1:size(XYZ,1)
    x(i)=XYZ(i,1);
    y(i)=XYZ(i,2);
    z(i)=XYZ(i,3);
    v(i)=value(i,1);
    idx_p(i)=i;
end
m=max(XYZ(:,1));
n=max(XYZ(:,2));
graph=full(sparse(x',y',z',m,n));
graph_v=full(sparse(x',y',v',m,n));
graph_idx=full(sparse(x',y',idx_p',m,n));
for i=1:m
    for j=1:n
        p5=[];
        if graph_v(i,j)==1
           pp(graph_idx(i,j),:)=[1 1 1 1 1 1 1 1 1]; 
        else
        vector_x=full(graph_v(i,:));
        vector_zx=full(graph(i,:));
        p_x=j;
        vector_y=full(graph_v(:,j));
        vector_zy=full(graph(:,j));
        p_y=i;
        [px1,px2,zx1,zx2]=find_pp(vector_x,vector_zx,p_x,maxz);
        [py1,py2,zy1,zy2]=find_pp(vector_y',vector_zy',p_y,maxz);
     %2和3
      %  if (px1~=0&&px2~=0&&py1~=0&&py2~=0)||(px1~=0&&px2==0&&py1~=0&&py2~=0)||(px1==0&&px2~=0&&py1~=0&&py2~=0)||(px1~=0&&px2~=0&&py1==0&&py2~=0)||(px1~=0&&px2~=0&&py1~=0&&py2==0)||(px1==0&&px2~=0&&py1~=0&&py2==0)||(px1==0&&px2~=0&&py1==0&&py2~=0)||(px1~=0&&px2==0&&py1~=0&&py2==0)||(px1~=0&&px2==0&&py1==0&&py2~=0)
    %2
       if (px1~=0&&px2~=0&&py1~=0&&py2~=0)||(px1~=0&&px2==0&&py1~=0&&py2~=0)||(px1==0&&px2~=0&&py1~=0&&py2~=0)||(px1~=0&&px2~=0&&py1==0&&py2~=0)||(px1~=0&&px2~=0&&py1~=0&&py2==0)

        %if px1+px2+py1+py2>5
            p5=1;
        else
            p5=0;
        end
        pp(graph_idx(i,j),:)=[px1 px2 py1 py2 p5 zx1 zx2 zy1 zy2];
        end
       % clear px1 px2 py1 py2 p5 zx1 zx2 zy1 zy2
    end
end
out=[points value XYZ pp];
idx=(out(:,4)==0);
idx2=(out(idx,12)==1);
out2=out(idx,:);
out3=out2(idx2,:);

p1=out3(:,13);
p2=out3(:,14);
p3=out3(:,15);
p4=out3(:,16);
for i=1:size(out3,1)

 pp1=sort([p1(i) p2(i)]);
 pp2=sort([p3(i) p4(i)]);
 ppp1=sort([pp1(1) pp2(1)]);
 ppp2=sort([pp1(2) pp2(2)]);
 %pp=sort([p1(i) p2(i) p3(i) p4(i)]);
 if ppp1(2)>ppp2(1)
   pp=[ppp2(1) ppp1(2) ppp1(2) ppp2(2) ppp1(1)];
  % pp=[ppp1(1) ppp1(2) ppp1(2) ppp2(2) ppp1(1)];
 else
   pp=[ppp1(2) ppp1(2) ppp2(1) ppp2(2) ppp1(1)];  
   % pp=[ppp1(1) ppp1(2) ppp2(1) ppp2(2) ppp1(1)];  
 end

 fin_z(i)=pp(1);
end
 data_out=[out3(:,1:2) high(fin_z')' out3(:,4:6) fin_z'];

end