function  y = dft(x)
    N = length(x);
    kn = [0:N-1]';
    W = exp((-j * 2 * pi / N) * kn * kn');  
    y = W * x;
end