% Problem 3 Part b
f = [3 3 1.5 1 1.2 1.3 .9 .8];
A = [1 1 1 0 0 1 0 0
    1 1 1 1 0 1 0 0
    1 1 1 0 1 1 1 1
    0 1 0 1 0 1 0 0
    0 0 1 0 1 0 1 1
    1 1 1 1 0 1 1 1
    0 0 1 0 1 1 1 1
    0 0 1 0 1 1 1 1];
A = A.*(-1);
b = [-1 -1 -1 -1 -1 -1 -1 -1]';
intcon = 8;
ub = [1 1 1 1 1 1 1 1];
lb = [0 0 0 0 0 0 0 0];

[x,fval] = intlinprog(f,intcon,A,b,[],[],lb,ub)