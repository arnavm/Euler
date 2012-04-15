# Find the sum of all the primes below two million.

cdef unsigned int[999999] odds
cdef unsigned int index

# We use the same approach as in problem 7. Initialize an array
# of all odd numbers > 3. For each non-zero entry, add the entry
# to a running sum, and replace all multiples of the entry with 0.
# The sum, sigma, is initialized to 2, the first and only even prime.
# The array odds only holds 999999 entries = 2 million/2 - 1 (1 is ignored)

for index from 0 <= index < 999999:
    odds[index] = 2*index + 3

cdef unsigned int subIndex, prime
cdef unsigned long sigma = 2

for index from 0 <= index < 999999:
    prime = odds[index]
    if prime != 0:
        sigma += prime
        for subIndex from index + prime <= subIndex < 999999 by prime:
            odds[subIndex] = 0

print sigma