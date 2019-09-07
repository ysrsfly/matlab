function readYaleDataset(dataDir, saveName)
	dirs = dir('C:\Users\25227\Desktop\ͼ��\CroppedYale\CroppedYale');
	data = [];
	labels = [];
	for i = 3:numel(dirs)
		imgDir = dirs(i).name;
		imgDir = fullfile('C:\Users\25227\Desktop\ͼ��\CroppedYale\CroppedYale', imgDir);
		imgList = dir(fullfile(imgDir, '*.pgm'));
		for j = 1:numel(imgList)
			imgName = imgList(j).name;
			if strcmp('Ambient.pgm',  imgName(end-10:end))
				continue;
			end
			im = imread(fullfile(imgDir, imgName));
			if size(im, 3) ==3
				im = rgb2gray(im);
			end
			im = imresize(im, [32 32]);
			im = reshape(im, 32*32, 1);
			data = [data im];
		end
		labels = [labels ones(1, numel(imgList)-1) * (i-2)];
	end
	save('C:\Users\25227\Desktop\t.jpg', 'data', 'labels');
end