clc;clear;close all;
for i1 =0:9
I=rgb2gray(imread(strcat('std_',num2str(i1),'.tif')));%读入图片并转化为灰度图
figure,imshow(I);                   %建立窗口，显示灰度图I
[r,c]=size(I);                      %计算灰度图的大小，r表示行，c表示列，即通过size函数将灰度图I的行数存在矩阵的r中，列数存在矩阵的c中，这样就知道灰度图的大小是r×c
dst=zeros(r,c);                     %建立r×c的0矩阵（平移结果矩阵），初始化为零（黑色）
dx=10;                              %平移的x方向的距离，这里是竖直方向
dy=20;                              %平移的y方向的距离，这里是水平方向
tras=[1 0 dx;0 1 dy;0 0 1];         %平移变换矩阵
for i=1:r
    for j=1:c
        temp=[i;j;1];               %灰度图I要平移变换的点，这里用矩阵表示
        temp=tras*temp;             %矩阵相乘，得到三行一列的矩阵temp，即平移后的矩阵
        x=temp(1,1);                %把矩阵temp的第一行第一列的元素给x   
        y=temp(2,1);                %把矩阵temp的第二行第一列的元素给y 
        if(x>=1&&x<=r)&&(y>=1&&y<=c)%判断所变换后得到的点是否越界
            dst(x,y)=I(i,j);        %得到平移结果矩阵，点(x,y)是由点(i,j)平移而来的，有对应关系 
        end
    end
end
imwrite(uint8(dst),strcat('for_recognition\std_',num2str(i1),'_mov.tif'));          %建立窗口，显示平移后的图
end