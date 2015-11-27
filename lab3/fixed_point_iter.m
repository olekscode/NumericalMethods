% TODO: Consider addressing func1 and func2 directly instead
%  		of using an array.

function [x1, x2, steps] = fixed_point_iter(x1, x2, prec)
	% x1 and x2 are initial values
	
	steps = 0;

	x1_next = func1(x1, x2);
	x2_next = func2(x1, x2);

	while abs(x1_next - x1) + abs(x2_next - x2) >= 2 * prec
		++steps;
		x1 = x1_next;
		x2 = x2_next;

		x1_next = func1(x1, x2);
		x2_next = func2(x1, x2);
	end;
end

% function [x, steps] = fixed_point_iter(funcs, x_init, prec)
% 	steps = 0;
% 	n = length(funcs);

% 	x = x_init;
% 	x_next = zeros(n,1);

% 	for i = 1:n
% 		x_next(i) = eval([char(funcs(i,:){:}) '(x_init);']);
% 	end;

% 	while abs(x_next - x) >= prec
% 		++steps;
% 		x = x_next;

% 		for i = 1:n
% 			x_next(i) = eval([char(funcs(i,:)) '(x);']);
% 		end;
% 	end;
% end