# What is the largest prime factor of the number 600851475143?

cdef extern from "math.h":
    double sqrt(double x)
    int ceil(double x)

cdef double targetPrime = 600851475143

primeFactors = []

# This uses Fermat's method to factorize integers. It relies on
# the fact that all odd integers can be represented as the difference
# of two squares: N = a^2 - b^2 = (a + b)(a - b). We start by picking
# a as the smallest integer greater than √N. We increment a until we 
# find b such that b is a perfect square: b = √(a^2 - N). N can thus 
# be decomposed into the factors (a + b) and (a - b). We then recursively
# perform Fermat's method on each of these two factors until we find a prime.

cdef void FermatFactorize(double composite):
    cdef int a = ceil(sqrt(composite))
    cdef double b = sqrt(a**2 - composite)
    while b % 1 != 0:
        a += 1
        b = sqrt(a**2 - composite)
    cdef double factor1 = a + b
    cdef double factor2 = a - b
    if factor2 == 1:
        global primeFactors
        primeFactors.append(<int>factor1)
    else:
        FermatFactorize(factor1)
        FermatFactorize(factor2)

FermatFactorize(targetPrime)

print max(primeFactors)