/*
Robert Werthman
CSCI 5654
Homework 1: Problem 5 Part B

*/
# Define Variables
var x0 >= 0; # Cookie
var x1 >= 0; # Ramen
var x2 >= 0; # Rice
var x3 >= 0; # Brocolli
var x4 >= 0; # CornFlakes

# Define the objective function
minimize z: .5*x0 + 2.5*x1 + 0.25*x2 + 0.2*x3 + 0.6*x4;

# Define the constraints for 5A
s.t. a: 300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4, <= 2200;
s.t. b: 300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4, >= 1800;
s.t. c: 20*x0 + 25*x1 + 25*x2 + 4*x3 + 15*x4, <= 100;
s.t. d: 20*x0 + 25*x1 + 25*x2 + 4*x3 + 15*x4, >= 50;
s.t. e: 5*x0 + 8*x1 + 4*x2 + 2*x3 + 3*x4, <= 80;
s.t. f: 5*x0 + 8*x1 + 4*x2 + 2*x3 + 3*x4, >= 30;
s.t. g: 10*x0 + 20*x1 + 5*x2 + 0.5*x3 + 0.5*x4, <= 100;
s.t. h: 10*x0 + 20*x1 + 5*x2 + 0.5*x3 + 0.5*x4, >= 60;
s.t. i: 0.1*x0 + 0.9*x1 + 0.1*x2 + 0.1*x3 + 0.1*x4, <= 5;
s.t. j: 0.1*x0 + 0.9*x1 + 0.1*x2 + 0.1*x3 + 0.1*x4, >= 3;

# Define the constraints for 5B
s.t. k: 0.5*(300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4), >= 300*x0;
s.t. l: 0.5*(300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4), >= 550*x1;
s.t. m: 0.5*(300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4), >= 450*x2;
s.t. n: 0.5*(300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4), >= 25*x3;
s.t. o: 0.5*(300*x0 + 550*x1 + 450*x2 + 25*x3 + 300*x4), >= 300*x4;

# Solve
solve;
end;
