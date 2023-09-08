function [x,y,k]=linecross(k1,b1,k2,b2)
  x=[];
  y=[];
  k=1;
  if k1==k2&b1==b2
      disp('chong he');
  elseif k1==k2&b1~=b2
      disp('wu jiao dian');
      k=0;
  else
     x=(b2-b1)/(k1-k2);
     y=k1*x+b1;
%   disp('x=');
%   disp(x);
%   disp('y=');
%   disp(y);
  end
