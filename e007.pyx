# What is the 10001st prime number?

# The prime counting function π(n) gives the number of primes
# less than or equal to n. For example, π(10) = 4 (2, 3, 5, 7)
# For the first few values of 10^n, we have:
# n     π(10^n)
# 1     4
# 2     25
# 3     168
# 4     1229
# 5     9592
# 6     78498
# Thus, the 10001st prime lies between 10^5 and 10^6. Because
# the prime counting function cannot be solved analytically, we
# can only rely on discrete, predetermined data points. To save time,
# we could start from 10^5 and find the first 409 primes, but we would
# need to know the previous 9592 primes as well. The method below
# solves finding the Nth prime, given the table above. NthPrimeIdx
# indicates the index of the highest (odd) prime found so far.

cdef unsigned int NthPrimeIdx = 0
cdef unsigned int targetPrimeIdx = 10001

# Note that 2 is the first prime and is the only even prime. For efficiency's sake,
# we won't consider any even integers. Furthermore, we will start counting our
# primes starting with 3, as 1 is not prime. Thus, we need to find the 10000th odd prime.
# This array is first populated with all possible candidates.

targetPrimeIdx -= 1
cdef unsigned int odds[499999]
cdef unsigned int index

for index from 0 <= index < 499999:
    odds[index] = 2*index + 3

# The following loop implements the sieve of Eratosthenes.
# Instead of "crossing out" composites, we replace them with a zero.
# When we find the target prime, we print it and break out of the loop.

cdef unsigned int subIndex, prime

for index from 0 <= index < 499999:
    prime = odds[index]
    if prime != 0:
        NthPrimeIdx += 1
        if NthPrimeIdx == targetPrimeIdx:
            print prime
            break
        else:
            for subIndex from index + prime <= subIndex < 499999 by prime:
                odds[subIndex] = 0