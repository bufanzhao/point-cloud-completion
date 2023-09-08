[bestplane] = RANSAC_para_once(datas1);
datas4=datas2';
mask2=abs(bestplane*[datas4; ones(1,size(datas4,2))])/sqrt(bestplane(1)^2+bestplane(2)^2+bestplane(3)^2);
d1=mean(mask2);


[idx2,dis] = knnsearch(datas3(:,1:3),datas2(:,1:3),'Distance','euclidean','NSMethod','kdtree','K',1);
d2=mean(dis);