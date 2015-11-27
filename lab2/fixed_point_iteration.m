function [x, steps] = fixed_point_iteration(A, b, precision, maxl)
	d = diag(A);
	
	for i=1:size(A,1)
		A(i,i) = 0;
	end;

	C = A ./ d;
	f = b ./ d;

	% Initial value
	x = ones(size(b));
	x_next = f - C * x;
	steps = [x];

	precision *= ones(size(b));
	
	k = 1;
	for k = 1:maxl
		x = x_next;
		x_next = f - C * x;
		steps = [steps x];

		if abs(x_next - x) < precision
			break;
		end;
	end;
	
	if k == maxl
		disp('ERROR: Fixed point iteration won''t converge on this data.');
	end;
end

% x = ones(size(b));
% x_next = C * x + b;
% steps = [x];

% precision *= ones(size(b));

% while (abs(x_next - x) >= precision)
% 	x = x_next;
% 	x_next = C * x + b;
% 	steps = [steps x];
% end;


% -------------------------------------
% Built-in Function: norm (A)
% Built-in Function: norm (A, p)
% Built-in Function: norm (A, p, opt)

%     Compute the p-norm of the matrix A.

%     If the second argument is missing, p = 2 is assumed.

%     If A is a matrix (or sparse matrix):

%     p = 1

%         1-norm, the largest column sum of the absolute values of A.
%     p = 2

%         Largest singular value of A.
%     p = Inf or "inf"

%         Infinity norm, the largest row sum of the absolute values of A.
%     p = "fro"

%         Frobenius norm of A, sqrt (sum (diag (A' * A))).
%     other p, p > 1

%         maximum norm (A*x, p) such that norm (x, p) == 1 

%     If A is a vector or a scalar:

%     p = Inf or "inf"

%         max (abs (A)).
%     p = -Inf

%         min (abs (A)).
%     p = "fro"

%         Frobenius norm of A, sqrt (sumsq (abs (A))).
%     p = 0

%         Hamming norm - the number of nonzero elements.
%     other p, p > 1

%         p-norm of A, (sum (abs (A) .^ p)) ^ (1/p).
%     other p p < 1

%         the p-pseudonorm defined as above. 
