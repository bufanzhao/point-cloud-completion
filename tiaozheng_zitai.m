function [datas_new,R2]=tiaozheng_zitai2(para,datas)

normal=para(1:3);
[R]=xuanzhuanjuzhen2(normal2,[1 0 0]);
datas_new=datas*R;
[R2]=xuanzhuanjuzhen2([1 0 0],normal2);

end