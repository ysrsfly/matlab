clc;clear;close all;
%I = imread('D:\文件\matlab\Fourier_Descriptor\std_1.tif');
%I0 = imread('D:\文件\matlab\Fourier_Descriptor\std_0.tif');
% I 
% a=insertText(I,[0 0],'4','FontSize',80,'BoxColor','black','TextColor','white');
% I1 = rot90(I);
% I1 = rot90(I1);
% I1 = imrotate(I,45);
% I1 = imresize(I1,100/142);
%imwrite(I1,'D:\文件\matlab\Fourier_Descriptor\std_1_rot_180.tif');
% I = rgb2gray(I);
% I1 = imresize(I, 2);
% %I1 = imcrop(I1,[50,45,99,99]);
% %imshow(I1);
% imwrite(I1,'D:\文件\matlab\Fourier_Descriptor\std_resize_mov_4.tif');
% subplot(211);imshow(I1);
% subplot(212);imshow(I);
% I = imread('D:\文件\matlab\Fourier_Descriptor\std_9.tif');
% I = rgb2gray(I);
% imshow(I);
% I = double(I);
% [rows,cols] = size(I); 
% x = ones(rows,1)*[1:cols];
% y = [1:rows]'*ones(1,cols);   
% area = sum(sum(I)); 
% meanx = sum(sum(I.*x))/area; 
% meany = sum(sum(I.*y))/area;
% hold on;
% plot(meanx,meany,'r+'); %十字标出重心位置
% 
% edge = bwboundaries(m);
% i = 0;
% for j=1:165
% a = imread(strcat('C:\Users\25227\Desktop\图像\yale\yale_faces\s',num2str(j),'.bmp'));
% i = (j-1)/11 ;
% if mod (j-1,11) == 0
% mkdir('D:\文件\matlab\EigenFace\yale_faces\s',num2str(i));
% k = 0;
% end
% imwrite(a,strcat('D:\文件\matlab\EigenFace\yale_faces\s\',num2str(floor(i)),'\',num2str(k),'.bmp'));
% k = k+1;
% end
% I = zeros(100,100);
% imshow(insertText(I,[15 0],'a','FontSize',60,'BoxColor','black','TextColor','white'));
%函数histeq（）进行直方图均衡化处理
% I=imread('C:\Users\25227\Pictures\1-151005230535.jpg');
% J=histeq(I);  %直方图均衡化
% figure,
% subplot(121),imshow(uint8(I));
% title('原图')
% subplot(122),imshow(uint8(J));
% title('均衡化后')
% figure,
% subplot(121),imhist(I,64);
% title('原图像直方图');
% subplot(122),imhist(J,64);
% title('均衡化后的直方图');
% 
% 
% %预处理
% 
% I =imread('C:\Users\25227\Pictures\1-151005230535.jpg');  %读图
% 
% GI=rgb2gray(I); %彩色图转灰度图Grey_Image
% 
% %展示原图
% 
% figure('NumberTitle', 'on', 'Name', '原图像');
% 
% imshow(I),title('测试图片');
% 
% %展示原灰度图及直方图
% 
% figure('NumberTitle', 'on', 'Name', '原灰度图像');
% 
% subplot(2,1,1);imshow(GI),title('灰度图像');
% 
% subplot(2,1,2);imhist(GI),title('直方图');
% 
% %图像均衡化处理过程
% 
% [M,N]=size(GI);
% 
% GI1=reshape(GI,M*N,1);
% 
% GI1_sort=sortrows(GI1);%按灰度值排序方便统计
% 
% [a, b, c] = unique(GI1_sort);%a为不同种灰度值数组，b为不同灰度值第一次出现的索引号
% 
% %统计每个灰度值的个数,计算概率
% 
% for i=1:size(a)-1
% 
%   num(i)=b(i+1)-b(i);
% 
%   p(i)=num(i)/(M*N);
% 
% end
% 
% num(i+1)=M*N-b(i+1)+1;
% 
% p(i+1)=num(i+1)/(M*N);
% 
% %计算像素映射关系
% 
% sum=0;
% 
% for i=1:size(a)
% 
%   sum=sum+p(i);
% 
%   s(i)=sum;
% 
%   ss(i)=floor((double(max(GI1)-min(GI1))*s(i))+0.5); 
%   
%   %有的均衡化理论中不是该图像最大灰度值减去最小灰度值，而是(2^n-1)-0
% 
% end
% 
% %对原图进行映射
% 
% for i=1:M*N
% 
%  GI_new1(i)=ss(find(a==GI1(i))) ;
% 
% end
% 
% GI_new=uint8(reshape(GI_new1,M,N));
% 
% %展示均衡化后的图像和直方图
% 
% figure('NumberTitle', 'on', 'Name', '均衡化处理结果')
% 
% subplot(2,1,1);imshow(GI_new),title('灰度图像');
% 
% subplot(2,1,2);imhist(GI_new),title('直方图');
% 
% %预设规定化概率密度值
% 
% %索引1-255代表像素0-254，没有计算第256是因为加上那一个概率后总概率超过1了
% 
% for i=1:128
% 
%    p1(i)=-1/127^2*(i-1)+1/127;
% 
% end
% 
% for i=129:255  
% 
%   p1(i)=1/127^2*(i-2)-1/127;
% 
% end
% 
% %计算像素映射关系
% 
% sum1=0;
% 
% for i=1:255
% 
%   sum1=sum1+p1(i);
% 
%   s1(i)=sum1;
% 
%   ss1(i)=floor((254*s1(i))+0.5);%同上，有的均衡化理论中不是254-0=254，而是(2^8-1)-0=255
% 
% end
% 
% %将均衡图像映射到规定化图像
% 
% [a1, b1, c1] = unique(ss1);%a1为不同种灰度值数组，b1为不同灰度值第一次出现的索引号
% 
%  for i=1:M*N
% 
%   flag=find(a1==GI_new1(i)); %flag用于判断均衡后像素是否在规定化映射中找得到
% 
%   if isempty(flag)
% 
%      GI_regular1(i)=GI_new1(i);
% 
%   else
% 
%      GI_regular1(i)=b1(find(a1==GI_new1(i)))-1;
% 
%   end
% 
%  end
% 
% GI_regular=uint8(reshape(GI_regular1,M,N));
% 
% %展示规定化后的图像和直方图
% 
% figure('NumberTitle', 'on', 'Name', '规定化处理结果')
% 
% subplot(2,1,1);imshow(GI_regular),title('灰度图像');
% 
% subplot(2,1,2);imhist(GI_regular),title('直方图');





% GrayImage = imread('C:\Users\25227\Pictures\1-151005230535.jpg');
% [rows , cols] = size(GrayImage);%得到图像矩阵的行、列数
% ZhiFang = zeros(1 , 256);%初始化一个矩阵，用来存储灰度图像中每个像素出现的频率
% 
% for i = 0:255
%     ZhiFang(1 , i+1) = length(find(GrayImage == i)) / (rows * cols);%计算矩阵GrayImage中值与i相等的元素的个数
% end
% 
% figure(3);
% bar(0:255 , ZhiFang*rows*cols , 'grouped');%根据bar绘制直方图
% xlabel('灰度值');
% ylabel('出现次数');
% %axis([0 255 0 1]);%axis函数用来设置画面横坐标及纵坐标的上下限



clc
clear all
%学号2016217771;
b1=fir1(38,0.771,'low')%设计38阶低通滤波器
b2=fir1(28,0.71,'high')%%设计28阶高通滤波器

[h1,w1]=freqz(b1,1);  
[h2,w2]=freqz(b2,1);
figure;
subplot(211);
plot(w1/pi,20*log10(abs(h1))); 
axis([0,1,-80,10]); 
grid;
xlabel('归一化频率/p') ;
ylabel('幅度/dB') ;

subplot(212);
plot(w2/pi,20*log10(abs(h2))); 
axis([0,1,-80,10]); 
grid;
xlabel('归一化频率/p') ;
ylabel('幅度/dB') ;

b1t = round(b1*10000); %四舍五入
b2t = round(b2*10000);
str1 = '*32768/10000';%转化成小数表达形式
 
c = fopen('C:\Users\25227\Desktop\DSP实验数据\实验三\38_coef.txt','w');%生成TXT文本
for i=1:size(b1t,2)
    b1t1 = num2str(b1t(i));
    s1 = [b1t1 str1];
    fprintf(c,'.word %s\r\n ',s1);
end
fclose(c);
 
c = fopen('C:\Users\25227\Desktop\DSP实验数据\实验三\28_coef.txt','w');%生成TXT文本
for i=1:size(b2t,2)
    b2t1 = num2str(b2t(i));
    s1 = [b2t1 str1];
    fprintf(c,'.word %s\r\n',s1);
end
fclose(c);
