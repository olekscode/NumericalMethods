function [x1, x2, steps] = newton_mod(x1, x2, prec)
	steps = 0;

	x = [x1; x2];

	% The Jacobi matrix
	invJ = pinv(jacobi(x));

	x_next = x - invJ * func(x);

	while abs(x_next - x) >= prec
		++steps;
		x = x_next;

		x_next = x - invJ * func(x);
	end;

	x1 = x(1);
	x2 = x(2);
end