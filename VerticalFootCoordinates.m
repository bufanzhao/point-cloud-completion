function [VerticalFoot] = VerticalFootCoordinates(PlanePara,PointInput)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%  ���룺PlanePara ƽ�����1*4[a b c d]  ax+by+cz+d=0��PointInputƽ����ĵ�1*3[x,y,z]
%  �����VerticalFoot  ����ƽ���ϵĴ�������[x0,y0,z0]

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

