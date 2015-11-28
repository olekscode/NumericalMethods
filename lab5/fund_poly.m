function Fi = fund_poly(i, x, y, x0)
    Fi = omega(i, x, x0) ./ omega(i, x, x(i));
end
