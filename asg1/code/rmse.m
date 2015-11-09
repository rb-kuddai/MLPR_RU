function error = rmse(t, y)
    %assume y and are column vectors
    N = size(t, 1);
    diff = t - y;
    sqr_errors = diff' * diff;
    avg_sqr_errors = sqr_errors / N;
    error = avg_sqr_errors ^ 0.5;
end