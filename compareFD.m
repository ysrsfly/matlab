%function [diff]=compareFD(F, G) % F: Normalised, invariant Fourier descriptor % G: Normalised, invariant Fourier descriptor % diff: A measure of the difference between F and G 
% Quantifies the difference between F and G (see lecture notes) 
 
function [diff]=compareFD(F, G)
diff = -1;
if (length(F) == length(G))
    diff = sum((abs(F-G)) .^ 2);
end
end