function y = AmplitudeAdjustment(x, alertThreshold, scale_factor, Fs)
    % frequency band division
    lowFreq = 100;
    highFreq = 10000;

    % amplitude scaling for alerts
    x_scaled = scaleAlerts(x, alertThreshold, scale_factor);

    % equalization for speech
    x_equalized = equalizeSpeech(x_scaled, lowFreq, highFreq, Fs);

    % equalization for low and high frequencies
    y = equalizeLowHigh(x_equalized, lowFreq, highFreq, Fs);
end