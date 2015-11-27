function J = jacobi(x)
	J = [
		func1_der_x1(x) func1_der_x2(x);
		func1_der_x1(x) func1_der_x2(x);
	];
end