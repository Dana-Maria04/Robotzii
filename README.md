### Task 2 - Robots

In this task, we explore the simulation of the trajectory of an autonomous robot on a two-dimensional plane using interpolation methods. Given the coordinates the robot needs to pass through, the objective is to determine the most efficient trajectory using Vandermonde interpolation and natural cubic splines.

- ### Cubic Spline Interpolation

We will use cubic splines for interpolation. For each interval [x_i, x_i+1], we will consider a third-degree polynomial:

   s_i(x) = a_i + b_i(x - x_i) + c_i(x - x_i)^2 + d_i(x - x_i)^3, \, i = 0:n-1 

The functions within this section are as follows:

- #### *parse_data(filename)*

This function takes `filename` as a parameter, reads data from a file, and returns two column vectors, \(x\) and \(y\), which represent the x and y coordinates of the interpolation points.

Steps:

1. **Opening the file for reading**:

   `fopen` is used to open the file in text mode (`rt`, read text).

2. **Reading the value of \(n\)**:

   A natural number \(n\) is read, representing the number of interpolation points minus one.

3. **Reading the x and y coordinates**:

   \(n+1\) integer values are read for the x and y coordinates.

4. **Converting row vectors to column vectors, if necessary**:

   The size of the vectors is checked and converted to column vectors if needed.

5. **Closing the file**:

   `fclose` is used to close the file.

The functions used are `fscanf`, `fopen/fclose`, `size` to check vector dimensions, and the transpose (`'`) to convert vectors into column vectors.

- #### *spline_c2*

This function solves the system of equations described. The input parameters are the column vectors \(x\) and \(y\). The output is the column vector `coef` containing the spline polynomial coefficients.

It is based on the following formulas:

- **Spline polynomial**: \( s_i(x) = a_i + b_i(x - x_i) + c_i(x - x_i)^2 + d_i(x - x_i)^3 \)

- **Derivatives**:
    \[
    s_i'(x) = b_i + 2c_i(x - x_i) + 3d_i(x - x_i)^2
    \]
    \[
    s_i''(x) = 2c_i + 6d_i(x - x_i)
    \]

Steps:

1. **Initializing matrices for equations**:

   Matrix \(A\) and vector \(b\) are created for the system of equations.

2. **Setting equations for polynomial values at interval boundaries**:

   The equations for each polynomial at the interpolation points are added.

3. **Setting equations for polynomial values at the final interval boundary**:

   The equations for the final polynomial at the boundary of the interval are added.

4. **Setting equations for the continuity of polynomials and derivatives**:

   Equations for the continuity of values, first derivatives, and second derivatives are added.

5. **Setting equations for the second derivative at the boundaries**:

   The equations for the second derivatives at the interval boundaries are added.

6. **Solving the system of equations**:

   The system of equations is solved to find the spline polynomial coefficients.

     coef = inv(mat) * b;

   Functions used include `zeros` for creating a matrix of zeros and `inv` for calculating the inverse of a matrix.

- #### *P_spline*

This function takes the previously determined coefficient matrix, the column vector \(x\) of interpolation points, and the vector x_interp of x-values for which the spline polynomial values are desired. It returns a column vector y_interp with the spline interpolation values for each element in x_interp.

Steps:

1. **Reshaping the coefficient vector into a matrix**:

   The coefficient vector is reshaped into a matrix with 4 rows, making it easier to access the coefficients of each polynomial.

2. **Initializing the result vector**:

   A vector y_interp is created to store the interpolation results, with its size determined by x_interp.

3. **Calculating spline values for each interpolation point**:

   For each value in x_interp, the corresponding segment is determined, and the cubic polynomial is evaluated. The cubic polynomial formula is used to compute the interpolated value.

Functions used include `reshape` to form a matrix from a vector, `find` to locate indices based on a condition, and `zeros` to create vectors of zeros.

- ### Vandermonde Interpolation

The [Vandermonde matrix](https://ro.wikipedia.org/wiki/Matricea_Vandermonde) is a matrix made up of powers of interpolation points. Each row corresponds to an interpolation point, and each column represents a power of that point. The matrix is known for being poorly conditioned, meaning that small errors in the input data can result in large errors in the interpolation results.

The general form of the [Vandermonde polynomial](https://en.wikipedia.org/wiki/Vandermonde_polynomial) is:

P_Vandermonde(x) = a_0 + a_1x + a_2x^2 + ... + a_nx^n


- ### *Vandermonde*:

This function solves the system of equations to determine the coefficients of the Vandermonde polynomial. The input parameters are the column vectors \(x\) and \(y\). The output is the column vector `coef` containing the polynomial coefficients.

Steps:

1. **Initializing the Vandermonde matrix**:

   The Vandermonde matrix \(V\) is created, where each row corresponds to an interpolation point and each column represents a power of that point.

2. **Filling the Vandermonde matrix**:

   The matrix \(V\) is filled with the powers of the interpolation points \(x\).

3. **Solving the system of equations**:

   The system V * coef = y is solved to determine the polynomial coefficients.

- ### *P_vandermonde*:

This function takes the previously determined coefficient vector and the vector x_interp of x-values for which the Vandermonde polynomial values are desired. It returns a column vector y_interp with the polynomial interpolation values for each element in x_interp.

Steps:

1. **Initializing the result vector**:

   The vector y_interp is created to store the interpolation results, with its size determined by x_interp.

2. **Calculating Vandermonde polynomial values**:

   For each value in x_interp, the Vandermonde polynomial value is computed using the determined coefficients.

The MATLAB functions used in both functions include `length` for determining the length of a vector and `zeros` for creating vectors of zeros.
