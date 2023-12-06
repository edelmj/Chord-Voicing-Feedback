function y = scaleAlerts(x, alertThreshold, scale_factor)
    % check is maximum amplitude of signal is above threshold
    if max(abs(x)) > alertThreshold
        y = x * scale_factor;
    else
        y = x;
    end
end