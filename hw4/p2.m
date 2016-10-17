M = csvread('insulinGlucose1.csv', 1);

% Insulin input values
u = M(:,1);
% Glucose levels
G = M(:,2);

X = [];
t = [];

[m,] = size(u);

% Create the matrix A which in linear regression
% is the matrix X.
for c = 10:(m-1)
    x = glucose_level(c, G, u);
    X = [X;x];
end

Y = G(10:end-1);
% Linear Regression with least-squares
% Find the coefficients
B = X\Y;

% Create an array of the possible history lengths
for c = 10:(m-1)
    t = [t, c];
end

% Plot the actual glucose levels at each history step t_i
scatter(t,Y);
hold on;
% Plot the predicted glucose levels at each history step t_i
% B stores the estimated coefficients of the best fit line
plot(t, (X*B));
grid on;