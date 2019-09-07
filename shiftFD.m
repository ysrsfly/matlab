function [G]=shiftFD(F, x, y)
G=F;
N=length(F);
G(1)=F(1) + N .* (x + y*i);
end 
 