# Find the difference between the sum of the squares of the 
# first one hundred natural numbers and the square of the sum.

# Special cases of Faulhaber's formula give expressions for the 
# sum of the first N integers, as well as the sum of the squares
# of the first N integers.
# ∑ 1, 2, ... N = (N)(N+1)/2
# ∑ 1, 4, ... N^2 = (N)(N+1)(2N+1)/6

cdef int sumOfFirstN(int N):
    return N * (N+1)/2

cdef int sumOfFirstNSquares(int N):
    return N * (N+1) * (2*N+1)/6

cdef int target = 100

cdef int total = (sumOfFirstN(target))**2 - sumOfFirstNSquares(target)

print total