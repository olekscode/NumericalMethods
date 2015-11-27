% Plot the functions to deduce x_init

x1_init = 1.5;
x2_init = 1.5;
prec = 0.001;

% [x1, x2, steps] = fixed_point_iter(x1_init, x2_init, prec);
% disp(x1);
% disp(x2);
% disp(steps);

[x1, x2, steps] = newton_mod(x1_init, x2_init, prec);
disp(x1);
disp(x2);
disp(steps);