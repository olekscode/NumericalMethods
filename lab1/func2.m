function y = alternative_function(x)
	% It is necessary to loop through x as a vector
	% to plot this function
	for i = 1:length(x)
		y(i) = log2(1/(x(i)-1));
	end
end