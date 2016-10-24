% Code for problem 3 of homework 4.
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

% P3 d
% z = (-2+u)x_1 + (-3+u)x_2 -x_3 -x_4 + (1+u)x_6
u = 0;
c = [(-2+u) (-3+u) -1 -1 0 (+1+u) 0 0 0 0 0 0];

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

% Check if all values in constant column are >= 0
% This means the dictionary is feasible.
if all(Binv*b>=0)
    disp('Dictionary is feasible.');
else
    disp('Dictionary is not feasible.');
end

% Object function coefficient values.
cN - cB*(Binv*N)

% Check if all obejctive function coefficients are <= 0.  This means the dictionary is final.
if all(cN - cB*(Binv*N)<=0)
    disp('Dictionary is final.');
else
    disp('Dictionary is not final.');
end

% P3 e
y = 1;
b = b + (y.*[1 1 0 0 0 -1])';
c = [-2 -3 -1 -1 0 +1 0 0 0 0 0 0];

xB = [5 6 7 9 11 12];
xN = [1 2 3 4 8 10];

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

% Check if all values in constant column are >= 0
% This means the dictionary is feasible.
Binv*b
if all(Binv*b>=0)
    disp('Dictionary is feasible.');
else
    disp('Dictionary is not feasible.');
end

% Object function coefficient values.
cN - cB*(Binv*N);
