function edge = edge_M(m)
%通过逆时针的轮廓来存储坐标
edgeIm = m;
%figure, imshow(edgeIm);

%edgeIm中非零元素的坐标，即轮廓坐标
[i, j] = find(edgeIm);

%轮廓点数
numPoints = size(i, 1);
curNum = 0;

%初始搜索点坐标
currentR = i(1, 1);
currentC = j(1, 1);

%初始化轮廓点坐标
points = zeros(numPoints, 2);

%开始搜索
curNum = curNum + 1;
points(curNum,:) = [currentR, currentC];
edgeIm(currentR, currentC) = 0;

while curNum ~= numPoints
 if edgeIm(currentR,currentC-1) == 1   %%左
    curNum = curNum + 1;
    currentC = currentC - 1;
    points(curNum,:) = [currentR, currentC];
    edgeIm(currentR, currentC) = 0;
 
 elseif edgeIm(currentR+1, currentC-1) == 1  %%左下
             curNum = curNum + 1;
             currentR = currentR + 1;
             currentC = currentC - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
             
 elseif edgeIm(currentR+1, currentC) == 1   %%下
             curNum = curNum + 1;
             currentR = currentR + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0; 
 
  elseif edgeIm(currentR+1, currentC+1) == 1    %%右下
             curNum = curNum + 1;
             currentR = currentR + 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
  elseif edgeIm(currentR, currentC+1) == 1  %%右
             curNum = curNum + 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
  elseif edgeIm(currentR-1, currentC+1) == 1    %%右上
             curNum = curNum + 1;
             currentR = currentR - 1;
             currentC = currentC + 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;
  
   
 elseif edgeIm(currentR-1, currentC) == 1   %%上
             curNum = curNum + 1;
             currentR = currentR - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;

 elseif edgeIm(currentR-1, currentC-1) == 1 %%左上
             curNum = curNum + 1;
             currentR = currentR - 1;
             currentC = currentC - 1;
             points(curNum,:) = [currentR, currentC];
             edgeIm(currentR, currentC) = 0;

 end
end
edge = edgeIm;