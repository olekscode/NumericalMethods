% prevent the previous plot from dessapearing
% when the next one comes forward
hold on;

markersize = 10;
linewidth = 2;

a = 0;
b = 10;
step = (b - a) / 100;

% plot given functions
interval = [a:step:b];

plot(interval, func1(interval, interval), 'r', 'linewidth', linewidth);
plot(interval, func2(interval, interval), 'b', 'linewidth', linewidth);
plot(interval, func1_mod(interval, interval), 'g', 'linewidth', linewidth);
plot(interval, func2_mod(interval, interval), 'y', 'linewidth', linewidth);

% get values to plot
satisfied = false;
while !satisfied
	printf('Input two initial x-values from the interval [%0.1f; %0.1f].\n',
		a, b);
	printf('Hint: Use Octave vector format.\n');
	x_init = input('');
	printf('\n');

	satisfied = true;

	for i = 1:2
		if (x_init(i) < a || x_init(i) > b)
			printf('Your values exceed the interval. Try again\n\n');
			satisfied = false;
			break;
		endif;
	end;
end;

% plot requested values
plot(x_init(1), func1(x_init(1), x_init(2)), 'r', 'markersize', markersize);
plot(x_init(2), func2(x_init(2), x_init(2)), 'b', 'markersize', markersize);

prec = 0.000001;

[x1, x2, steps] = fixed_point_iter(x_init(1), x_init(2), prec);
printf('Fixed point iteration:\n');
printf('\tx = [%f; %f]\n', x1, x2);
printf('\tSteps: %d\n\n', steps);

[x1, x2, steps] = newton(x_init(1), x_init(2), prec);
printf("Newton's method:\n");
printf('\tx = [%f; %f]\n', x1, x2);
printf('\tSteps: %d\n\n', steps);

[x1, x2, steps] = newton_mod(x_init(1), x_init(2), prec);
printf("Modified Newton's method:\n");
printf('\tx = [%f; %f]\n', x1, x2);
printf('\tSteps: %d\n\n', steps);