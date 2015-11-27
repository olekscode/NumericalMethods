function omg = omega(i, x, x0)
	omg = ones(size(x0));

	for k = 1:(i-1)
		omg = omg .* (x0 .- x(k));
	end;

	for k = (i+1):length(x)
		omg = omg .* (x0 .- x(k));
	end;
end