clc;clear;close all;

%%����matlab��textinsert������������
for i=0:9
    I = zeros(100,100);
  num_str = strcat(num2str(i));
im_num=insertText(I,[15 0],num_str,'FontSize',60,'BoxColor','black','TextColor','white');
imwrite(im_num,strcat('std_test_',num2str(i),'.tif'));  %������������ͼƬ����
end

%����ÿ�����ֵĸ���Ҷ������
zstore =cell(10,1);
for i=0:9
    I = imread(strcat('std_',int2str(i),'.tif'));%��ȡѵ����10������ͼƬ
    I = rgb2gray(I);
    level = graythresh(I);
    I0 = imbinarize(I,level);%%������ͼƬ���ж�ֵ��
    edge = bwboundaries(I0);%%����˳ʱ�뷽����ȡ��߽�
    temp = edge{1,1};%%ѡ����߽磨�е�����bwboundaries����ȡ���������
    figure(1);subplot(2,5,i+1);imshow(bound2im(temp));
    z = frdescp(temp,45);%����Ҷ�����Ӽ���
    z = normaliseFD(z);%��һ������Ҷ������
    zstore{i+1,1} = z;%%����һ������ĸ���Ҷ�����Ӵ����������
end
 
fileDir = 'D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\'; %ͼƬ�����ļ���
filePattern = [fileDir, '*.tif']; %ͼƬ��ʽ
dirOutput = dir(filePattern); %��ȡͼƬ�����ַ���
file_loca = dirOutput; 

for i1 = 1:60
    %%��ȡ����ͼƬ
    name2=['D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\',file_loca(i1).name]; %%��ȡ��Ŀ¼�µ������ļ�
    a = imread(strcat(name2));
    
   if(ndims(a)==3)  %%�ж��Ƿ�ΪrgbͼƬ������ת��Ϊ�Ҷ�ͼƬ
        a = rgb2gray(a);
   end
   
    level = graythresh(a); 
    I0 = imbinarize(a,level); %%��ֵ������ͼƬ
    edge = bwboundaries(I0);  %%˳ʱ����ȡͼƬ�ı߽�
    temp = edge{1,1};         %%ѡ����߽磨�е�����bwboundaries����ȡ���������
     z = frdescp(temp,45);    %����Ҷ�����Ӽ���
    z = normaliseFD(z);       %��һ������Ҷ������

    %%%%�������ͼƬ��ѵ��ͼƬ��ľ���
    for i=1:10          
            distance(i) = norm(z(1:45) - zstore{i,1}(1:45));
    end
    
    [~,num] = min(distance);  %�ҵ�������С���±�
    %��ʾ��ʶ���ͼƬ�Լ���Ӧʶ�������
    if(i1<31)
        figure(2);subplot(5,6,i1);imshow(a);title("ʶ��Ϊ"+(num-1));
    end
    if(i1>30)
        figure(3);subplot(5,6,(i1-30));imshow(a);title("ʶ��Ϊ"+(num-1));
    end
    
end