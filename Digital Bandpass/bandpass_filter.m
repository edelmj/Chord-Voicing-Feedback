function filtered_signal = bandpass_filter(N, omegaL, omegaR, signal)
    % compute the Fourier transform of the signal
    spectrum = fft(signal);

    % frequency axis
    Fs = length(signal);
    omega = 2 * pi * (0:(Fs - 1))/Fs;

    % 1 for pass band
    Ad = (omega < omegaR) & (omega > omegaL);

    % define phid
    M = (N - 1)/2;
    phid = exp(-1i * M * omega);

    Hd = Ad .* phid;

    % apply the filter in the frequency domain
    filtered_spectrum = spectrum .* Hd;

    % take inverse Fourier transform to get the filtered signal
    filtered_signal = ifft(filtered_spectrum);
    filtered_signal = real(filtered_signal);
end