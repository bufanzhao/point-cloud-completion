function [data_new1,buliao_out_x1]=tianbu_guocheng(data_new,normal,num,juli,zhengping)
%n=str2num(num);
name1=['buliao_out_x' num '.txt'];
name2=['data_new' num '.txt'];

[buliao_out_x1,data_out,high,data_out3]=buliaomoni(data_new,2,normal,juli,zhengping);
%[data]=save_data(buliao_out_x1(:,1:3),'C:\Users\01\Desktop\填补结果\',name1);
data_new1=[data_new;buliao_out_x1(:,1:3)];
%[data]=save_data(data_new1(:,1:3),'C:\Users\01\Desktop\填补结果\',name2);


end