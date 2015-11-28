% prevent the previous plot from dessapearing
% when the next one comes forward
hold on;

markersize = 10;
linewidth = 2;

% load the dataset (x and y vectors)
% load('data/data1.mat');
load('data/data12.mat');

% plot the dataset
for i = 1:length(x)
    plot(x(i), y(i), 'b', 'markersize', markersize);
end;

% plot Lagrange
a = min(x);
b = max(x);
step = (b - a) / 100;

interval = [a:step:b];
plot(interval, lagrange(x, y, interval),
    'b', 'linewidth', linewidth);

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
    x0 = x_val(i);
    L = lagrange(x, y, x0);
    plot(x0, L, 'r', 'markersize', markersize);
    printf('L(%d) = %d\n', x0, L);
end;
