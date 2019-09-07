clc;clear;close all;
 
% 从当前目录下打开一张图片
for i =0:9
fullfp = strcat('std_',num2str(i),'.tif');
image = imread(fullfp);   %代表要处理的图像
mysize = size(image);
%把图像转换成灰度图
if numel(mysize) > 2
    image = rgb2gray(image);
end
r_e = mysize(1);
c_e = mysize(2);
subplot(2,3,1); imshow(image,[]); title('Input Image');
 
temp1 = imresize(image,2); %表示把图像放大到原来的两倍，但同时图像矩阵也是变成了原来的两倍
[r_t1,c_t1] = size(temp1);
s = temp1(round(r_t1/2)-floor(r_e/2) : round(r_t1/2)+ceil(r_e/2)-1, round(c_t1/2)-floor(c_e/2) : round(c_t1/2)+ceil(c_e/2)-1);
subplot(2,3,2);imwrite(s,strcat('for_recognition\std_',num2str(i),'_mag.tif')); imshow(s,[]); title('Magnification');
 
temp2 = imresize(image,0.8); %表示把图像缩小到原来的一半，但同时图像矩阵也变成了原来的一半
[r_t2,c_t2] = size(temp2);
temp3 = zeros(r_e,c_e);
temp3(round(r_e/2)-floor(r_t2/2) : round(r_e/2)+ceil(r_t2/2)-1, round(c_e/2)-floor(c_t2/2) : round(c_e/2)+ceil(c_t2/2)-1) = temp2;
ss = temp3;
subplot(2,3,3); imwrite(ss,strcat('for_recognition\std_',num2str(i),'_min.tif')); imshow(ss,[]); title('Minification');
end