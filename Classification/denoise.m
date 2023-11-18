function denoised_signal = denoise(input_signal, window_size)
    % moving average filter
    ma_filtered_signal = movmean(input_signal, window_size);
    % median filter for the ma
    denoised_signal = medfilt1(ma_filtered_signal, window_size);
end