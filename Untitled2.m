function [data_new1,buliao_out_x1]=tianbu_guocheng(data_new,normal,num)
n=
[buliao_out_x1,data_out,high,data_out3]=buliaomoni(data_new,2,normal);
[data]=save_data(buliao_out_x1(:,1:3),'C:\Users\ZBF\Desktop\','buliao_out_x1.txt');
data_new1=[data_new;buliao_out_x1(:,1:3)];
[data]=save_data(data_new1(:,1:3),'C:\Users\ZBF\Desktop\','data_new1.txt');





end