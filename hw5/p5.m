% Problem 5
f = [1 2 3 4 5 6 7 8 9 10];
A = [-1 0 -1 0 0 -1 0 0 0 0
    0 -1 0 0 0 0 -1 -1 0 0
    -1 0 0 0 0 0 0 -1 -1 0
    -1 0 -1 0 -1 -1 0 0 0 0];
b = [-1 -1 -1 -1]';
ub = [1 1 1 1 1 1 1 1 1 1];
lb = [0 0 0 0 0 0 0 0 0 0];
intcon = 10;

[x,fval] = intlinprog(f,intcon,A,b,[],[],lb,ub)