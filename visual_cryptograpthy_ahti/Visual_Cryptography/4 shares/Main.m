%Program for Construction of a two-out-of-two Visual Cryptography Scheme

%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in

%Program Description
%This program is the main entry of the application.
%This program generates a two-out-of-two Visual Cryptography Scheme shares.
%The input image for this program should be a binary image.
%The shares and the overlapping result of the shares are written as output.
%The Shares (1 & 2) can be printed in separate transparent sheets and overlapping them 
%reveals the secret image.

%Clear Memory & Command Window
clc;
clear all;
close all;
dbstop if error;

%Read Input Binary Secret Image
inImg = imread('banana.jpg');
figure;imshow(inImg);title('Original image');
%when testing with two other different image(road and starbucks)
%I have added two lines - 29 and 30 to make image suit for the program
%--samson
inImg = inImg(:,:,1);
inImg = logical(inImg);

%Visual Cryptography

[share1, share2, share3,share4,share12,share13,share14,share34,share24,share123,share124,share234,share134,share1234] = VisCrypt_2(inImg);
%Outputs
figure;imshow(share1);title('Share 1');
figure;imshow(share2);title('Share 2');
figure;imshow(share3);title('share 3');
figure;imshow(share4);title('share 4');
figure;imshow(share12);title('Overlapping Share 1 & 2');
figure;imshow(share13);title('Overlapping Share 1 & 3');
figure;imshow(share14);title('Overlapping Share 1 & 4');
figure;imshow(share34);title('Overlapping Share 3 & 4');
figure;imshow(share24);title('Overlapping Share 2 & 4');
figure;imshow(share124);title('Overlapping Share 1 & 2 & 4');
figure;imshow(share234);title('Overlapping Share 2 & 3 & 4');
figure;imshow(share134);title('Overlapping Share 1 & 3 & 4');
figure;imshow(share123);title('Overlapping Share 1 & 2 & 3');
figure;imshow(share1234);title('Overlapping Share 1 & 2 & 3 & 4');

imwrite(share1,'Share1.bmp');
imwrite(share2,'Share2.bmp');
imwrite(share3,'Share3.bmp');
imwrite(share4,'Share4.bmp');
imwrite(share12,'Share12.bmp');
imwrite(share34,'Share34.bmp');
imwrite(share13,'Share13.bmp');
imwrite(share123,'Share123.bmp');
imwrite(share1234,'Overlapped.bmp');