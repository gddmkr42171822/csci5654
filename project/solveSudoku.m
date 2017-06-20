% The majority of this code is borrowed from
% https://www.mathworks.com/help/optim/ug/solve-sudoku-puzzles-via-integer-programming.html

function [solvedSudoku] = solveSudoku(puzzle,puzzleType)

Aeq = [];

[m,n] = size(puzzle);

rows = m;
columns = n;
digits = m;

lb = zeros(rows,columns,digits);
ub = ones(rows,columns,digits);

if rem(sqrt(rows),1) && rem(sqrt(columns),1) ~= 0
    error('Code only handles perfect square dimensional puzzles.')
end

% Each row has only one instance of each digit k.
for i=1:rows
    for k=1:digits
        rowConstraints = lb;
        % For every column in the ith row there can be only one instance of
        % the kth digit.
        for j=1:columns
            rowConstraints(i, j, k) = 1;
        end
        Aeq = [Aeq;rowConstraints(:)'];
    end
end

% Each column has only one instance of each digit k.
for j=1:columns
    for k=1:columns
        columnConstraints = lb;
        % For every row in the jth column there can be only one instance of
        % the kth digit.
        for i=1:rows
            columnConstraints(i, j, k) = 1;
        end
        Aeq = [Aeq;columnConstraints(:)'];
    end
end

% Each submatrix has only one instance of each digit k.
subMatrixSize = sqrt(digits);
lastPosition = digits - subMatrixSize;
for i=0:subMatrixSize:lastPosition  % Starting rows of submatrices.
    for j=0:subMatrixSize:lastPosition   % Starting columns of submatrices.
        for k=1:digits
            submatrixConstraints = lb;
            % x by x submatrix.
            for n=1:subMatrixSize
                for o=1:subMatrixSize
                    submatrixConstraints(i+n, j+o, k) = 1;
                end
            end
            Aeq = [Aeq;submatrixConstraints(:)'];
        end
    end
end

% Every position in the sudoku puzzle must have a digit k that is non-zero.
for i=1:rows
    for j=1:columns
        noZerosConstraints = lb;
        for k=1:digits
            noZerosConstraints(i,j,k) = 1;
        end
        Aeq = [Aeq;noZerosConstraints(:)'];
    end
end

% X Sudoku: The two long diagonals have exactly one of each digit k.
if strcmp('X', puzzleType) == 1
    disp('Solving puzzle as a X Sudoku puzzle.');
    % Negative diagonal
    for k=1:digits
        negativeDiagnonalConstraints = lb;
        for i=1:rows
            negativeDiagnonalConstraints(i, i, k) = 1;
        end
        Aeq = [Aeq;negativeDiagnonalConstraints(:)'];
    end

    % Positive diagonal
    for k=1:digits
        positiveDiagnonalConstraints = lb;
        for i=1:rows
            positiveDiagnonalConstraints(i, (digits+1)-i, k) = 1;
        end
        Aeq = [Aeq;positiveDiagnonalConstraints(:)'];
    end
end

% 4 Squares Sudoku: Four additional submatrices that have one of each
% digit.
if strcmp('4squares', puzzleType) == 1
    disp('Solving puzzle as a 4 Sqaures Sudoku puzzle.');
    subMatrixSize = sqrt(digits);
    lastPosition = digits - subMatrixSize; % The first column of the last submatrix in the row.
    for i=1:4:lastPosition % Starting rows of the submatrices.
        for j=1:4:lastPosition % Starting columns of the submatrices.
            for k=1:digits
                fourSquareConstraints = lb;
                for n=1:subMatrixSize
                    for o=1:subMatrixSize
                        fourSquareConstraints(i + n, j + o, k) = 1;
                    end
                end
                Aeq = [Aeq;fourSquareConstraints(:)'];
            end
        end
    end
end

% Fill in the problem with the given sudoku puzzle digits by forcing 
% the constraints that refer to a particular sudoku puzzle digit to be 1.
for i=1:rows
    for j=1:columns
        if puzzle(i,j) ~= 0 % Make sure there is a non-zero digit in the given puzzle.
            lb(i, j, puzzle(i,j)) = 1;
        end
    end
end

% Create the objective function, the list of integer decision variables
% which should be all decision variables, and the B vector.
[M,N] = size(Aeq);
f = 1:N;
intcon = 1:N;
Beq = ones(M,1);

% Returns a 1 for the decision variable that represents the kth digit that 
% should be placed at each i,j lcoation in the puzzle.
options = optimoptions('intlinprog','Display','off');
[x, ~, exitflag] = intlinprog(f,intcon,[],[],Aeq,Beq,lb,ub,options);

% If we found a solution.
if exitflag > 0
    % Round the digits to an integer.  Not sure why they are decimals as
    % I indicated with intcon that they should all be integers.
    x = round(x);
    
    % Put the solutions back into a rows*columns*digits 3-dimensional array.
    x = reshape(x,rows,columns,digits);

    % Create a 3-dimenstional array of ones that we can eventually use
    % to multiple the solution array by.
    y = ones(size(x));

    % Modify the 3-dimensional array of ones to have the digit k instead
    % of all ones.
    for k=2:digits
        y(:,:,k) = k;
    end

    % Change the ones in the solution x into their actual k digits.
    x = x.*y;

    % Change the 3-dimensional array into 2-dimensions.
    solvedSudoku = sum(x,3);
else
    error('Feasible solution for the sudoku puzzle could not be found.')
end

end