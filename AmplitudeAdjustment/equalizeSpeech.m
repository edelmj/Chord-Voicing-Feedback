function y = equalizeSpeech(x, lowFreq, highFreq, Fs)
    N = length(x);
    % normalize frequency
    f = linspace(0, 1, N);  
    % create uniform vector with amplitude 1
    equalizationCurve = ones(size(f));

    % finding indices for mid range frequencies
    speech_indices = find(f >= lowFreq/Fs & f <= highFreq/Fs);
    % boost frequencies in the speech range
    equalizationCurve(speech_indices) = 2;

    % transform the signal to the frequency domain
    X = fft(x);

    % apply equalization in the frequency domain
    Y = X .* equalizationCurve;

    % transform the result back to the time domain
    y = ifft(Y, 'symmetric');
end