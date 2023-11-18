% generate basic signal
t = 0:0.01:5;
song_signal = sin(2*pi*50*t) + 0.5*sin(2*pi*120*t);

% add white noise to the signal
white_noise = 0.3*randn(size(t));
noisy_signal = song_signal + white_noise;

% window size of moving average filter
window_size = 5;

% denoise
denoised_signal = denoise(noisy_signal, window_size);

% plot signal with white noise and denoised
figure;
subplot(2,1,1);
plot(t, noisy_signal, 'r', 'LineWidth', 1.5);
title('Signal with White Noise');

subplot(2,1,2);
plot(t, denoised_signal, 'g', 'LineWidth', 1.5);
title('Denoised Signal');

xlabel('Time (s)');
ylabel('Amplitude');