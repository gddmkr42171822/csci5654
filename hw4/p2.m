
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');

% Read in the csv file skipping the first row
M = csvread('insulinGlucose1.csv', 1);

% Insulin input values
u = M(:,1);
% Glucose levels
G = M(:,2);

A = [];
b = [];

[m,~] = size(G(12:end));
for i = 1:m
    b = [b, G(i)];
    b = [b, -G(i)];
end

b = b';

[m,~] = size(u);

% Initialize the objective function which is the minimum of the sum
% of the absolute values of the residuals
f = ones(1,17);

% Create the constraint matrix A which is the residuals 
% of glucose levels 10 -> 707.
% If u = |x| then u = x and u = -x
for t = 12:m
    a = [G(t-1) G(t-2) G(t-3) G(t-4) G(t-5) G(t-6) G(t-7) G(t-8) G(t-9) G(t-10) G(t-11)];
    a = horzcat(a, [u(t-1) u(t-2) u(t-3) u(t-4) u(t-5) u(t-6)]);
    % Append the constraint ax.
    A = [A;a];
    
    % Append the constraint -ax.
    a = times(a, -1);
    A = [A;a];
end

x = linprog(f,A,b);

% Create an array of the time steps.
t = [];
for i = 12:m
    t = [t, i];
end

% Recreate the matrix A without the additional absolute value constraints
A = [];
for t = 12:m
    a = [G(t-1) G(t-2) G(t-3) G(t-4) G(t-5) G(t-6) G(t-7) G(t-8) G(t-9) G(t-10) G(t-11)];
    a = horzcat(a, [u(t-1) u(t-2) u(t-3) u(t-4) u(t-5) u(t-6)]);
    A = [A;a];
end

t = [];
for i = 12:m
    t = [t, i];
end

% Plot the actual glucose levels at each history step t_i.
scatter(t,G(12:end));
hold on;

% Plot the best fit line of the glucose levels at each history step t_i.
% x stores the estimated coefficients of the best fit line.
% |x| = sqrt(x^2)
A = (A*x).^2;
A = sqrt(A);
plot(t, A);
grid on;