%function [G]=scaleFD(F,scaleFactor) % F: The (non-normalised) Fourier descriptor of a contour % scaleFactor: Change in contour scale % G: The (non-normalised) Fourier descriptor of the scaled contour % Scales the contour corresponding to F by 100*scaleFactor %. 
% This operation does not require an (inverse) DFT! 
 
function [G]=scaleFD(F,scaleFactor)
G=100 .* scaleFactor .* F;
end