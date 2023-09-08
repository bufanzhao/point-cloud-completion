function [p]=chuizu(points,a,b,c,plane)
for i=1:size(points,1)
AA=[a(2)-a(1) b(2)-b(1) c(2)-c(1);
    a(3)-a(1) b(3)-b(1) c(3)-c(1);
    plane(1) plane(2) -1];
BB=[points(i,1)*(a(2)-a(1))+points(i,2)*(b(2)-b(1))+points(i,3)*(c(2)-c(1));
    points(i,1)*(a(3)-a(1))+points(i,2)*(b(3)-b(1))+points(i,3)*(c(3)-c(1));
    -plane(4)
    ];
p(i,:)=(inv(AA)*BB)';
end



end