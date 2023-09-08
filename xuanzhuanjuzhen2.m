function [R]=xuanzhuanjuzhen2(normal1,normal2)
%��normal1ת��normal2
 v1=normal1;
 v2=normal2;
% v1=[-0.137 -0.343 0.929];
% v2=[0 0 1];
%转为单位向量
nv1 = v1/norm(v1);
nv2 = v2/norm(v2);

if norm(nv1+nv2)==0
    q = [0 0 0 0];
else
    u = cross(nv1,nv2);         
    u = u/norm(u);
    
    theta = acos(sum(nv1.*nv2))/2;
    q = [cos(theta) sin(theta)*u];
end

%由四元数构�?旋转矩阵
R=[2*q(1).^2-1+2*q(2)^2  2*(q(2)*q(3)+q(1)*q(4)) 2*(q(2)*q(4)-q(1)*q(3));
    2*(q(2)*q(3)-q(1)*q(4)) 2*q(1)^2-1+2*q(3)^2 2*(q(3)*q(4)+q(1)*q(2));
    2*(q(2)*q(4)+q(1)*q(3)) 2*(q(3)*q(4)-q(1)*q(2)) 2*q(1)^2-1+2*q(4)^2];
%data123=datas(:,1:3)*R;
%s = nv1*R;
end