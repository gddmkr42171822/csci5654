"""
Robert Werthman
CSCI 5654
Homework 1 Problem 3

maximize (expected profit per unit)/(price per unit) x1 +...+ 
         (expected profit per unit)/(price per unit) x15

subject to:
  0 <= x1 +...+ x15 <= 10000
  1500 <= x1 + x4 + x10 + x13 <= 3500
  4500 <= x2 + x5 + x8 + x9 + x14 <= 6500
  1000 <= x3 + x7 + x11 + x15 <= 3000
  500 <= x6 + x12 <= 2500
  0 <= x1 + x8 + x11 <= 3000
  0 <= x2 + x3 + x5 + x6 + x7 + x15 <= 4000
  0 <= x4 + x9 + x13 <= 5000
  0 <= x10 + x12 + x14 <= 7000
  2000 <= x1 + x2 + x3 + x6 + x7 + x8 + x9 + x10 + x11 + x13 <= 10000
  x1,...,x15 >= 0
"""
import glpk

lp = glpk.LPX()
lp.name = 'p3' # Assign a name to the problem.
lp.obj.maximize = True # Treat this as a maximization problem.

lp.rows.add(10) # This is the number of constraint equations
for r in lp.rows:
  r.name = chr(ord('a') + r.index) # Names rows starting with a through j.
  print r.name

# Set the bounds for the constraint equations.
lp.rows[0].bounds = 0.0, 10000.0 
lp.rows[1].bounds = 1500.0, 3500.0
lp.rows[2].bounds = 4500.0, 6500.0
lp.rows[3].bounds = 1000.0, 3000.0
lp.rows[4].bounds = 500.0, 2500.0
lp.rows[5].bounds = 0.0, 3000.0
lp.rows[6].bounds = 0.0, 4000.0
lp.rows[7].bounds = 0.0, 5000.0
lp.rows[8].bounds = 0.0, 7000.0
lp.rows[9].bounds = 2000.0, 10000.0

lp.cols.add(15) # The total number of variables in the problem.

for c in lp.cols:
  c.name = 'x%d' % (c.index + 1) # Name the variables starting with x1.
  c.bounds = 0.0, None # Set the bounds of the variables to be >= 0

# Set the objective function coefficients.
lp.obj[:] = [1.451/2.563, 2.683/4.307, 5.898/6.422, 2.102/3.488, 5.709/6.581,
            4.519/8.993, 7.176/11.481, 6.075/11.730, 5.718/9.270, 7.442/10.160,
            1.234/1.961, 4.680/9.300, 7.229/11.672, 9.589/10.877, 6.497/12.137]

# Set the coefficients for each of the variables in the constraint equations.
lp.matrix = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
             1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0,
             0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0,
             0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
             0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
             1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0,
             0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1,
             0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0,
             1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0] 

lp.simplex() # Solve this LP with the simplex method
print 'z = %g;' % lp.obj.value # Retrieve and print objective function value.

# Print the other variables names and values.
print '; '.join('%s = %g' % (c.name, c.primal) for c in lp.cols)
