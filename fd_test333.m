clc;clear;close all;

%����ÿ�����ֵĸ���Ҷ������
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
    z = frdescp(temp,100);%����Ҷ�����Ӽ���
    z = normaliseFD(z);%��һ������Ҷ������
    zstore{i+1,1} = z;
end
 
fileDir = 'D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\'; %ͼƬ�����ļ���
filePattern = [fileDir, '*.tif']; %ͼƬ��ʽ
dirOutput = dir(filePattern); %��ȡͼƬ�����ַ���
file_loca = dirOutput; 

for i1 = 1:40
    name2=['D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\',file_loca(i1).name]; 
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
     z = frdescp(temp,100);%����Ҷ�����Ӽ���
    z = normaliseFD(z);%��һ������Ҷ������

    for i=1:10          
            distance(i) = norm(z - zstore{i,1});
    end
    
    [~,num] = min(distance);
    figure(2);subplot(10,4,i1);imshow(a);
    title((num-1));
end