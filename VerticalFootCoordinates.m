function [VerticalFoot] = VerticalFootCoordinates(PlanePara,PointInput)
%UNTITLED 此处显示有关此函数的摘要
%  输入：PlanePara 平面参数1*4[a b c d]  ax+by+cz+d=0，PointInput平面外的点1*3[x,y,z]
%  输出：VerticalFoot  点在平面上的垂足坐标[x0,y0,z0]

a=PlanePara(1);b=PlanePara(2);c=PlanePara(3);d=PlanePara(4);
if a==0
   a=0.001; 
end
if b==0
   b=0.001; 
end
if c==0
   c=0.001; 
end
for i=1:size(PointInput,1)
x=PointInput(i,1);y=PointInput(i,2);z=PointInput(i,3);

A=[ a b c
    b -a 0
    c 0 -a];
Y=-[d
    -b*x+a*y
    -c*x+a*z
    ];
VerticalFoot(i,:)=(A'*A)\A'*Y;
end

end

