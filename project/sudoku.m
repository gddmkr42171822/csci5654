% The majority of this code is borrowed from
% https://www.mathworks.com/help/optim/ug/solve-sudoku-puzzles-via-integer-programming.html
% The ideas for X Sudoku and 4 Squares Sudoku are borrowed from
% http://langvillea.people.cofc.edu/sudoku5.pdf

puzzleType = 'regular';
% Regular 9x9 sudoku puzzle.
puzzle = [7 3 0 0 0 5 0 0 0
          0 4 0 0 6 0 0 0 0
          0 0 1 0 0 9 0 5 0
          0 5 0 0 0 1 0 9 2
          0 0 0 0 0 0 0 0 0
          0 0 0 0 4 7 5 0 8
          3 0 0 0 7 2 0 0 0
          6 9 0 0 0 0 2 0 0
          0 0 0 6 3 0 4 0 0];

% Sudoku X 9x9 puzzle.
% puzzleType = 'X';
% puzzle = [0 8 0 0 0 0 0 3 1
%           1 0 0 0 0 0 0 0 4
%           0 0 2 5 9 0 8 0 0
%           0 0 7 0 0 0 0 0 0
%           0 0 4 0 0 0 6 0 0
%           0 0 0 0 0 0 4 0 0
%           0 0 6 0 4 7 1 0 0
%           5 0 0 0 0 0 0 0 6
%           2 7 0 0 0 0 0 4 0];

% Sudoku 9x9 puzzle with 4 squares.
% puzzleType = '4squares';
% puzzle = [7 0 0 4 0 0 0 8 0
%           0 4 0 0 2 0 0 0 7
%           1 0 3 0 0 7 0 0 0
%           0 7 0 1 0 0 8 0 0
%           0 0 0 0 8 0 0 0 0
%           0 0 8 0 0 3 0 6 0
%           0 0 0 2 0 0 4 0 8
%           2 0 0 0 9 0 0 1 0
%           0 8 0 0 0 6 0 0 5];

% Regular 16x16 sudoku puzzle.
A = 10;
B = 11;
C = 12;
D = 13;
E = 14;
F = 15;
G = 16;
puzzle = [E 0 7 9 1 0 3 0 8 0 0 0 D 0 4 0
          0 0 3 0 0 0 5 0 0 0 D F 7 0 0 0
          0 5 0 C B 0 0 0 0 4 0 6 3 2 0 0
          0 B 0 0 0 F 9 0 0 0 2 0 0 C 0 0
          0 0 0 0 A D 0 0 0 0 B 0 0 1 0 9
          0 7 0 0 0 0 0 0 0 0 6 0 0 0 3 0
          0 6 2 0 0 0 0 7 0 0 E A 0 0 0 C
          0 C 0 0 0 0 2 0 9 0 0 0 0 A 0 0
          0 0 8 0 0 7 1 0 0 0 0 0 0 5 A 0
          D 0 9 0 3 A 0 C 2 0 0 7 0 0 0 0
          0 0 0 0 0 6 4 0 C 0 0 0 0 F 0 1
          6 0 0 E 2 5 F 0 0 0 8 4 0 D 0 0
          0 8 0 0 5 0 0 0 0 0 0 0 1 6 F 0
          2 0 0 1 0 8 D 0 0 A 0 0 0 0 0 0
          3 F 0 0 0 0 0 0 B 0 0 0 0 0 0 0
          A 0 0 0 0 0 C 2 0 1 F E 0 3 B 0];
          

puzzle = solveSudoku(puzzle, puzzleType);
drawSudoku(puzzle);