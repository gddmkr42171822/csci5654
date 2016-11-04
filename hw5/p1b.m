% Problem 1 Part b
options = optimoptions('linprog','Algorithm','dual-simplex');
f = [2 0 3 1];
A = [1 -1 0 1
    0 2 0 -1
    1 0 -1 -2
    -1 0 0 1];
b = [1 2 -1 1];
ub = [2 1 1 1];
lb = [-2 -1 0 -1];

[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% x_4 <= 0
ub = [2 1 1 0];
lb = [-2 -1 0 -1];

[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% x_4 >= 1
ub = [2 1 1 1];
lb = [-2 -1 0 1];

[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% x_1 <= 1
ub = [1 1 1 1];
lb = [-2 -1 0 -1];
[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% x_1 >= 2
ub = [2 1 1 1];
lb = [2 -1 0 -1];
[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)



