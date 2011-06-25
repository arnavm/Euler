# What is the smallest positive number that is 
# evenly divisible by all of the numbers from 1 to 20?

# This question asks us to find the least common multiple (LCM)
# of the first 20 natural numbers. We will use the fact that
# LCM(a, b) = (a * b)/GCD(a, b), where GCD is the greatest common divisor.
# This method uses the (very efficient) Euclidean algorithm to find the GCD.

cdef long gcd(long a, long b):
    if a == b:
        return a
    elif a > b:
        return gcd(a - b, b)
    elif a < b:
        return gcd(a, b - a)
    else:
        return 0

cdef long lcm(long a, long b):
    return (a * b)/gcd(a, b)

cdef long LCM = 1
cdef int natural

for 1 <= natural <= 20:
    LCM = lcm(LCM, natural)

print LCM