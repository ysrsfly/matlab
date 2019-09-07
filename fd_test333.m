clc;clear;close all;

%储存每个数字的傅里叶描述子
zstore =cell(10,1);
for i=0:9
    I = imread(strcat('std_',int2str(i),'.tif'));
    I = rgb2gray(I);
    level = graythresh(I);
    I0 = imbinarize(I,level);
    temp = boundryRebuild(I0);
    %edge = bwboundaries(I0);
    %temp = edge{1,1};
    temp= sampling(temp,100);
    figure(1);
    subplot(2,5,i+1);imshow(bound2im(temp));
    z = frdescp(temp,100);%傅里叶描述子计算
    z = normaliseFD(z);%归一化傅里叶描述子
    zstore{i+1,1} = z;
end
 
fileDir = 'D:\文件\matlab\Fourier_Descriptor\for_recognition\'; %图片所在文件夹
filePattern = [fileDir, '*.tif']; %图片格式
dirOutput = dir(filePattern); %获取图片名称字符串
file_loca = dirOutput; 

for i1 = 1:40
    name2=['D:\文件\matlab\Fourier_Descriptor\for_recognition\',file_loca(i1).name]; 
    a = imread(strcat(name2));
   if(ndims(a)==3)
        a = rgb2gray(a);
   end
    level = graythresh(a); 
    I0 = imbinarize(a,level);
    temp = boundryRebuild(I0);
%     edge = bwboundaries(I0);
%     temp = edge{1,1};
    temp= sampling(temp,100);
     z = frdescp(temp,100);%傅里叶描述子计算
    z = normaliseFD(z);%归一化傅里叶描述子

    for i=1:10          
            distance(i) = norm(z - zstore{i,1});
    end
    
    [~,num] = min(distance);
    figure(2);subplot(10,4,i1);imshow(a);
    title((num-1));
end