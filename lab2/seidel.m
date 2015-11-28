function [x, steps] = seidel(A, b, precision, maxl)
    % % Rearanging matrix A so that it won't have
    % % 0s on main diagonal
    % for i = 1:size(A,1)
    %     if A(i,i) == 0
    %         for j = 1:size(A,1)
    %             if A(i,j) ~= 0
    %                 A(:,[i,j]) = A(:,[j,i]);
    %                 i = 1;
    %                 break;
    %             end;
    %         end;
    %     end;
    % end;

    % disp(A);

    % A = Rl + D + Ru
    % d is a main diagonal of A (vector)
    d = diag(A);
    Rl = tril(A, -1);
    Ru = triu(A, 1);

    f = b ./ d;
    Cl = Rl ./ d;
    Cu = Ru ./ d;

    % Initial values
    x = ones(size(b));
    x_next = x;

    x_next = f - Cl * x_next - Cu * x;
    steps = [x];

    precision *= ones(size(b));

    disp(norm(Cl) + norm(Cu));

    k = 1;
    for k = 1:maxl
        x = x_next;

        for i = 1:size(Cl, 1)
            x_next(i) = f(i) - Cl(i,:) * x_next - Cu(i,:) * x;
        end;
        
        steps = [steps x];

        if (abs(x_next - x) < precision)
            break;
        end;
    end;

    if k == maxl
        disp('ERROR: Seidel method won''t converge on this data.');
    end;
end
