clc;clear;close all;
fileDir = 'D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\'; %ͼƬ�����ļ���
filePattern = [fileDir, '*.tif']; %ͼƬ��ʽ
dirOutput = dir(filePattern); %��ȡͼƬ�����ַ���
a = dirOutput; 
for i=1:40
        name2=['D:\�ļ�\matlab\Fourier_Descriptor\for_recognition\',a(i).name]; 
end