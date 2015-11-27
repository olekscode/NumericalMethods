% prevent the previous plot from dessapearing
% when the next one comes forward
hold on;

% load the dataset: [a, b] and f
% load('data/data5.mat');
load('data/data12.mat');
% load('data/data19.mat');

step = abs(b - a) / 100;
interval = [a:step:b];
prec = 0.1;

linewidth = 2;

plot(interval, f(interval),
	'b', 'linewidth', linewidth);

% plot(interval, gauss1(f, step, a, interval, prec),
% 	'r', 'linewidth', linewidth);

% plot(interval, gauss1(f, step, b, interval, prec),
% 	'r', 'linewidth', linewidth);

plot(interval, gauss1(f, step, (b - a) / 2, interval, prec),
	'r', 'linewidth', linewidth);