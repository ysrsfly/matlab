function edge = edge_M(m)
%ͨ����ʱ����������洢����
edgeIm = m;
%figure, imshow(edgeIm);

%edgeIm�з���Ԫ�ص����꣬����������
[i, j] = find(edgeIm);

%��������
numPoints = size(i, 1);
curNum = 0;

%��ʼ����������
currentR = i(1, 1);
currentC = j(1, 1);

%��ʼ������������
points = zeros(numPoints, 2);

%��ʼ����
curNum = curNum + 1;
points(curNum,:) = [currentR, currentC];
edgeIm(currentR, currentC) = 0;

while curNum ~= numPoints
 if edgeIm(currentR,currentC-1) == 1   %%��
    curNum = curNum + 1;
    currentC = currentC - 1;
    points(curNum,:) = [currentR, currentC];
    edgeIm(currentR, currentC) = 0;
 
 elseif edgeIm(currentR+1, currentC-1) == 1  %%����
             curNum = curNum + 1;
             currentR = currentR + 1;
             currentC = currentC - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
             
 elseif edgeIm(currentR+1, currentC) == 1   %%��
             curNum = curNum + 1;
             currentR = currentR + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0; 
 
  elseif edgeIm(currentR+1, currentC+1) == 1    %%����
             curNum = curNum + 1;
             currentR = currentR + 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
  elseif edgeIm(currentR, currentC+1) == 1  %%��
             curNum = curNum + 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
  elseif edgeIm(currentR-1, currentC+1) == 1    %%����
             curNum = curNum + 1;
             currentR = currentR - 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
   
 elseif edgeIm(currentR-1, currentC) == 1   %%��
             curNum = curNum + 1;
             currentR = currentR - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;

 elseif edgeIm(currentR-1, currentC-1) == 1 %%����
             curNum = curNum + 1;
             currentR = currentR - 1;
             currentC = currentC - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;

 end
end
edge = edgeIm;