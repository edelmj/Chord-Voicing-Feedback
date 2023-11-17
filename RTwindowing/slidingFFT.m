function fft_data = slidingFFT(audio_file, window_size, overlap_ratio)
    
    % read audio_file
    [y, Fs] = audioread(audio_file);

    shift_size = round(window_size * (1 - overlap_ratio) * Fs);
    num_samples = length(y);
    num_windows = floor((num_samples - window_size * Fs) / shift_size) + 1;

    fft_data = zeros(num_windows, round(window_size * Fs / 2) + 1);

    % Process each window
    for i = 1:num_windows

        start_index = (i - 1) * shift_size + 1;
        end_index = start_index + window_size * Fs - 1;

        current_window = y(start_index:end_index);

        fft_result = fft(current_window);

        % taking only frequencies
        magnitude_spectrum = abs(fft_result(1:round(window_size * Fs / 2) + 1));

        % store the magnitude in the output fft_data
        fft_data(i, :) = magnitude_spectrum;

        % adding a pause to mimic real-time processing
        pause(window_size - 0.1);
    end
end