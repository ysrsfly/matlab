function z = frdescp(s,k)
s = 1i*s(:, 1) + s(:, 2);%%将坐标写成复数形式
N =length(s);%%边界点数
z =zeros(k,1);%%初始化矩阵存储傅里叶描述子
for i1 =1:k %%对傅里叶描述子进行DFT操作
    for n = 1:N
        z(i1) =z(i1)+s(n)*exp(-1i*2*pi*(i1-1)*(n-1)./N);%%傅里叶变换
    end
end
