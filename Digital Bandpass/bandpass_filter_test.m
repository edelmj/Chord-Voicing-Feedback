% Parameters
Fs = 10000;
T = 1/Fs;
duration = 1;

% generate a signal in the frequency domain
t = 0:T:duration-T;
frequencies = [200, 1500, 3000, 5000];
amplitudes = [1, 0.7, 0.5, 0.3];

signal = zeros(size(t));
for i = 1:length(frequencies)
    signal = signal + amplitudes(i) * sin(2 * pi * frequencies(i) * t);
end

% add noise
noise = 0.2 * randn(size(t));
noisy_signal = signal + noise;

% apply bandpass filter
N = 240;
omegaL = 1000 * 2 * pi / Fs;
omegaR = 4000 * 2 * pi / Fs;

filtered_signal = bandpass_filter(N, omegaL, omegaR, noisy_signal);

% plot frequency domain of original and filtered signals
figure;

% original signal
subplot(2, 1, 1);
plot(t, fftshift(abs(fft(noisy_signal))));
title('Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% filtered signal
subplot(2, 1, 2);
plot(t, fftshift(abs(fft(filtered_signal))));
title('Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% display the plot
sgtitle('Frequency Domain of Original and Filtered Signals');