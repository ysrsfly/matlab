clc;clear ;close all;
all_faces=[];
for i=1:40    
    for j=1:8        
        a=imread(strcat('C:\Users\25227\Desktop\图像\att_faces\s',num2str(i),'\',num2str(j),'.pgm'));
        b=a(1:112*92); % 将读入的图像矩阵拉成一行        
        b=double(b);        
        all_faces=[all_faces; b];  % all_faces中每一行数据代表一张人脸，共320行   
    end
end 
        ave_face=mean(all_faces); % 平均脸 
        figure(1)
        imshow_file = mat2gray(reshape(ave_face,112,92));%矩阵转换为灰度图像
        imshow(imshow_file);%得到平均脸
        title('平均脸');

for i=1:320 %%每组数据取前8张，一共8*40=320张人脸
    diff_face(i,:)=all_faces(i,:)-ave_face; % mean_face每一行是“每个人脸-平均脸” 得到差值数据矩阵
end

        C=diff_face*diff_face';     %计算协方差矩阵C
        [v,d]=eig(C);               %求特征向量V，[V,D] = eig(A) 返回特征值的对角矩阵 D 和矩阵 V，其列是对应的右特征向量，使得 A*V = V*D
        d1=diag(d);                 %提取对角矩阵d的特征值，D = diag(v) 返回包含主对角线上向量 v 的元素的对角矩阵。
        [~,index]=sort(d1);         %以升序排序特征值 
        column=size(v,2);           % 特征向量矩阵的列数

        %对特征向量进行降序排列
        for i=1:column      
            vsort(:,i) = v(:,index(column-i+1)); % vsort 保存的是按降序排列的特征向量,每一列构成一个特征向量      
            dsort(i)   = d1(index(column-i+1));  % dsort 保存的是按降序排列的特征值 
        end  

        %以保留累计相加特征值占90%的特征值
        dsum = sum(dsort);     
        dsum_extract = 0;   
        p = 0;     
        while( dsum_extract/dsum < 0.9)       
            p = p + 1;          
            dsum_extract = sum(dsort(1:p));     
        end
        
        i=1;  % 计算特征脸形成的坐标系
        while (i<=p )      
              base(:,i) = diff_face' * vsort(:,i);   %求解特征脸 即将人脸投影至新的维度上
              i = i + 1; 
        end   
        

        figure(2)
        for i=1:16
        subplot(4,4,i)
        imshow(mat2gray(reshape(base(:,i),112,92)));
        end
        suptitle('前16个的特征脸');

        all_projection = all_faces * base;    % 将训练样本对得到的新坐标系上进行投影

                [file,path] = uigetfile('*.pgm');
                if isequal(file,0)
                    disp('用户选择取消！');
                else
                    disp(['用户选择了 ', fullfile(path,file)]);
                end

                a=imread(fullfile(path,file));        
                figure(4)
                imshow(a);
                title("选择的图像为");
                
                b=a(1:10304);        
                b=double(b);        
                test_projection= b * base; %计算投影     

                for k=1:320                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %计算与所有训练图像的距离     
                end

                %三阶近邻法判别
                [~,index_3]=sort(mdist);            %找到距离最小的三个       
                class1=floor((index_3(1)-1)/8)+1;  %确定每个序号所在的组   
                class2=floor((index_3(2)-1)/8)+1;        
                class3=floor((index_3(3)-1)/8)+1;        

                %判断
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end
        
        figure(3)
        im_show = imread(strcat('C:\Users\25227\Desktop\图像\att_faces\s',num2str(ID),'\','1.pgm'));
        imshow(im_show);
        title("匹配的人像为");
                
        fprintf('PCA分析结果为用户选择的是第%d组的人脸图像\n',ID);
        fprintf('*********开始用测试数据计算识别准确度*********\n');
        fprintf('****每组图像的前8张用于训练，后两张用于测试****\n');
            
        %训练数据的准确度计算
           accu = 0; 
           for i=1:40 
              for j =9:10
                   a=imread(strcat('C:\Users\25227\Desktop\图像\att_faces\s',num2str(i),'\',num2str(j),'.pgm'));                         
                b=a(1:10304);        
                b=double(b);        
                test_projection= b * base; %计算坐标，是1×p阶矩阵      
                for k=1:320                 
                    mdist(k)=norm(test_projection-all_projection(k,:));   %计算与所有训练图像的距离     
                end
                 %三阶近邻法判别
                [~,index_3]=sort(mdist);            %找到距离最小的三个       
                class1=floor((index_3(1)-1)/8)+1;  %确定每个序号所在的组   
                class2=floor((index_3(2)-1)/8)+1;        
                class3=floor((index_3(3)-1)/8)+1;        
                %判断
                if class1~=class2 && class2~=class3 
                    ID=class1;         
                elseif class1==class2          
                    ID=class1;         
                elseif class2==class3     
                    ID=class2;         
                end

                if ID==i
                    accu=accu+1;     %计算准确度   
                end  
             end
           end  
           fprintf('图像的识别准确度为%3.2f\n',accu/80);