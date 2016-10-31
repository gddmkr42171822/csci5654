% Problem 1 Part a
options = optimoptions('linprog','Algorithm','dual-simplex');
% p1 a
f = [2 -3 -2 -1];
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1];
b = [5 3 -1];
lb = [-5 -5 -5 -5];
ub = [5 5 5 5];
[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a x_4 <= -1
lb = [-5 -5 -5 -5];
ub = [5 5 5 -1];
[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a x_4 >= 0
lb = [-5 -5 -5 0];
ub = [5 5 5 5];
[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

