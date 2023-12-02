% test program
audio_file = '/Users/julianedelman/Desktop/classification/cmaj.wav';
window_size = 1024;
overlap_ratio = 0.5;
denoise_window = 5;

% slidingFFT
[fundamental_frequencies, fundamental_amplitudes, notes] = slidingFFT(audio_file, window_size, overlap_ratio, denoise_window);

% expected notes and amplitudes for comparison
expected_notes = [1, 1; 1, 1; 1, 2];

disp('fundamental_frequencies:');
disp(fundamental_frequencies);

disp('fundamental_amplitudes:');
disp(fundamental_amplitudes);

disp('expected_notes:');
disp(expected_notes);

% comparison and feedback
processNotesFeedback(fundamental_frequencies, fundamental_amplitudes, notes, expected_notes);