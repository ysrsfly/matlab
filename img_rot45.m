clc;clear;close all;
for i1 =0:9
I=imread(strcat('std_',num2str(i1),'.tif'));%读入图片并转化为灰度图
I1 = imrotate(I,300);
imwrite(I1,strcat('for_recognition\std_',num2str(i1),'_rot300.tif'))
end

