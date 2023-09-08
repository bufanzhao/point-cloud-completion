function [data_out]=quzao(datas)
data=datas;
[idx2,dis] = knnsearch(data(:,1:3),data(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',5);
d=mean(dis(:,2));

idx=(dis(:,5)>=4*d);

data(idx,4)=0;

data_out=data;

end