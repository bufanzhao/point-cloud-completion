function [pogen2]=wanggehua(datas)
%datas=datas-mean(datas,1);
%data_2D=datas;
minz=min(datas(:,3));
data_2D=datas(datas(:,3)>(minz+0.2*1),1:3);
data_2D=data_2D(data_2D(:,3)<(minz+0.2*2),1:3);
% scatter(data_2D(:,1),data_2D(:,2));
% axis equal
[k3]=shunshizhen_order(data_2D);
data2D=data_2D(:,1:2);
sit=1;%ruo qiemian wanzheng ke bu ni he
if sit==1
pogen2=polyshape(data_2D(k3,1),data_2D(k3,2));
else
 [~,dis] = knnsearch(data2D,data2D,'Distance','euclidean','NSMethod','kdtree','K',3);
 data2D=data2D(dis(:,3)<6,:);
 [para1]=ransac_line(data2D);
 [para2]=line_fit(data2D);
 para=[para1;para2];
 nn=size(para1,1);
 [jiaodian]=CrossPoint(para);
 [~,dis] = knnsearch(data2D,jiaodian(:,1:2),'Distance','euclidean','NSMethod','kdtree','K',1);
 jiaodian2=jiaodian(dis<1,:);
 daixuan = jiaodian2(jiaodian2(:,4)>nn,:);
 queding = jiaodian2(jiaodian2(:,4)<=nn,:);
 [~,dis] = knnsearch(queding(:,1:2),daixuan(:,1:2),'Distance','euclidean','NSMethod','kdtree','K',1);
 jiaodian_final=[queding(:,1:2);daixuan(dis>1,1:2)];
 data_2D_final = [data2D;jiaodian_final];
 [k2]=shunshizhen_order(data_2D_final);
 pogen2=polyshape(data_2D_final(k2,1),data_2D_final(k2,2));
end
 hold on
 scatter(data2D(:,1),data2D(:,2));
% %
% % 
%  pogen=polyshape(jiaodian_final(k2,1),jiaodian_final(k2,2));
%  data_2D_final=[data2D;jiaodian_final];
%  [k3]=shunshizhen_order(data_2D_final);
%  data_2D_final=[data2D;jiaodian_final];
%  [k3,A] = convhull(data_2D_final(:,1),data_2D_final(:,2));
%  pogen2=polyshape(data_2D_final(k3,1),data_2D_final(k3,2));


% plot(pogen);
% plot(pogen2);
% axis equal
% k=convhull(data2D);
% asd=polyshape(data2D(k,1),data2D(k,2));
% plot(asd);

% scatter(jiaodian2(:,1),jiaodian2(:,2));
% scatter(jiaodian_final(:,1),jiaodian_final(:,2));
% axis equal
% k=convhull(jiaodian_final);
% pogen2=polyshape(jiaodian_final(k2,1),jiaodian_final(k2,2));
 %plot(pogen2);



%data2=data(:,1:2);


end