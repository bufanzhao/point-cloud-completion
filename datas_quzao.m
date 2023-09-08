function [datas_quzao]=datas_quzao(datas)

[idx,dis] = knnsearch(datas(:,1:3),datas(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',10); %计算点云中每个点的最优k近邻点的索引

datas_quzao=datas(dis(:,10)<1,:);

end