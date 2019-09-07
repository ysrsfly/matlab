function edge_detect = edge_detect(I0)
BW5=edge(I0,'Canny',0.2);
% subplot(236);
% imshow(BW5);
% title('CannyËã×Ó±ßÔµ¼ì²â')