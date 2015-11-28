function [res, steps] = fixed_point_iteration(given_function, x_init)
    steps = [];

    x = x_init;
    next_x = given_function(x);

    while (abs(next_x - x) >= 10^(-6))
        x = next_x;
        next_x = given_function(x);
        steps = [steps x];
    end

    res = x;
end
