%Program for Construction of a two-out-of-two Visual Cryptography Scheme

%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in

%Program Description
%This program generates a two-out-of-two Visual Cryptography Scheme shares.
%The input image for this program should be a binary image.
%The shares and the overlapping result of the shares are written as output.
%
%Usage:
%Input: inImg - A binary image
%Output: share1  - Generated share 1
%        share2  - Generated share 2
%        share12 - Overlapped result of shares 1 & 2

function [share1, share2, share12] = VisCrypt(inImg)

s = size(inImg);
%create a row(j) by 2xcol(i) "0" matrix
%black colour matrix
share1 = zeros((2*s(1)), (2 * s(2)));
share2 = zeros((2*s(1)), (2 * s(2)));


%%White Pixel Processing
%White Pixel share combinations
disp('White Pixel Processing...');
s1a=[1 0];
s1b=[1 0];
%find all the white colour pixel
%return with x-rows and y-columns
[x,y] = find(inImg == 1);
len = length(x);

for i=1:len
    a=x(i);b=y(i);
    pixShare =generateShare(s1a,s1b);
    share1((2*a-1):(2*a),(2*b-1):(2*b)) = pixShare(1:2,1:2);
    share2((2*a-1):(2*a),(2*b-1):(2*b)) = pixShare(1:2,1:2);
    %when a = 1 and b = 1
    %pixshare = [1 0    or [0 1
    %            1 0]       0 1]
    %share1(1,1:2) = pixshare(1,1:2)
    %share1 row 1 col 1~2 will become [1 0]
    %share2 row 1 col 1~2 will become [1 0]
end

%Black Pixel Processing
%Black Pixel share combinations
disp('Black Pixel Processing...');
s0a=[1 0];
s0b=[0 1];
%return with x-rows and y-columns
[x y] = find(inImg == 0);
len = length(x);

for i=1:len
    a=x(i);b=y(i);
    pixShare=generateShare(s0a,s0b);
    share1((2*a-1):(2*a),(2*b-1):(2*b)) = pixShare(1:2,1:2);
    share2((2*a-1):(2*a),(2*b-1):(2*b)) = ~pixShare(1:2,1:2);
end

share12=bitor(share1, share2);
share12 = ~share12;
disp('Share Generation Completed.');