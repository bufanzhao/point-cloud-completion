function [data_out]=pointcloud_downsample(datas,percent)

ptCloudIn=pointCloud(datas(:,1:3));
if size(datas,1)>100000
    data_pc = pcdownsample(ptCloudIn, 'random', percent);
    data_out = data_pc.Location;
    
else 
    data_out=datas(:,1:3);
end



end