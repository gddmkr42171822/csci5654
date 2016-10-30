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
f = [2 -3 -2 -1];
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1];
b = [5 3 -1];
lb = [-5 -5 -5 -5];
ub = [5 5 5 -1];

[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a x_4 >= 0
f = [2 -3 -2 -1];
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1];
b = [5 3 -1];
lb = [-5 -5 -5 0];
ub = [5 5 5 5];

[x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a (x_4 <= -1)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1];
b = [5 3 -1 -1];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);

% p1 a (x_4 <= -1, x_1 <= -4)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    1 0 0 0];
b = [5 3 -1 -1 -4];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);

% p1 a (x_4 <= -1, x_1 >= -3 or -x_1 <= 3)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    -1 0 0 0];
b = [5 3 -1 -1 3];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);

% p1 a (x_4 <= -1, x_1 >= -3 or -x_1 <= 3, x_3 <= 3)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    -1 0 0 0
    0 0 1 0];
b = [5 3 -1 -1 3 3];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);


% p1 a (x_4 <= -1, x_1 >= -3 or -x_1 <= 3, x_3 >= 4 or -x_3 <= -4)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    -1 0 0 0
    0 0 -1 0];
b = [5 3 -1 -1 3 -4];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a (x_4 <= -1, x_1 >= -3 or -x_1 <= 3, x_2 <= -5)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    -1 0 0 0
    0 1 0 0];
b = [5 3 -1 -1 -3 -5];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a (x_4 <= -1, x_1 <= -3 or -x_1 <= 3, x_2 >= -4 or -x_2 <= 4)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    -1 0 0 0
    0 -1 0 0];
b = [5 3 -1 -1 3 4];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options)

% p1 a (x_4 <= -1, x_3 >= 4 or -x_3 <= -4)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    0 0 -1 0];
b = [5 3 -1 -1 -4];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);

% p1 a (x_4 <= -1, x_3 <= 3)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 1
    0 0 1 0];
b = [5 3 -1 -1 3];

% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);

% p1 a (x_4 >= 0 or -x_4 <= 0)
A = [1 -1 1 0
    1 -2 -1 1
    1 -1 -1 -1
    0 0 0 -1];
b = [5 3 -1 0];
% [x, fval] = linprog(-f,A,b,[],[],lb,ub,options);