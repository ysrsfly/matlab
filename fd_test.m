clc;clear;close all;

%%%%对50*50的矩阵赋值来生成阿拉伯数字

%数字0的生成
% m0 = zeros(50,50);
% m0(10:12 , 17:33) = 1;
% m0(10:40 , 17:19) = 1;
% m0(10:40 , 33:35) = 1;
% m0(40:42 , 17:35) = 1;
% subplot(2,5,1);imshow(m0);
% imwrite( m0, 'D:\文件\matlab\Fourier_Descriptor\m0.tif');
% 
% 
% %数字1的生成
% m1 = zeros(50,50);
% m1(10:40 , 24:26) = 1;
% subplot(2,5,2);imshow(m1);
% imwrite( m1, 'D:\文件\matlab\Fourier_Descriptor\m1.tif');
% 
% %数字2的生成
% m2 = zeros(50,50);
% m2(10:12 , 17:33) = 1;
% m2(10:26 , 33:35) = 1;
% m2(24:26 , 17:33) = 1;
% m2(25:40 , 17:19) = 1;
% m2(40:42 , 17:35) = 1;
% subplot(2,5,3);imshow(m2);
% imwrite( m2, 'D:\文件\matlab\Fourier_Descriptor\m2.tif');
% 
% 
% %数字3的生成
% m3 = zeros(50,50);
% m3(10:12 , 17:33) = 1;
% m3(10:25 , 33:35) = 1;
% m3(24:26 , 17:35) = 1;
% m3(25:40 , 33:35) = 1;
% m3(40:42 , 17:35) = 1;
% subplot(2,5,4);imshow(m3);
% imwrite( m3, 'D:\文件\matlab\Fourier_Descriptor\m3.tif');
% 
% %数字4的生成
% m4 = zeros(50,50);
% m4(10:25 , 17:19) = 1;
% m4(10:25 , 33:35) = 1;
% m4(24:26 , 17:35) = 1;
% m4(25:40 , 33:35) = 1;
% subplot(2,5,5);imshow(m4);
% imwrite( m4, 'D:\文件\matlab\Fourier_Descriptor\m4.tif');
% 
% %数字5的生成
% m5 = zeros(50,50);
% m5(10:12 , 17:35) = 1;
% m5(10:25 , 17:19) = 1;
% m5(24:26 , 17:35) = 1;
% m5(25:40 , 33:35) = 1;
% m5(40:42 , 17:35) = 1;
% subplot(2,5,6);imshow(m5);
% imwrite( m5, 'D:\文件\matlab\Fourier_Descriptor\m5.tif');
% 
% %数字6的生成
% m6 = zeros(50,50);
% m6(10:12 , 17:35) = 1;
% m6(10:25 , 17:19) = 1;
% m6(24:26 , 17:35) = 1;
% m6(25:40 , 17:19) = 1;
% m6(25:40 , 33:35) = 1;
% m6(40:42 , 17:35) = 1;
% subplot(2,5,7);imshow(m6);
% imwrite( m6, 'D:\文件\matlab\Fourier_Descriptor\m6.tif');
% 
% %数字7的生成
% m7 = zeros(50,50);
% m7(10:12 , 17:35) = 1;
% m7(10:42 , 33:35) = 1;
% subplot(2,5,8);imshow(m7);
% imwrite( m7, 'D:\文件\matlab\Fourier_Descriptor\m7.tif');
% 
% %数字8的生成
% m8 = zeros(50,50);
% m8(10:12 , 17:35) = 1;
% m8(10:25 , 17:19) = 1;
% m8(10:25 , 33:35) = 1;
% m8(24:26 , 17:35) = 1;
% m8(25:40 , 17:19) = 1;
% m8(25:40 , 33:35) = 1;
% m8(40:42 , 17:35) = 1;
% subplot(2,5,9);imshow(m8);
% imwrite( m8, 'D:\文件\matlab\Fourier_Descriptor\m8.tif');
% 
% %数字9的生成
% m9 = zeros(50,50);
% m9(10:12 , 17:35) = 1;
% m9(10:25 , 17:19) = 1;
% m9(10:25 , 33:35) = 1;
% m9(24:26 , 17:33) = 1;
% m9(25:40 , 33:35) = 1;
% m9(40:42 , 17:35) = 1;
% subplot(2,5,10);imshow(m9);
% imwrite( m9, 'D:\文件\matlab\Fourier_Descriptor\m9.tif');

%储存每个数字的傅里叶描述子
zstore =cell(10,1);
for i=0:9
    I = imread(strcat('std_',int2str(i),'.tif'));
    I = rgb2gray(I);
    level = graythresh(I);
    I0 = imbinarize(I,level);
%    IE=edge(I0,'Canny',0.2);%对其进行边缘检测
%     figure(2);imshow(IE);
%     [R,D]= find(IE);%找到边界点的坐标
%     temp = [R,D];
    edge = bwboundaries(I0);
    temp = edge{1,1};
    temp= sampling(temp,100);
    figure(2);
    subplot(2,5,i+1);imshow(bound2im(temp));
   % z = frdescp(temp,100);%傅里叶描述子计算
    %z = resizeFD(z, 60);
    z = normaliseFD3(edge);%归一化傅里叶描述子
    zstore{i+1,1} = z;
%       傅里叶描述子恢复
% %     z546 = ifrdescp(z,200);
% %     z546im = bound2im(z546,50,50);
% %     figure(3);imshow(z546im);    
end

[file,path] = uigetfile('D:\文件\matlab\*.*');
                if isequal(file,0)
                    disp('用户选择取消！');
                else
                    disp(['用户选择了 ', fullfile(path,file)]);
                end

                a=imread(fullfile(path,file));    
 
   if(ndims(a)==3)
        a = rgb2gray(a);
   end
    level = graythresh(a); 
    I0 = imbinarize(a,level);
   
%    IE=edge(I0,'Canny',0.2);%对其进行边缘检测
    %figure(2);imshow(IE);
%     [R,D]= find(IE);%找到边界点的坐标
%     figure(5);imshow(IE);
%     temp = [R,D];
    edge = bwboundaries(I0);
    temp = edge{1,1};
    temp= sampling(temp,100);
   % z = frdescp(temp,100);%傅里叶描述子计算
    %z = resizeFD(z, 60);
    z = normaliseFD3(edge);%归一化傅里叶描述子
    %imb = ifrdescp(zstore{1,1},180);
    %figure(6);imshow (bound2im(imb,50,50));
   % chk = 0;
%    figure(3);
%    for i=1:10
%        tmp = ifrdescp(zstore{i,1});
%        subplot(2,5,i);imshow(bound2im(tmp));
%    end
    for i=1:10
        [zs1,~] = size(zstore{i,1});
        [zs,~] = size(z);
        if zs1 > zs
            z1 = [z;zeros(zs1-zs,1)];
            zst = zstore{i,1};
            distance(i) = norm(z1-zst);
            %z = [ z ; zeros(zs1-zs,1)];
            %chk = 1;
        end
        
        if zs1 < zs
            zst = zstore{i,1};
            %distance(i) = norm(z(1:zs1,1)-zst(:,1));
            % zstore{i,1} = [zstore{i,1};zeros(zs-zs1,1)];
            zst = [zst;zeros(zs-zs1,1)];
            distance(i) = norm(z-zst);
        end
        
        if zs1 == zs
            distance(i) = norm(z(1:30)-zstore{i,1}(1:30));
        end
    end
    
    [~,a] = min(distance);
    disp("识别出的数字为"+(a-1));
    
