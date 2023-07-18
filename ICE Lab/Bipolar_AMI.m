clc;
close all;
clear all;

bits = [1 0 1 1 0 1];
bitrate = 1;
n = 1000;

T = length(bits)/bitrate;
N = length(bits)*n;

dt = T/N;
t = 0:dt:T-dt;

%Encoding

lastbit = 5;   %Assuming that the lastbit was (positive) 5;
x = zeros(1, length(t));

% 1 -> Alternative
% 0 -> Zero voltage level

for i = 1:length(bits)
  if (bits(i) == 1)
    x((i-1)*n + 1 : i*n) = lastbit * (-1);
    lastbit = lastbit * (-1);
  endif
end

plot(t, x, 'Linewidth', 3);
title(['Bipolar AMI Encoded signal : [' num2str(bits) ']']);
grid on;

%Decoding

y = zeros(1, length(x)/n);

for i = 1:length(y)
  if (x((i-1)*n + 1) ~= 0)
    y(i) = 1;
  endif
end

disp('Bipolar AMI Decoded signal : ');
disp(y);

