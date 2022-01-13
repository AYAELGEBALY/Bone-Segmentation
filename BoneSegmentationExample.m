%% The segmentation example written in 02-10-2019
clc
clear all
close all
%% Read the Bone Image, visualize it and convert it to gray level image
I = imread('Bone2.jpg');
figure,subplot(2,1,1),imshow(I),title('RGB Image','fontsize',12)
I_gray = rgb2gray(I);
subplot(2,1,2),imshow(I_gray),title('Gray Level Image','fontsize',12,'color','blue')
%% Show the histogram of gray level image to define the threshold values
figure,subplot(2,1,1),hist(double(I_gray(:))),title('Histogram with 10 bins','fontsize',12)
subplot(2,1,2),hist(double(I_gray(:)),50),title('Histogram with 50 bins','fontsize',12)
%% The bone part and soft tissue segmented
I_temp1 = I_gray;
I_temp2 = I_gray;
I_temp1(find(I_gray>153)) = 255;% Bone segmentation
I_temp1(find(I_gray<=153)) = 0;
I_temp2(find(I_gray<153 & I_gray>90)) = 255;%Soft Tissue Segmentation
I_temp2(find(~(I_gray<153 & I_gray>90))) = 0;
figure,subplot(3,1,1),imshow(I_gray),title('Gray Level Original Image','fontsize',12)
subplot(3,1,2),imshow(I_temp1),title('Segmented Bone Part (White Pixels)','fontsize',12)
subplot(3,1,3),imshow(I_temp2),title('Segmented Soft Tissue (White Pixels)','fontsize',12)