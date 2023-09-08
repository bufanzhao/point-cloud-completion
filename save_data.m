function [data]=save_data(data_pts,adress,name)
% if k==1
% fid=fopen('C:\Users\hua\Desktop\data_idx.txt','w');
% else
%    if k==2
% fid=fopen('C:\Users\hua\Desktop\data_o1.tab','w');
%    end
% end
%  if k==3
% fid=fopen('C:\Users\hua\Desktop\data_out.txt','w');
%  end  
% if k==4
% fid=fopen('C:\Users\hua\Desktop\data_dim.txt','w');
% end  
 
file_name=char(name); 
file_adress=char(adress); 
%load_file=['C:\Users\hua\Desktop\convex\' file_name];
load_file=[file_adress file_name];
fid=fopen(load_file,'w');
data=data_pts;

[m,n]=size(data);

for i=1:1:m
    for j=1:1:n
        if j==n
            fprintf(fid,'%f\n',data(i,j));
        else
            fprintf(fid,'%f\t',data(i,j));
        end
    end
end
fclose(fid);
