%Program for random permuting the share generation

%Author : Athi Narayanan S
%M.E, Embedded Systems,
%K.S.R College of Engineering
%Erode, Tamil Nadu, India.
%http://sites.google.com/site/athisnarayanan/
%s_athi1983@yahoo.co.in

%Program Description
%This program generates the share 1 & share 2 randomly for each pixel. 

function out = generateShare(a,b)
%white: a = s1a   b=s1b
%black: a = s0a   b=s0b 

%white pixel s1a=[1 0] 
%            s1b=[1 0]

%black picel s0a=[1 0]
%            s0b=[0 1]
a1 = a(1); %W:1  B:1
a2 = a(2); %W:0  B:0
b1 = b(1); %W:1  B:0
b2 = b(2); %W:0  B:1
%put top row with "a" vector, bot row with "b" vector
in = [a     %W:[1 0   B:[1 0
      b];   %W: 1 0]  B: 0 1]

  %create a 2 by 2 "0" matrix
 out = zeros(size(in));

%rand(1)=>create 1 by 1 random number 
%floor(X) round up X to the nearest integers towards minus infinity
%0.0~0.9999....(<1) = 0  and 1.0 ~ 1.9999(<2) = 1
randNumber = floor(1.9*rand(1));

if (randNumber == 0)
    out = in;
elseif (randNumber == 1)
    a(1) = a2; %W:0 B:0
    a(2) = a1; %W:1 B:1
    b(1) = b2; %W:0 B:1
    b(2) = b1; %W:1 B:0
    
    out = [a   %W:[0 1]  %B:[0 1]
           b]; % :[0 1]     [1 0]
end