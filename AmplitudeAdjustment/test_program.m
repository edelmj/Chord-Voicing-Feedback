% Test program

[ynoise,Fs1] = audioread('siren_original.wav');
ynoise = transpose(ynoise);

% Parameters
alertThreshold = 0.7;
scale_factor = 0.1;
thresholdValue = 0.7;
ratioValue = 4;

% generate a noisy signal with additional sinusoids
t = 0:1/Fs:1;  
frequency_original = 500;
amplitude_original = 0.5;
x_original = amplitude_original * sin(2 * pi * frequency_original * t);

% additional sinusoids
frequency_sinusoids = [30, 200, 1000];
amplitude_sinusoids = [0.5, 0.3, 0.5];

% adding additional sinusoids to the original signal
x_with_sinusoids = x_original;
for i = 1:length(frequency_sinusoids)
    x_with_sinusoids = x_with_sinusoids + amplitude_sinusoids(i) * sin(2 * pi * frequency_sinusoids(i) * t);
end

% Normalize the signal to have maximum amplitude of 1
x_with_sinusoids = x_with_sinusoids / max(abs(x_with_sinusoids));
x_with_sinusoids = x_with_sinusoids / 10000;
ynoise = ynoise / 10000;

% Apply smart hearing aid functions with updated compression parameters
% y = AmplitudeAdjustment(x_with_sinusoids, alertThreshold, scale_factor, Fs);
y = AmplitudeAdjustment(ynoise, alertThreshold, scale_factor, Fs);

% Normalize the processed signal to have maximum amplitude of 1
y = y / max(abs(y));

audiowrite('test_cleaned.wav',y,Fs);

y = y/10000;

% Plot both original and processed signals in the frequency domain
figure;

% Original signal plot in the frequency domain
subplot(2, 1, 1);
f_orig = linspace(0, Fs/2, length(ynoise)/2);
X_orig = fft(ynoise);
plot(f_orig, abs(X_orig(1:length(f_orig))));
title('Original Signal Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Processed signal plot in the frequency domain
subplot(2, 1, 2);
f_processed = linspace(0, Fs/2, length(y)/2);
Y_processed = fft(y);
plot(f_processed, abs(Y_processed(1:length(f_processed))));
title('Processed Signal Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');