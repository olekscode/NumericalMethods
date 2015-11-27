function y = given_function(x)
	% It is necessary to loop through x as a vector
	% to plot this function
	for i = 1:length(x)
		y(i) = 1 + 0.5 ^ x(i);
	end
end