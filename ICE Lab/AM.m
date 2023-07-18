clc;
clear all;
close all;

Am = 1;
fm = 2;

Ac = 2;
fc = 50;

fs = 1000;
T = 5;
t = 0 : 1/fs : T - 1/fs;
%t = 0:0.001:3;

%k = pi/2;
%k=16;

%Message signal

Message_signal = Am*sin(2*pi*fm*t);
subplot(4,1,1);
plot(t, Message_signal);
title("Message signal");

%Carrier signal;

Carrier_signal = Ac * cos(2*pi*fc*t);
subplot(4,1,2);
plot(t, Carrier_signal);
title("Carrier Signal")

%Modulation Signal;

k = Am/Ac;
Modulation_signal = (1+k.*Message_signal).*Carrier_signal;
subplot(4,1,3);
plot(t, Modulation_signal);
title("Modulation signal");

%Demodulation signal;

Demodulation_signal = (1/pi)*(Ac+Message_signal);

subplot(4,1,4);
plot(Demodulation_signal);
title("Demodulation Signal");
