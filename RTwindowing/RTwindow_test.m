
file_path = 'Novembers - Come Over.wav';

window_size = 0.5; 
overlap_ratio = 0.5;

fft_data = slidingFFT(file_path, window_size, overlap_ratio);

disp(fft_data);