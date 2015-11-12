function result = cs_rmse(t, y)
    %custom root mean square error
    diff = t - y;
    %mean square error
    mse = mean(diff .* diff);
    result = mse ^ 0.5;
end

