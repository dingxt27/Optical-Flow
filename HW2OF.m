clc
clear all;
I1 = imread('C:\Users\dingx\Vision_HW2\hw2q1\sphere\sphere.0.ppm');
I2 = imread('C:\Users\dingx\Vision_HW2\hw2q1\sphere\sphere.1.ppm');
% % 
% I1 = imread('C:\Users\dingx\Vision_HW2\hw2q1\corridor\bt.001.pgm');
% I2 = imread('C:\Users\dingx\Vision_HW2\hw2q1\corridor\bt.000.pgm');
% I1 = imread('C:\Users\dingx\Vision_HW2\hw2q1\synth\synth_001.pgm');
% I2 = imread('C:\Users\dingx\Vision_HW2\hw2q1\synth\synth_000.pgm');
% 
%rgb to gray scale
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);

% imshowpair(I1, I2, 'montage')

% 
I1 = im2double(I1);
I2 = im2double(I2);

 [u1,v1] = optical_flow(I1,I2,15);
 [u2,v2] = optical_flow(I1,I2,21);
 % downsize u and v
U1 = u1(1:10:end, 1:10:end);
V1 = v1(1:10:end, 1:10:end);

U2 = u2(1:10:end, 1:10:end);
V2 = v2(1:10:end, 1:10:end);
% % get coordinate for u and v in the original frame
[m, n] = size(I1);
[X,Y] = meshgrid(1:n, 1:m);
x = X(1:10:end, 1:10:end);
y = Y(1:10:end, 1:10:end);
% 
figure();
subplot(1,2,1);
imshow(I2);
title('window size 15*15')
hold on;
% % draw the velocity vectors
quiver(x, y, U1,V1, 'y');
% % 
hold on;

% figure();
subplot(1,2,2);
imshow(I2);
title('window size 21*21')
hold on;
% % draw the velocity vectors
quiver(x, y, U2,V2, 'r');

