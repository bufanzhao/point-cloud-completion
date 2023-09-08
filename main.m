%下采样
[datas_downsample]=pointcloud_downsample(datas,0.2);
%datas_downsample = datas;
%[data]=save_data(datas_downsample(:,1:3),'C:\Users\01\Desktop\填补结果\','datas_downsample.txt');
[datas_qz]=datas_quzao(datas_downsample);

%[datas_qz]=datas_quzao(datas);


%保证建筑姿态准确，调整姿态1：寻找相互垂直面进行坐标转换。SPFP method
% datas_qz=datas(:,1:3);
% [para_x,para_y,data_x,data_y] = RANSAC_para(datas_qz);
% %  hold on
% %  scatter3(datas_qz(:,1),datas_qz(:,2),datas_qz(:,3));
% %  scatter3(data_x(:,1),data_x(:,2),data_x(:,3));
% % scatter3(data_y(:,1),data_y(:,2),data_y(:,3));
% % axis equal
% [data_new,R2,RR2]=tiaozheng_zitai2(para_x,para_y,datas_qz);
% %data_new=[data_new datas(:,4:6)];
% [data]=save_data(data_new,'C:\Users\01\Desktop\填补结果\','data_new.txt');

%[data]=save_data(data_new(:,1:3),'C:\Users\ZBF\Desktop\填补结果\','data_new.txt');
%  data_out123=data_new*RR2*R2;
%  [data]=save_data(data_out123(:,1:3),'C:\Users\ZBF\Desktop\','data_final.txt');

%  %调整姿态方法2：体积最小 BBVM method
%datas_qz=datas(:,1:3);
[data_new,R2,RR2]=tiaozheng_zitai3(datas_qz);
 %data_out=[data_new datas(:,4:6)];
% [data]=save_data(data_out,'C:\Users\ZBF\Desktop\填补结果\','data_out.txt');

[data]=save_data(data_new(:,1:3),'C:\Users\01\Desktop\填补结果\','data_new.txt');
%  data_out123=data_new*RR2*R2;
%  [data]=save_data(data_out123(:,1:3),'C:\Users\ZBF\Desktop\填补结果\','data_final.txt');
%
data_new=data_new(:,1:3);
%填补过程,将上一个补完的面作为已有点，作新的输入填补另外的面
[data_new1,buliao_out_x1]=tianbu_guocheng(data_new,[1 0 0],'x1',5,2);

[data_new2,buliao_out_x2]=tianbu_guocheng(data_new1,[-1 0 0],'x2',5,2);

[data_new3,buliao_out_y1]=tianbu_guocheng(data_new2,[0 1 0],'y1',5,2);

[data_new4,buliao_out_y2]=tianbu_guocheng(data_new3,[0 -1 0],'y2',5,2);

[data_new5,buliao_out_z1]=tianbu_guocheng(data_new4,[0 0 1],'z1',5,2);

[data_new6,buliao_out_z2]=tianbu_guocheng(data_new5,[0 0 -1],'z2',5,2);



%循环迭代的多层修补过程
directionx1=[1 0 0];x1='x1';
directionx2=[-1 0 0];x2='x2';
directiony1=[0 1 0];y1='y1';
directiony2=[0 -1 0];y2='y2';
data_new_in=data_new;
k=1;
for i=1:7
[data_new_out,buliao_out_x1]=tianbu_guocheng(data_new_in,directionx2,x2,k,1);
k=k+3;
data_new_in=data_new_out;
end

data_new1=data_new_in;
data_new2=data_new4;

data_f=data_new2;
% %填补整块区域
% [data_tianbu]=buliaomoni_bulou(data_f,2,[0 0 -1]);
% data_f2=[data_f;data_tianbu];
% %[data]=save_data(data_f2(:,1:3),'C:\Users\01\Desktop\填补结果\','data_tianbu.txt');


data_final=data_f(:,1:3)*RR2*R2;
%data_final=data_f(:,1:3)*RR2*R2;

%data_out=data_new*RR2*R2;
 %[data]=save_data(data_final(:,1:3),'C:\Users\01\Desktop\填补结果\','data_wanzheng.txt');
[data_out]=xiufu_datas_qz(data_final,datas);
% dataf=[datas;data_final;data_final_1];
 [data]=save_data(data_out(:,1:3),'C:\Users\01\Desktop\填补结果\','data_final.txt');

% %x1方向
% [buliao_out_x1,data_out,high,data_out3]=buliaomoni(data_new,2,[1 0 0]);
% [data]=save_data(buliao_out_x1(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out_x1.txt');
% data_new1=[data_new;buliao_out_x1(:,1:3)];
% [data]=save_data(data_new1(:,1:3),'C:\Users\ZBF\Desktop\','data_new1.txt');
% 
% 
% 
% data_final_x1=buliao_out_x1(:,1:3)*RR2*R2;
% [data_out_x1]=xiufu_datas_qz(data_final_x1,datas);
% 
% %x-1方向
% [buliao_out_x_1,data_out,high,data_out3]=buliaomoni(data_new1,2,[-1 0 0]);
% [data]=save_data(buliao_out_x_1(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out_x_1.txt');
% data_new2=[data_new1;buliao_out_x_1(:,1:3)];
% [data]=save_data(data_new2(:,1:3),'C:\Users\ZBF\Desktop\','data_new2.txt');
% 
% data_final_x_1=buliao_out_x_1(:,1:3)*RR2*R2;
% [data_out_x_1]=xiufu_datas_qz(data_final_x_1,datas);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %y1方向
% [buliao_out_y1,data_out,high,data_out3]=buliaomoni(data_new2,2,[0 1 0]);
% [data]=save_data(buliao_out_y1(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out_y1.txt');
% data_new3=[data_new2;buliao_out_y1(:,1:3)];
% [data]=save_data(data_new3(:,1:3),'C:\Users\ZBF\Desktop\','data_new3.txt');
% 
% data_final_y1=buliao_out_y1(:,1:3)*RR2*R2;
% [data_out_y1]=xiufu_datas_qz(data_final_y1,datas);
% %y-1方向
% [buliao_out_y_1,data_out,high,data_out3]=buliaomoni(datas_new3,2,[0 -1 0]);
% data_final_y_1=buliao_out_y_1(:,1:3)*RR2*R2;
% [data_out_y_1]=xiufu_datas_qz(data_final_y_1,datas);
% [data]=save_data(data_out_y_1(:,1:3),'C:\Users\ZBF\Desktop\','data_final_y_1.txt');
% data_new4=[data_new3;data_out_y_1];
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %z1方向
% [buliao_out_z1,data_out,high,data_out3]=buliaomoni(datas_new4,2,[0 0 1]);
% data_final_z1=buliao_out_z1(:,1:3)*RR2*R2;
% [data_out_z1]=xiufu_datas_qz(data_final_z1,datas);
% [data]=save_data(data_out_z1(:,1:3),'C:\Users\ZBF\Desktop\','data_final_z1.txt');
% data_new5=[data_new4;data_out_z1];
% 
% %z-1方向
% [buliao_out_z_1,data_out,high,data_out3]=buliaomoni(datas_new5,2,[0 0 -1]);
% data_final_z_1=buliao_out_z_1(:,1:3)*RR2*R2;
% [data_out_z_1]=xiufu_datas_qz(data_final_z_1,datas);
% [data]=save_data(data_out_z_1(:,1:3),'C:\Users\ZBF\Desktop\','data_final_z_1.txt');
% data_new6=[data_new5;data_out_z1];