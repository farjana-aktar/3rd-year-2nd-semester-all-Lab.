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

voltage = 5;
x = zeros(1, length(t));

% 1 -> Negative
% 0 -> Positive

for i = 1:length(bits)
  if (bits(i) == 1)
    x((i-1)*n + 1 : i*n) = -voltage;
  else
    x((i-1)*n + 1 : i*n) = voltage;
  endif
end

%subplot(2,1,1);
plot(t, x, 'Linewidth', 3);
title('Encoded signal(Polar NRZ-L)');
axis([0 T -voltage-2 voltage+2]);
grid on;

%Decoding

y = zeros(1, length(x)/n);
for i = 1:length(y)
  if x((i-1)*n + 1) == -voltage
    y(i) = 1;
  endif
end

disp('Polar NRZ-L Decoded signal : ');
disp(y);

