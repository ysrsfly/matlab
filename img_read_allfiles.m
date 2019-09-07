clc;clear;close all;
fileDir = 'D:\文件\matlab\Fourier_Descriptor\for_recognition\'; %图片所在文件夹
filePattern = [fileDir, '*.tif']; %图片格式
dirOutput = dir(filePattern); %获取图片名称字符串
a = dirOutput; 
for i=1:40
        name2=['D:\文件\matlab\Fourier_Descriptor\for_recognition\',a(i).name]; 
end