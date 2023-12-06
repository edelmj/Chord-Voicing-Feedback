function y = equalizeLowHigh(x, lowFreq, highFreq, Fs)
    N = length(x);
    % normalize frequency
    f = linspace(0, 1, N);  
    % create uniform vector with amplitude 1
    equalizationCurve = ones(size(f));

    % finding indices for low and high frequencies
    low_indices = find(f < lowFreq/Fs);
    high_indices = find(f > highFreq/Fs);

    % boost frequencies for low and high frequencies
    equalizationCurve(low_indices) = 0.1;  % Reduce amplitude for low frequencies
    equalizationCurve(high_indices) = 0.1; % Boost amplitude for high frequencies

    % transform the signal to the frequency domain
    X = fft(x);

    % apply equalization in the frequency domain
    Y = X .* equalizationCurve;

    % transform the result back to the time domain
    y = ifft(Y, 'symmetric');
end