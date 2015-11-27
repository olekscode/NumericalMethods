function y0 = lagrange(x, y, x0)
	y0 = zeros(size(x0));

	for i = 1:length(y)
		y0 += y(i) * fund_poly(i, x, y, x0);
	end;
end