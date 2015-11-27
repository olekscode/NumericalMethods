% prevent the previous plot from dessapearing
% when the next one comes forward
hold on;

% load the dataset (a, b and f)
% load('data/data5.mat');
load('data/data12.mat');
% load('data/data19.mat');

step = abs(b - a) / 100;
interval = [a:step:b];

prec = 0.1;
x0 = (b - a) / 2;

linewidth = 2;
markersize = 10;

% plot the given function
plot(interval, f(interval),
	'b', 'linewidth', linewidth);

% plot the interpolated function
plot(interval, gauss1(f, step, x0, interval, prec),
	'r', 'linewidth', linewidth);

% get values to plot
satisfied = false;
while !satisfied
	printf('Input some x-values from the interval [%0.1f; %0.1f].\n', a, b);
	printf('Hint: Use Octave vector format to input more than one value.\n');
	x_val = input('');
	printf('\n');

	satisfied = true;

	for i = 1:length(x_val)
		if (x_val(i) < a || x_val(i) > b)
			printf('Your values exceed the interval. Try again\n\n');
			satisfied = false;
			break;
		endif;
	end;
end;

% plot requested values
for i = 1:length(x_val)
	x = x_val(i);
	y = gauss1(f, step, x0, x, prec);

	plot(x, f(x), 'b', 'markersize', markersize);
	plot(x, y, 'r', 'markersize', markersize);

	printf('L(%0.1f)     = %f\n', x, y);
	printf('Error[%0.1f] = %f\n', x, error(f(x), y));
end;