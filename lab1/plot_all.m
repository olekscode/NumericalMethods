% generating data
t = [0:0.01:2];

% set x and y range relatively
axis([0 2 0 6]);

% prevent the previous plot from dessapearing
% when the next one comes forward
hold on;

plot(t, func1(t), 'r');
plot(t, func2(t), 'b');
plot(t, identity_function(t), 'g');

legend('y = 1 + 0.5 ^ x',
	   'y = log2(1/(x - 1))',
	   'y = x');

% plot the steps of a fixed-point iteration
[res steps] = fixed_point_iteration(@func1, 0);
for i = 1:length(steps)
	disp(steps(i));
	text(steps(i), func1(steps(i)) - 0.2, int2str(i));
	plot(steps(i), func1(steps(i)), 'rs');
end