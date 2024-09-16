function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	n = length(x) - 1;
    coef = reshape(coef, 4, n);

    y_interp = zeros(size(x_interp));
	% pentru fiecare x_interp(j) calculam y_interp(j)
    for j = 1:length(x_interp)
        i = find(x_interp(j) >= x(1:end-1) & x_interp(j) <= x(2:end), 1, 'first');
        h = x_interp(j) - x(i);
        y_interp(j) = coef(1,i) + coef(2,i)*h + coef(3,i)*h^2 + coef(4,i)*h^3;
    endfor
end
