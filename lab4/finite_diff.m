function delta = finite_diff(i, f, x, h)
	if (i == 1)
		delta = f(x+h) - f(x);
	else
		delta = finite_diff(i-1, f, x+h, h) - finite_diff(i-1, f, x, h);
	end;
end