# Find the sum of all the multiples of 3 or 5 below 1000.

cdef int max_int, first_divisor, second_divisor
cdef int first_quotient, second_quotient, joint_quotient
cdef int first_sum, second_sum, joint_sum
cdef int total

# first_divisor and second_divisor must be mutually prime
# Otherwise, this method will overestimate the true sum

max_int = 1000 - 1
first_divisor = 3
second_divisor = 5

first_quotient = max_int/first_divisor
second_quotient = max_int/second_divisor
joint_quotient = max_int/(first_divisor * second_divisor)

# Sum up all integers from 0 to the quotient, relying on the
# fact that ∑ of the first n integers = (n)(n+1)/2
# Then, multiply by the divisors to get sum of all multiples
first_sum = (first_divisor) * (first_quotient) * (first_quotient + 1)/2
second_sum = (second_divisor) * (second_quotient) * (second_quotient + 1)/2
joint_sum = (first_divisor * second_divisor) * (joint_quotient) * (joint_quotient + 1)/2

# Calculate total using inclusion-exclusion principle:
# union(A, B) = A + B - intersection(A, B)

total = first_sum + second_sum - joint_sum

print total