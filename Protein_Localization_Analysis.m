clc
clear all
close all
image = imread('HeLa-Actin.tif');
imshow(image)
[r c]=size(image)
info=imfinfo('HeLa-Actin.tif')

%%
clc
clear all
close all
A=imread('wt-mouse-intestine_DAB-heam.tif');
[R,G,B] = imsplit(A);
figure();
subplot(2,2,1);
imshow(R)
title('Red')
subplot(2,2,2);
imshow(G)
title('Green')
subplot(2,2,3);
imshow(B)
title('Blue');
DD=montage({R,G,B})
%%
clc
clear all
close all
image=imread('N1E.tif');
imshow(image)
colormap('lines')
%%
clc
clear all
close all
image=imread('wt-mouse-intestine_DAB-heam.tif');

B=imlocalbrighten(image,0.9);
figure()
montage({image,B})
C=imadjust(image,[.2 .3 0; .6 .7 1],[]);
figure()
montage({image,C})
figure()
subplot(1,3,1)
imhist(image);
subplot(1,3,2)
imhist(B);
subplot(1,3,3)
imhist(C);
%%
clc
clear all
close all
image=imread('ColiA.tif');
C=imadjust(image);
montage({image,C})
figure();
subplot(1,2,1);
imhist(image);
subplot(1,2,2);
imhist(C);
%% 
clc;
clear all;
close all;
information = imfinfo('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif');
numberofframes = length(information);
for F = 1 : numberofframes
    Image(:,:,F) = imread('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif', F);
end

% Answer 1
% Maximum and Minimum Intensity
Ma=max(Image(:));
mi=min(Image(:));
fprintf("Minimum and Maximum intensity of the given Images are %d and %d respectively \n",mi,Ma);
BD=information.BitDepth;
fprintf("BitDepth of the Image is %d bit \n", BD);
fprintf("Dimension of the Input Tiff file is %d X %d X ")

figure()
imshow(thisPage(:,:,1));
colormap('lines')

figure()
imshow(thisPage(:,:,3));
colormap('lines')



%%
clc
clear all
close all
%bfopen('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif')
%[data, timePoints, pixelSize, OMEmetadata, metadata]=extractChannels('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif',1,2);
[data, timePoints, pixelSize, OMEmetadata, metadata]=extractChannels('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif',1);

imshowpair(data{1,1}, data{1,2}, 'montage');
metadataKeys = metadata.keySet().iterator();
for i=1:metadata.size()
key = metadataKeys.nextElement();
value = metadata.get(key);
fprintf('%s = %s\n', key, value)
end


omeMetadata.getPixelsSizeX(0).getValue();
omeMetadata.getPixelsPhysicalSizeX(0).value(ome.units.UNITS.MICROMETER)
omeMetadata.getPixelsPhysicalSizeX(0).getSymbol();
omeMetadata.getPixelsSizeZ(0).getValue();

%% Assignement 2
clc;
clear all;
close all;
information = imfinfo('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif');
numberofframes = length(information);
for F = 1 : numberofframes
    Image(:,:,F) = imread('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif', F);
end

% Answer 1
% Maximum and Minimum Intensity
Ma=max(Image(:));
mi=min(Image(:));
fprintf("Minimum and Maximum intensity of the given Images are %d and %d respectively \n",mi,Ma);
BD=information.BitDepth;
fprintf("BitDepth of the Image is %d bit \n", BD);

[data, timePoints, pixelSize, OMEmetadata, metadata]=extractChannels('C:\Users\Dell\Downloads\bftoolbox\bftoolbox\images\RapaMycin_LMB1_SnailA.tif',1);


fprintf("The time interval is %f",timePoints(2));

fprintf("Dimension of the Input Tiff file is %d X %d X %d X %d",size(Image,2),size(Image,1),size(data,2),size(timePoints,1));
% question 3 and 4

figure()
imshowpair(data{1,1}, data{1,2}, 'montage')
colormap('hsv')
figure()
imshowpair(data{30,1}, data{30,2}, 'montage')
colormap('hsv')
figure()
imshowpair(data{60,1}, data{60,2}, 'montage')
colormap('hsv')
figure()
imshowpair(data{120,1}, data{120,2}, 'montage')
colormap('hsv')

% question 5

Q51=data{60,1};
Q52=data{60,2};
imtool();
montage({data{60,1},C})
