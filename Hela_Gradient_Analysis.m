clc;
clear all;
close all;
% make sure you are in the IPQDA22_ASS_5_data folder
% add the subfolders to the Matlab environment
addPaths;
% location of the data, can be an absolute path as well
pathName = 'data';
% name of the data file
Name = '210501_OptoG011_04_OptoTIAM.tif';
% full name of the data file
fileName = fullfile(pathName, Name);

% reverse you can also extract path and file name using fileparts
% [pathName, Name] = fileparts(fileName);

% load series 1 and all 3 channels
data = extractChannels(fileName,1,[1 2]);

% get image and data size
[T,C] = size(data); % number of z-sclices (T) and channels (C) 
[H,W] = size(data{1,2}); % image height and width

% create array of the first channel
I = zeros(H,W,T);
for n=1:T
    I(:,:,n) = data{n,1};
end

% open the script gradient5.m, the code that gives the kernels for the
% first derivative in x and y-direction are in this original script we
% calculate this here manually
p = [0.037659  0.249153  0.426375  0.249153  0.037659];
d1 =[0.109604  0.276691  0.000000 -0.276691 -0.109604];
Gx = -(p'*d1);
Gy = -(d1'*p);

% calculate the Gradient in x and y-direction 
Ix = imfilter(I,Gx);
Iy = imfilter(I,Gy);

% plot the first frame for Ix
F = Ix(:,:,1);
fh = figure;
xh = axes;
ph = imagesc(F);
% select divergent LUT
map = lut('div_bwr');
% set the colormap
colormap(map);
% set the range 
r = [min(F(:)) max(F(:))];
clim =  [-max(abs(r)) max(abs(r))];
set(xh,'clim',clim);
title('Image with x gradient')

% plot the first frame for Iy

F = Iy(:,:,1);
fh = figure;
xh = axes;
ph = imagesc(F);
% select divergent LUT
map = lut('div_bwr');
% set the colormap
colormap(map);
% set the range 
r = [min(F(:)) max(F(:))];
clim =  [-max(abs(r)) max(abs(r))];
set(xh,'clim',clim);
title('Image with y gradient')

% .. 

% also calculate and plot the gradient magnitude

% Ix2=(Ix).^2;
% Iy2=(Iy).^2;
% Magnitude_grad=sqrt(Ix2+Iy2);
Magnitude_grad=imfilter(I,sqrt(Gx.^2+Gy.^2));
% plot the first frame for magnitude of gradient

F = Magnitude_grad(:,:,1);
fh = figure;
xh = axes;
ph = imagesc(F);
% select divergent LUT
map = lut('div_bwr');
% set the colormap
colormap(map);
% set the range 
r = [min(F(:)) max(F(:))];
clim =  [-max(abs(r)) max(abs(r))];
set(xh,'clim',clim);
title('Magnitude of gradient Image')


% .. 

% now design and apply a filter that caluclates gradients under any angle theta, e.g. 45
% degrees using a unit vector, v = [cos(theta) ; sin(theta)]
% check the definition on https://en.wikipedia.org/wiki/Directional_derivative#Using_only_direction_of_vector
theta = 45;
v = [cosd(theta) ; sind(theta)];
% directional gradient filter
grad = sqrt((Gx.*(v(1))).^2+ (Gy.*(v(2))).^2);

newimage_grad=imfilter(I,grad);

% plot the first frame for gradient with angle image

F = newimage_grad(:,:,1);
fh = figure;
xh = axes;
ph = imagesc(F);
% select divergent LUT
map = lut('div_bwr');
% set the colormap
colormap(map);
% set the range 
r = [min(F(:)) max(F(:))];
clim =  [-max(abs(r)) max(abs(r))];
set(xh,'clim',clim);
title('Magnitude of gradient Image (angle)')
% .. 

% 
