"""
Robert Werthman
CSCI 5654
Homework 1: Problem 5
"""
import glpk

def part_a():
  """
  Homework 1 Problem 5a
  minimize .5x0 + 2.5x1 + .25x2 + .2x3 + .6x4

  subject to:
    1800 <= 300x0 + 550x1 + 450x2 + 25x3 + 300x4 <= 2200
    50 <= 20x0 + 25x1 + 25x2 + 4x3 + 15x4 <= 100
    30 <= 5x0 + 8x1 + 4x2 + 2x3 + 3x4 <= 80
    60 <= 10x0 + 20x1 + 5x2 + .5x3 + .5x4 <= 100
    3 <= .1x0 + .9x1 + .1x2 + .1x3 + .1x4 <= 5
    x0,x1,x2,x3,x4 >= 0
  """

  lp = glpk.LPX()
  lp.name = 'p5' # Assign a name to the problem.
  lp.obj.maximize = False # Treat this as a maximization problem.

  lp.rows.add(5) # This is the number of constraint equations.
  for r in lp.rows:
    r.name = chr(ord('a') + r.index) # Give names to the rows.
    print r.name

  # Set the bounds for the constraint equations.
  lp.rows[0].bounds = 1800.0, 2200.0 
  lp.rows[1].bounds = 50.0, 100.0
  lp.rows[2].bounds = 30.0, 80.0
  lp.rows[3].bounds = 60.0, 100.0
  lp.rows[4].bounds = 3.0, 5.0

  lp.cols.add(5) # The total number of variables in the problem.
  for c in lp.cols:
    c.name = 'x%d' % c.index # Name the variables starting with x0.
    c.bounds = 0.0, None # Set the bounds of the variables to be >= 0

  # Set the objective function coefficients.
  lp.obj[:] = [0.5, 2.5, 0.25, 0.2, 0.6]

  # Set the coefficients for each of the variables in the constraint equations.
  lp.matrix = [300, 550, 450,  25, 300,
                20,  25,  25,   4,  15,
                 5,   8,   4,   2,   3,
                10,  20,   5, 0.5, 0.5,
               0.1, 0.9, 0.1, 0.1, 0.1]

  lp.simplex() # Solve this LP with the simplex method
  print 'z = %g;' % lp.obj.value # Retrieve and print objective function value.

  # Print the other variables names and values.
  print '; '.join('%s = %g' % (c.name, c.primal) for c in lp.cols)

  print lp.status # The solution status for the solver: infeas, unbnd

part_a()