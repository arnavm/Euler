# What is the largest prime factor of the number 600851475143?

cimport cython

cdef extern from "math.h":
    double sqrt(double x)
    int ceil(double x)

cdef double targetPrime = 600851475143

# After looking into several prime factorization algorithms,
# I settled on Fermat's factorization method.

primeFactors = []

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
        primeFactors.append(int(factor1))
    else:
        FermatFactorize(factor1)
        FermatFactorize(factor2)

FermatFactorize(targetPrime)

print max(primeFactors)