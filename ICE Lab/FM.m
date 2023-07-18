clc;
clear all;
close all;

Am = 2;
fm = 5;

Ac = 2;
fc = 50;

fs = 1000;
T = 5;
t = 0 : 1/fs : T - 1/fs;
%t = 0:0.001:1;

%Message signal

Message_signal = Am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t, Message_signal);
title("Message signal");

%Carrier signal;

Carrier_signal = Ac * sin(2*pi*fc*t);
subplot(4,1,2);
plot(t, Carrier_signal);
title("Carrier Signal")

%Modulation Signal;

%k = fc/Ac;
k = 20;
B = (k*Am)/fm;

Modulation_signal = Ac*sin(2*pi*fc*t + (B.*sin(2*pi*fm*t)));
subplot(4,1,3);
plot(t, Modulation_signal);
title("Modulation signal");

%Demodulation signal;

x = diff(Modulation_signal);
y = abs(x);
[b,a] = butter(10, 0.03);
Demodulation_signal = filter(b,a,y);

subplot(4,1,4);
plot(Demodulation_signal);
title("Demodulation Signal");
