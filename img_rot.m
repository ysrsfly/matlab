clc;clear;close all;
for i =0:9
    I = imread(strcat('std_',num2str(i),'.tif'));
    I=rot90(I);
    imwrite(rot90(I),strcat('for_recognition\std_',num2str(i),'rot180.tif'));
end