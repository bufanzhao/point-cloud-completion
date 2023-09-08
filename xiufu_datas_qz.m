function [data_out]=xiufu_datas_qz(data_final,datas)

[idx,dis] = knnsearch(datas(:,1:3),data_final(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',1); %计算点云中每个点的最优k近邻点的索引

  data_out=data_final(dis>0.2,:);

end