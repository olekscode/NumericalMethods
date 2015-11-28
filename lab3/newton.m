function [x1, x2, steps] = newton(x1, x2, prec)
    steps = 0;

    x = [x1; x2];

    % The Jacobi matrix
    J = jacobi(x);
    x_next = x - pinv(J) * func(x);

    while abs(x_next - x) >= prec
        ++steps;
        x = x_next;
        J = jacobi(x);

        x_next = x - pinv(J) * func(x);
    end;

    x1 = x(1);
    x2 = x(2);
end
