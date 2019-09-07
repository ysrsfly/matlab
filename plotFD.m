%function plotFD(F) %   F: The (non-normalised) Fourier descriptor of a contour 
% Plots the contour U described by F 
 
function plotFD(F)
len = length(F);
if (len > 0)
    U = ifft(F);
    U = [U U(1)];
    plot(U);
end
end