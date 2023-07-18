clc;
close all;
clear all;

bits = [1 0 1 1 0 1];
bitrate = 1;
n = 1000;

T = length(bits)/bitrate;
N = length(bits)*n;

dt = T/N;
t = 0:dt:T-dt

%Encoding

x = zeros(1, length(t));
half = n/2;

for i = 1:length(bits)
  if (bits(i) == 0)
    x((i-1)*n + 1 : half) = -5;
    x((half+1) : i*n) = 0;
  else
    x((i-1)*n + 1 : half) = 5;
    x((half+1) : i*n) = 0;
  endif
  half = half+n;
end

plot(t, x, 'Linewidth', 3);
title(['Polar RZ : [' num2str(bits) ']']);
grid on;

%Decoding

y = zeros(1, length(x)/n);
half = n/2;

for i = 1:length(y)
    if(x((i-1)*n + 1 : half) == -5)
        y(i) = 0;
    else
        y(i) = 1;
    endif
    half = half+n;
end

disp('Polar RZ Decoded signal : ');
disp(y);


