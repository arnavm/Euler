# What is the value of the first triangle number to have over five hundred divisors?

cdef extern from "math.h":
    double sqrt(double x)
    double ceil(double x)

cdef unsigned int n, triangularNumber, divisor, numDivisors

# The triangular numbers are 1, 3, 6, 10, 15, 21, 28, ...
# A quick way to obtain the nth triangular number is to recognize that it is the sum
# of the first n integers. Thus, the nth triangular number t-sub-n = n(n+1)/2. We then iterate
# over all integers from 1 to ceil(sqrt(t-sub-n)). We don't need to test above the square root
# of t-sub-n because all divisors above this point will have a corresponding multiplying factor
# below sqrt(t-sub-n) that would have already been discovered. Hence, when we find one divisor
# below this point, we actually increment numDivisors by 2. The exception is if t-sub-n is a
# perfect square. In this case, sqrt(t-sub-n) is only counted once, so we decrement numDivisors
# by 1, having overcounted in the previous step.

while True:
    numDivisors = 0
    triangularNumber = (n) * (n + 1) / 2
    for divisor from 0 < divisor <= <int>ceil(sqrt(triangularNumber)):
        if triangularNumber % divisor == 0:
            numDivisors += 2
        if divisor == sqrt(triangularNumber):
            numDivisors -= 1
    if numDivisors > 500:
        print triangularNumber
        break
    n += 1