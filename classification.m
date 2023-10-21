function y = classification(x, freqRange)

    % get length of input signal
    N = length(x);

    % initialize zero array that will store band pass ranges
    ranges = zeros(N,2);

    % take fft of input signal x
    X = fft(x,N);

    % this loop is to append ranges with bounds for each frequency in freqRange
    for index = N
        % create lower and upper bounds for band pass
        % +- 1 is the tolerance of 1Hz
        lb = -freqRange(index) - 1; 
        ub = -freqRange(index) + 1;
        % update the values of A with lb and up
        ranges(index, 1) = lb;
        ranges(index, 2) = ub;
    end

    % initialize Nx2 array that stores the sorted bands
    classified = zeros(N, 2);

    for index = N
        % band pass filter for each frequency band in A
        bp = bandpass(x, [ranges(index, 1) ranges(index, 2)]);
        % determines percentage error between fft of input signal and
        % bandpass
        error = abs((X(index) - bp(index)) / bp(index));
        % set threshold error tolerance
        delta = 0.1;
        if error <= delta
            classified(index, 1) = bp;
            classified(index, 2) = freqRange(index);
        else
            classified(index, 1) = 0;
            classified(index, 2) = freqRange(index);
        end
    end
    y = classified;
end
