function filtered_signal = bandpass_filter(input_signal, fs, f_low, f_high, gain)
    % Compute filter parameters
    w0 = 2 * pi * sqrt(f_low * f_high);
    bandwidth = f_high - f_low;
    Q = w0 / bandwidth;

    % Transfer Function
    num = [gain * w0/Q, 0];
    den = [1, w0/Q, w0^2];
    sys = tf(num, den);

    % Frequency response of the filter
    [mag,~,~] = bode(sys, 2 * pi * linspace(0, fs/2, length(input_signal)));

    % Apply filter to the input signal
    input_spectrum = fft(input_signal);
    filtered_spectrum = input_spectrum .* reshape(mag, size(input_spectrum));
    filtered_signal = ifft(filtered_spectrum);
end