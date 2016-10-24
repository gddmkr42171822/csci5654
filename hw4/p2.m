% Code for problem 2 of homework 4.
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

% Initialize the objective function which is the minimum of the sum
% of the absolute values of the residuals.
% Residuals have the form y - Ax.
f = ones(1,17);

% Create the constraint matrix A which is the residuals 
% of glucose levels 12 -> 707.
% If u = |x| then u = x and u = -x
[m,~] = size(G);
for t = 11:(m-1)
    a = [G(t) G(t-1) G(t-2) G(t-3) G(t-4) G(t-5) G(t-6) G(t-7) G(t-8) G(t-9) G(t-10)];
    a = horzcat(a, [u(t) u(t-1) u(t-2) u(t-3) u(t-4) u(t-5)]);
    % Append the constraint ax.
    A = [A;a];
    
    % Append the constraint -ax.
    a = times(a, -1);
    A = [A;a];
end

% Solve for the coefficents.
% x will have an array of the coefficient values when it is solved.
[x,fval] = linprog(f,A,b)

% Recreate the matrix A without the additional absolute value constraints.
A = [];
for t = 11:(m-1)
    a = [G(t) G(t-1) G(t-2) G(t-3) G(t-4) G(t-5) G(t-6) G(t-7) G(t-8) G(t-9) G(t-10)];
    a = horzcat(a, [u(t) u(t-1) u(t-2) u(t-3) u(t-4) u(t-5)]);
    A = [A;a];
end

% Create an array of the history steps.
t = [];
for i = 12:m
    t = [t, i];
end

% Plot the true glucose levels at each history step t_i.
figure(1);
scatter(t,G(12:end));
hold on;

% Plot the best fit line of the predicted glucose levels at each 
% history step t_i.
% x stores the estimated coefficients of the best fit line.
% |x| = sqrt(x^2)
A = (A*x).^2;
A = sqrt(A);
plot(t, A);
grid on;
legend('True glucose levels', 'Best fit line of predicted glucose levels');
title('True glucose levels and best fit line of predicted glucose levels vs history step');
xlabel('History step');
ylabel('Glucose level');
saveas(1, 'predictions.png');

% Plot the residuals.
figure(2);
residuals = [];
trueGlucoseValues = G(12:end);
predictedGlucoseValues = A;
[m,~] = size(predictedGlucoseValues);
for i = 1:m
    residuals = [residuals, trueGlucoseValues(i) - predictedGlucoseValues(i)];
end

subplot(2,1,1);
scatter(t, residuals);
hold on;
plot(t, zeros(m));
grid on;
title('Residuals vs history step');
xlabel('History step');
ylabel('Residual value');

subplot(2,1,2);
histogram(residuals);
title('Histogram of residuals');
saveas(2, 'residuals.png');


