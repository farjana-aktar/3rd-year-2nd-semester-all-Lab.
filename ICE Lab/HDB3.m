clc;
close all;
clear all;

bits = [1 0 0 0 0 0 0 0 0 1 0 0 0 0];
bitrate = 1;

n = 1000;
T = length(bits)/bitrate;
N = length(bits)*n;

dt = T/N;
t = 0:dt:T;

%Encoding

lastbit = 1;
counter = 0;
pulse = 0

x = zeros(1, length(t));

for i=1:length(bits)
  if bits(i) == 0
    counter = counter+1;

    if counter == 4
      if (mod(pulse, 2) == 0)
        x((i-1-3)*n+1 : (i-3)*n) = -lastbit;
        lastbit = -lastbit;
        x((i-1-2)*n+1 : (i-2)*n) = 0;
        x((i-1-1)*n+1 : (i-1)*n) = 0;
        x((i-1)*n+1 : (i*n)) = lastbit;

        counter = 0;
        pulse = 0;
      else
        x((i-1-3)*n+1 : (i-3)*n) = 0;
        x((i-1-2)*n+1 : (i-2)*n) = 0;
        x((i-1-1)*n+1 : (i-1)*n) = 0;
        x((i-1)*n+1 : (i*n)) = lastbit;

        counter = 0;
        pulse = 0;
      endif
    endif

  else
     counter = 0;
     x((i-1)*n+1 : (i*n)) = -lastbit;
     lastbit = -lastbit;
     pulse = pulse+1;
  endif
end

plot(t, x, 'Linewidth',3);
grid on;
title('Encoded HDB3');

%Decoding

counter = 0;
lastbit = 1;

for i=1:length(t)
  if t(i)>counter

    counter = counter+1;
    if x(i) == lastbit
      result(counter-3 : counter) = 0;
    else
      if x(i) == 0
        result(counter) = 0;
      else
        result(counter) = 1;
        lastbit = -lastbit;
      endif
    endif
  endif
end

disp('HDB3 Decoding : ');
disp(result);



