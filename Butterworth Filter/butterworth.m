function filtered_signal = butterworth(input_signal, fs, low_cutoff, high_cutoff, order)
    % normalize cutoff frequencies
    nyquist = 0.5 * fs;
    low_cutoff_normalized = low_cutoff / nyquist;
    high_cutoff_normalized = high_cutoff / nyquist;

    % butterworth bandpass
    [b, a] = butter(order, [low_cutoff_normalized, high_cutoff_normalized], 'bandpass');

    % apply bandpass
    filtered_signal = filter(b, a, input_signal);
end