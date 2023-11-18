function notes = identifyNotes(magnitude_spectrum, Fs)
    % identify notes based on peaks
    threshold = 0.1;
    freq_resolution = Fs / length(magnitude_spectrum);
    freq_peaks = find(magnitude_spectrum > threshold);
    notes = freqToNote(freq_peaks, freq_resolution);
end