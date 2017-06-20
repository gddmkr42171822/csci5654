% The majority of this code is borrowed from
% https://www.mathworks.com/help/optim/ug/solve-sudoku-puzzles-via-integer-programming.html

function drawSudoku(M)
    % This map is for a 16x16 sudoku puzzle.
    mapValues = {'A', 'B', 'C', 'D', 'E', 'F', 'G'};
    mapKeys = {'10', '11', '12', '13', '14', '15', '16'};
    mapObj = containers.Map(mapKeys, mapValues);
    
    [m,n] = size(M);
    
    figure;
    hold on;
    axis off;
    rectangle('Position',[0 0 m n],'LineWidth',3,'Clipping','off') % outside border
    
    % Draw the lines in the sudoku puzzle.
    x = sqrt(m);
    for i=x:x:(m-x)
        rectangle('Position',[i,0,0,m],'LineWidth',2) % heavy vertical lines
    end
    for i=x:x:(m-x)
        rectangle('Position',[0,i,m,0],'LineWidth',2) % heavy horizontal lines
    end
    for i=1:m
        rectangle('Position',[0,i,m,0],'LineWidth',1) % minor horizontal lines
    end
    for i=1:m
        rectangle('Position',[i,0,0,m],'LineWidth',1) % minor vertical lines
    end
    
    % Draw the digits of the sudoku puzzle.
    [m,n] = size(M);
    for i=1:m
        for j=1:n
            x = M(i,j);
            if x > 9 % Change the digits > 9 into hexadecimal strings for the 16x16 puzzle.
                text(j-.5, m-(i-.5), mapObj(num2str(x)), 'FontWeight', 'bold', 'FontSize', 12);
            else
                text(j-.5, m-(i-.5), num2str(x), 'FontWeight', 'bold', 'FontSize', 12);
            end
        end
    end      
end