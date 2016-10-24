
A = [+1 -1 0 0 0 -1 +1 0 0 0 0 0;... 
     +1 0 0 -1 -1 0 0 +1 0 0 0 0;...
     0 0 -1 0 0 -1 0 0 +1 0 0 0;...
     0 -1 -1 +1 0 +1 0 0 0 +1 0 0;...
     +1 0 +1 0 +1 +1 0 0 0 0 +1 0;...
     -1 0 0 -1 +1 -1 0 0 0 0 0 +1];

b = [3 -1 -2 +4 +6 -2]';

c = [-2 -3 -1 -1 0 +1 0 0 0 0 0 0];

% P3 a1
xB = [1 2 3 7 8 9];
xN = [4 5 6 10 11 12];
B = A(:, xB);
N = A(:, xN);
Binv = inv(B);
% Dictionary constant value column.
Binv*b;
% Dictionary coefficient value rows.
-Binv*N;

cB = c(:, xB);
cN = c(:, xN);
% Objective function constant value.
cB*(Binv*b);
% Object function coefficient values.
cN - cB*(Binv*N);

% P3 a2
xB = [5 6 7 8 9 10];
xN = [1 2 3 4 11 12];


B = A(:, xB);
N = A(:, xN);
Binv = inv(B);
% Dictionary constant value column.
Binv*b;
% Dictionary coefficient value rows.
-Binv*N;

cB = c(:, xB);
cN = c(:, xN);
% Objective function constant value.
cB*(Binv*b);
% Object function coefficient values.
cN - cB*(Binv*N);

% P3 a3
xB = [1 2 6 10 11 12];
xN = [3 4 5 7 8 9];

B = A(:, xB);
N = A(:, xN);
Binv = inv(B);
% Dictionary constant value column.
Binv*b;
% Dictionary coefficient value rows.
-Binv*N;

cB = c(:, xB);
cN = c(:, xN);
% Objective function constant value.
cB*(Binv*b);
% Object function coefficient values.
cN - cB*(Binv*N);

% p3 b
xB = [3 4 5 7 8 12];
xN = [1 2 6 9 10 11];

B = A(:, xB);
N = A(:, xN);
Binv = inv(B);
% Dictionary constant value column.
Binv*b;
% Dictionary coefficient value rows.
-Binv*N;

cB = c(:, xB);
cN = c(:, xN);
% Objective function constant value.
cB*(Binv*b);
% Object function coefficient values.
cN - cB*(Binv*N);

% Choose the third variable as the entering variable.
% Get the column of the entering variable.
a_i = -Binv*N(:, 3);

% Determine the leaving variable row index by finding the value that
% constraints the entering variable the most.
-(Binv*b)./a_i;

% Get the leaving variable row.
a_j = -(Binv*N);
a_j = a_j(6,:);

% P3 c
f = [-2 -3 -1 -1 0 1];
Y = [1 -1 0 0 0 -1;1 0 0 -1 -1 0;0 0 -1 0 0 -1;0 -1 -1 1 0 1;1 0 1 0 1 1;-1 0 0 -1 1 -1];
x = [3 -1 -2 4 6 -2];
options = optimoptions('linprog','Algorithm','dual-simplex');
[x,fval] = linprog(-f, Y, x, [], [], zeros(size(f)), [], options)

xB = [5 6 7 9 11 12];
xN = [1 2 3 4 8 10];

B = A(:, xB);
N = A(:, xN);
Binv = inv(B);
% Dictionary constant value column.
Binv*b
% Dictionary coefficient value rows.
-Binv*N

cB = c(:, xB);
cN = c(:, xN);
% Objective function constant value.
cB*(Binv*b)
% Object function coefficient values.
cN - cB*(Binv*N)


