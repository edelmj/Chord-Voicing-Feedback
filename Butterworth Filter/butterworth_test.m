% Test program
fs = 44100;
low_cutoff = 100;
high_cutoff = 1000;
order = 4;

% generate an input signal
t = 0:1/fs:1;
input_signal = sin(2*pi*100*t);

% apply bandpass
filtered_signal = butterworth(input_signal, fs, low_cutoff, high_cutoff, order);

% display frequency response of filter
figure;
freqz(b, a, 1024, fs);
title('Frequency Response of Butterworth Filter');