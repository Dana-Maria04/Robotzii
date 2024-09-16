function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients
	n = length(coef) - 1;
    
    % Initialize y_interp ca vector coloana de lungime length(x_interp)
    y_interp = zeros(length(x_interp), 1);
    
    % calculam y_interp cu ajutorul operatiilor de vectorizare
    for i = 0:n
        y_interp = y_interp + coef(i + 1) * (x_interp .^ i);
    endfor
end
