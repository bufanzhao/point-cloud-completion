function [data_out,T2,RR2]=tiaozheng_zitai3(data)

[ data,T2]=direction_nor(data);

xmax=max(data(:,1));
xmin=min(data(:,1));
ymax=max(data(:,2));
ymin=min(data(:,2));
zmax=max(data(:,3));
zmin=min(data(:,3));

p1=[xmax ymax zmax];
p2=[xmax ymax zmin];
p3=[xmax ymin zmax];
p4=[xmax ymin zmin];
p5=[xmin ymax zmax];
p6=[xmin ymin zmax];
p7=[xmin ymin zmin];
p8=[xmin ymax zmin];

chang=norm(p1-p3);
kuan=norm(p1-p5);
gao=norm(p1-p2);
tiji_min=chang*kuan*gao;
RR2=1;
RR1=1;

for i=1:1000
    
    x=(rand*2-1)*0.5;
    y=(rand*2-1)*0.5;
    z=1;
    vector=[x,y,z];
   [R1]=xuanzhuanjuzhen2(vector,[0,0,1]);
   [R2]=xuanzhuanjuzhen2([0,0,1],vector);
   data1=data*R1;
   xmax=max(data1(:,1));
   xmin=min(data1(:,1));
   ymax=max(data1(:,2));
   ymin=min(data1(:,2));
   zmax=max(data1(:,3));
   zmin=min(data1(:,3));

   p1=[xmax ymax zmax];
   p2=[xmax ymax zmin];
   p3=[xmax ymin zmax];
   p4=[xmax ymin zmin];
   p5=[xmin ymax zmax];
   p6=[xmin ymin zmax];
   p7=[xmin ymin zmin];
   p8=[xmin ymax zmin];

   chang=norm(p1-p3);
   kuan=norm(p1-p5);
   gao=norm(p1-p2);
   tiji=chang*kuan*gao;

if tiji<tiji_min
     RR1=R1;
     RR2=R2;
     tiji_min=tiji;
 end
   
end

data_out=data*RR1;


end