audio_file = '/Users/julianedelman/Desktop/classification/cmaj.wav';

[fundamental_frequencies, fundamental_amplitudes, notes] = slidingFFT(audio_file, window_size, overlap_ratio, denoise_window);

% displaying results
disp('Fundamental Frequencies:');
disp(fundamental_frequencies);

disp('Fundamental Amplitudes:');
disp(fundamental_amplitudes);

disp('Notes:');
disp(notes);