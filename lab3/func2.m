function x1 = func2(x1, x2)
	%x2 = 2 * x1 - 5 + 1 / x1;
	x1 = 1/5 * (2 * x1 .^ 2 - x1 .* x2 + 1);
end