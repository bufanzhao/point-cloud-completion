function [datas_new,R2,RR2]=tiaozheng_zitai2(para_x,para_y,datas)

normal_x=para_x(1:3);

[R]=xuanzhuanjuzhen2(normal_x,[0 0 1]);
[R2]=xuanzhuanjuzhen2([0 0 1],normal_x);
normal_y=para_y*R;
[RR]=xuanzhuanjuzhen2(normal_y,[0 1 0]);
[RR2]=xuanzhuanjuzhen2([0 1 0],normal_y);

datas_new=datas*R*RR;

end