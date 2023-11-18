
function [fundamental_frequencies, fundamental_amplitudes, notes] = slidingFFT(audio_file, window_size, overlap_ratio, denoise_window)

    [y, Fs] = audioread(audio_file);

    shift_size = round(window_size * (1 - overlap_ratio) * Fs);
    num_samples = length(y);
    num_windows = floor((num_samples - window_size * Fs) / shift_size) + 1;

    fundamental_frequencies = zeros(num_windows, 1);
    fundamental_amplitudes = zeros(num_windows, 1);
    notes = cell(num_windows, 1);

    % processing for each window
    for i = 1:num_windows
        start_index = (i - 1) * shift_size + 1;
        end_index = start_index + window_size * Fs - 1;

        current_window = y(start_index:end_index);

        % denoising
        denoised_signal = denoise(current_window, denoise_window);

        fft_result = fft(denoised_signal);

        % taking only frequencies
        magnitude_spectrum = abs(fft_result(1:round(window_size * Fs / 2) + 1));

        % find the index of the maximum amplitude
        [~, max_index] = max(magnitude_spectrum);

        % extract fundamental
        fundamental_frequencies(i) = max_index * Fs / (window_size * Fs);

        % extract amplitude of fundamental
        fundamental_amplitudes(i) = magnitude_spectrum(max_index);

        % identify notes from peaks
        notes{i} = identifyNotes(magnitude_spectrum, Fs);

        % Adding a pause to mimic real-time processing
        pause(window_size - 0.1);
    end
end