  function  [jiaodian]=CrossPoint(para)
  jiaodian=[];
  n=size(para,1);
  for i=1:size(para,1)
    para1=para(i,:);
    k1=para1(1);
    b1=para1(3);
    
    for j=i+1:size(para,1)
       para2=para(j,:);
       k2=para2(1);
       b2=para2(3);
       [x,y,k]=linecross(k1,b1,k2,b2);
      % if x~=[]&&y~=[]
    if k==1
       if i<n-3||j<n-3
          jiaodian=[jiaodian;x y i j];
       end
     end
    end
    
  end

  end