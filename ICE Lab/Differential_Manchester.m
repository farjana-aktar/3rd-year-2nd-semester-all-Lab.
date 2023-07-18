clc;
close all;
clear all;

bits = [1 0 1 0 0 1];
bitrate = 1;
n = 1000;

T = length(bits)/bitrate;
N = length(bits)*n;

dt = T/N;
t = 0:dt:T-dt;

%Encoding

lastbit = 5 % Assuming that the lastbit was (Positive) 5;
x = zeros(1, length(t));
half = n/2;

% 0 -> Transition
% 1 -> No Transition

for i = 1:length(bits);
  if (bits(i) == 1)
    x((i-1)*n + 1 : half) = lastbit;
    x((half+1) : i*n) = lastbit * (-1);
    lastbit = lastbit * (-1);
  else
    %lastbit = lastbit * (-1);
    x((i-1)*n + 1 : half) = lastbit*(-1);
    x((half+1) : i*n) = lastbit;
    %lastbit = lastbit * (-1);
  endif
  half = half+n;
end

plot(t, x, 'Linewidth', 3);
title(['Differential Manchester signal : [' num2str(bits) ']']);
grid on;

%Decoding

y = zeros(1, length(x)/n);
half = n/2;
lastbit =5

for i = 1:length(y)
  if x((i-1)*n + 1) == lastbit;
    y(i) = 1;
    lastbit = lastbit * (-1);
  endif
end

disp('Decoded Differential Manchester Signal : ');
disp(y);

