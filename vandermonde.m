function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    % Calculate the Vandermonde coefficients
    n = length(x);  % Length of input vector x
    
    % Initializam matricea V (matricea Vandermonde) cu 0
    V = zeros(n, n);
    
    % Construim matricea Vandermonde
    i = 1;
    while i <= n
        j = 1;
        while j <= n
    % Calculam elementele matricei V
            V(i, j) = x(i)^(j-1);
            j = j + 1;
        endwhile
        i = i + 1;
    endwhile
    
    % Rezolvam systemul V * coef = y si obtinem coeficientii
    coef = V \ y;
endfunction
