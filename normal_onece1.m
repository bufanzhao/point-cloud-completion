function [normal_pts,center]=normal_onece1(data)
%qiu dan ge chao ti su de normal

   
    [m,~]=size(data);
     P=data(:,1:3);
     center=sum(P,1)/m;
     P = P-ones(m,1)*(sum(P,1)/m);
     C = P.'*P./(m-1);
     %建立协方差矩阵
     [V, D] = eig(C);
     %求矩阵C的全部特征值，构成对角阵D，并求C的特征向量构成V的列向量。
     epsilon_to_add = 1e-8;
        EVs = [D(3,3) D(2,2) D(1,1)];
        if EVs(3) <= 0; EVs(3) = epsilon_to_add;
            if EVs(2) <= 0; EVs(2) = epsilon_to_add;
                if EVs(1) <= 0; EVs(1) = epsilon_to_add; end
            end
        end
    
  %normal
  tmp=1e-8;
  Dmin=0.0;
  tmp_vector=zeros(1:3);
  if D(1,1)<=D(2,2)
      tmp=D(1,1);
  else
      tmp=D(2,2);
  end
  if tmp<=D(3,3)
      Dmin=tmp;
  else
      Dmin=D(3,3);
  end
  for j=1:3
      if abs(Dmin-D(j,j))<1e-10
          tmp_vector=V(:,j);
      end
  end
  normal_pts=tmp_vector';
  
end
