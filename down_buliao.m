function [buliao_new]=down_buliao(data,buliao,d,full,disn)

idx=(buliao(:,4)==0);
buliao_down=buliao(idx,:);
[idx2,dis] = knnsearch(data(:,1:3),buliao(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',1);
idx_dis=dis>d;
idx2(idx_dis)=0;
  
buliao_new=buliao;
buliao_new(idx2~=0,4)=1;
buliao(idx2~=0,4)=1;
%idx3=(buliao_new(:,4)==0);

xx=unique(buliao_new(:,1));
yy=unique(buliao_new(:,2));

if full==2
  for i=1:size(xx,1)
   idxx=(buliao(:,1)==xx(i));
   nx=sum(buliao(idxx,4));
   if nx>=2
      datax=buliao(idxx,:);
      idxx2=(buliao(idxx,4)==1);
      xymax=max(datax(idxx2,2));
      xymin=min(datax(idxx2,2));
      for j=1:size(buliao,1)
         if buliao(j,1)==xx(i)&&buliao(j,4)==0
             if (xymin<buliao(j,2))
                 if(buliao(j,2)<xymax)
                   buliao_new(j,4)=1;
                 end
             end
         end
      end    
   end
  end

  for i=1:size(yy,1)
   idxy=(buliao(:,2)==yy(i));
   ny=sum(buliao(idxy,4));
   
   if ny>=2
      datay=buliao(idxy,:);
      idxy2=(buliao(idxy,4)==1);
      %data2=buliao(idxy2,:);
      yxmax=max(datay(idxy2,1));
      yxmin=min(datay(idxy2,1));
      for j=1:size(buliao,1)
         if buliao(j,2)==yy(i)&&buliao(j,4)==0
             if (yxmin<buliao(j,1))
                 if(buliao(j,1)<yxmax)
                   buliao_new(j,4)=1;
                 end
             end
         end
      end    
   end
  end
end
idx3=(buliao_new(:,4)==0);
buliao_new(idx3,3)=buliao_new(idx3,3)-disn;
buliao_new(idx3,5)=buliao_new(idx3,5)+1;
end