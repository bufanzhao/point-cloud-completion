function [p1,p2,Z1,Z2]=find_pp(vector,vector2,p,maxz)

[~,n]=size(vector);
if p==1||p==n
   p1=0;
   p2=0;
   Z1=maxz;
   Z2=maxz;
else
for i=p-1:-1:1
if vector(i)==1
   p1=i;
   Z1=vector2(i);
    break;
end
p1=0;
Z1=maxz;
end

for i=p+1:n
if vector(i)==1
   p2=i;
   Z2=vector2(i);
    break;
end
 p2=0;
 Z2=maxz;
end
end

end
