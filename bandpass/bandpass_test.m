fs = 1000;     % Sampling frequency
t = 0:1/fs:1;

% Generate a random test signal
rng(42);
input_signal = randn(size(t));

f_low = 40;
f_high = 60;
gain = 1;

% Apply bandpass filter
filtered_signal = bandpass_filter(input_signal, fs, f_low, f_high, gain);

% Plot the original and filtered signals in the frequency domain
figure;
subplot(2, 1, 1);
frequencies = linspace(0, fs/2, length(input_signal)/2);
input_spectrum = abs(fft(input_signal));
plot(frequencies, input_spectrum(1:length(frequencies)));
title('Original Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

subplot(2, 1, 2);
filtered_spectrum = abs(fft(filtered_signal));
plot(frequencies, filtered_spectrum(1:length(frequencies)));
title('Filtered Signal Spectrum');
xlabel('Frequency (Hz)');
ylabel('Amplitude');