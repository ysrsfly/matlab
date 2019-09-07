clc;clear;close all;

%%利用matlab的textinsert函数生成数字
for i=0:9
    I = zeros(100,100);
  num_str = strcat(num2str(i));
im_num=insertText(I,[15 0],num_str,'FontSize',60,'BoxColor','black','TextColor','white');
imwrite(im_num,strcat('std_test_',num2str(i),'.tif'));  %将产生的数字图片保存
end

%储存每个数字的傅里叶描述子
zstore =cell(10,1);
for i=0:9
    I = imread(strcat('std_',int2str(i),'.tif'));%读取训练集10张数字图片
    I = rgb2gray(I);
    level = graythresh(I);
    I0 = imbinarize(I,level);%%将数字图片进行二值化
    edge = bwboundaries(I0);%%按照顺时针方向提取其边界
    temp = edge{1,1};%%选择外边界（有的数字bwboundaries会提取多个轮廓）
    figure(1);subplot(2,5,i+1);imshow(bound2im(temp));
    z = frdescp(temp,45);%傅里叶描述子计算
    z = normaliseFD(z);%归一化傅里叶描述子
    zstore{i+1,1} = z;%%将归一化过后的傅里叶描述子存入数组矩阵
end
 
fileDir = 'D:\文件\matlab\Fourier_Descriptor\for_recognition\'; %图片所在文件夹
filePattern = [fileDir, '*.tif']; %图片格式
dirOutput = dir(filePattern); %获取图片名称字符串
file_loca = dirOutput; 

for i1 = 1:60
    %%读取测试图片
    name2=['D:\文件\matlab\Fourier_Descriptor\for_recognition\',file_loca(i1).name]; %%读取该目录下的所有文件
    a = imread(strcat(name2));
    
   if(ndims(a)==3)  %%判断是否为rgb图片，若是转换为灰度图片
        a = rgb2gray(a);
   end
   
    level = graythresh(a); 
    I0 = imbinarize(a,level); %%二值化测试图片
    edge = bwboundaries(I0);  %%顺时针提取图片的边界
    temp = edge{1,1};         %%选择外边界（有的数字bwboundaries会提取多个轮廓）
     z = frdescp(temp,45);    %傅里叶描述子计算
    z = normaliseFD(z);       %归一化傅里叶描述子

    %%%%计算测试图片与训练图片间的距离
    for i=1:10          
            distance(i) = norm(z(1:45) - zstore{i,1}(1:45));
    end
    
    [~,num] = min(distance);  %找到距离最小的下标
    %显示所识别的图片以及相应识别的数字
    if(i1<31)
        figure(2);subplot(5,6,i1);imshow(a);title("识别为"+(num-1));
    end
    if(i1>30)
        figure(3);subplot(5,6,(i1-30));imshow(a);title("识别为"+(num-1));
    end
    
end