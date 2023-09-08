function [R]=xuanzhuan(normal1,normal2)



nv1=normal1;
nv2=normal2;
if norm(nv1+nv2)==0
    q = [0 0 0 0];
else
    u = cross(nv1,nv2);         
    u = u/norm(u);
    
    theta = acos(sum(nv1.*nv2))/2;
    q = [cos(theta) sin(theta)*u];
end

%由四元数构造旋转矩阵
R=[2*q(1).^2-1+2*q(2)^2  2*(q(2)*q(3)+q(1)*q(4)) 2*(q(2)*q(4)-q(1)*q(3));
    2*(q(2)*q(3)-q(1)*q(4)) 2*q(1)^2-1+2*q(3)^2 2*(q(3)*q(4)+q(1)*q(2));
    2*(q(2)*q(4)+q(1)*q(3)) 2*(q(3)*q(4)-q(1)*q(2)) 2*q(1)^2-1+2*q(4)^2];

% s1 = nv1*R;
% s = data*R;

end
