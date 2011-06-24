# By considering the terms in the Fibonacci sequence whose values 
# do not exceed four million, find the sum of the even-valued terms.

cdef extern from "math.h":
    double sqrt(double x)


cdef int max_fib, nextEvenFib, runningSum, total
max_fib = 4000000

# The ratio of two consecutive terms in the Fibonacci sequence approaches
# phi, the golden ratio, approximately 1.61803...

cdef double phi
phi = (1 + sqrt(5))/2

# The canonical fibonacci sequence is 0, 1, 1, 2, 3, 5, 8 ...
# We observe that every third term is even. Note the following:
# F(n+1)/F(n) = phi
# F(n+2)/F(n) = F(n+2)/F(n+1) * F(n+1)/F(n) = phi^2
# F(n+3)/F(n) = F(n+3)/F(n+2) * F(n+2)/F(n+1) * F(n+1)/F(n) = phi^3
# Thus, we can calculate the next even Fibonacci number by multiplying
# the previous even Fibonacci number by phi^3

cdef int sumEvenFibs(int currentEvenFib):
    if currentEvenFib <= max_fib:
        nextEvenFib = int(round(currentEvenFib * phi**3))
        runningSum = currentEvenFib + sumEvenFibs(nextEvenFib)
        return runningSum
    else:
        return 0

# Start summing from 2, as zero is negligible

total = sumEvenFibs(2)

print total