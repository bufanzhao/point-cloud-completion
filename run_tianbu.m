function [data_out]=run_tianbu(datas)

[datas_new,R2,RR2]=tiaozheng_zitai(datas);
%[buliao_out]=buliaomoni_bulou(datas_new,2,[0 0 -1]);
[buliao_out]=buliaomoni_bulou(datas,1,[0 0 -1]);
% [data]=save_data(datas_new,'C:\Users\ZBF\Desktop\','datas_new.txt');
% [data]=save_data(buliao_out(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out.txt');
%data_bulou=buliao_out(:,1:3)*RR2*R2;
data_bulou=buliao_out(:,1:3);

[data]=save_data(data_bulou(:,1:3),'C:\Users\ZBF\Desktop\','data_bulou.txt');
dataff=[datas;data_bulou];
[data]=save_data(dataff(:,1:3),'C:\Users\ZBF\Desktop\','dataff.txt');




end