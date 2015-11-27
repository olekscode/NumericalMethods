function [L, steps] = gauss1(f, h, x0, x, prec)
	t = (x - x0) / h;

	T_even = 1;
	T_odd = t;

	L = T_even .* f(x0) + T_odd .* finite_diff(1, f, x0, h);
	L_prev = L + 2 * prec;

	k = 1;
	steps = 0;

	while abs(L - L_prev) >= prec
		++steps;
		T_even = T_odd .* (t - k) / (2*k);
		T_odd = T_even .* (t + k) / (2*k + 1);

		L_prev = L;
		L += T_even .* finite_diff(2*k, f, x0 - k*h, h) + ...
			 T_odd .* finite_diff(2*k + 1, f, x0 - k*h, h);
		++k;
	end;
end