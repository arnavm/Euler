# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

cdef unsigned int target = 1000

# The parent-child property says that all primitive Pythagorean triples can be
# generated from the first triple (3, 4, 5). For a given primitive (a, b, c):
#    new a            new b           new c
#  a - 2b + 2c     2a - b + 2c     2a - 2b + 3c
#  a + 2b + 2c     2a + b + 2c     2a + 2b + 3c
# −a + 2b + 2c    −2a + b + 2c    −2a + 2b + 3c
# We can iterate over these until we find a triple that either sums to the target
# number, or one that sums to a proper divisor of the target.

cdef void getNextPrimitiveTriples(unsigned int a, unsigned int b, unsigned int c):
    cdef unsigned int sigma = a + b + c
    cdef unsigned int multiplier
    if sigma == 1000:
        print a * b * c
        return
    elif 1000 % sigma == 0:
        multiplier = 1000/(a + b + c)
        print (a * multiplier) * (b * multiplier) * (c * multiplier)
    elif sigma > 1000:
        return
    else:
        pass
    
    cdef unsigned int a1 = a - 2*b + 2*c
    cdef unsigned int b1 = 2*a - b + 2*c
    cdef unsigned int c1 = 2*a - 2*b + 3*c
    
    cdef unsigned int a2 = a + 2*b + 2*c
    cdef unsigned int b2 = 2*a + b + 2*c
    cdef unsigned int c2 = 2*a + 2*b + 3*c
    
    cdef unsigned int a3 = -a + 2*b + 2*c
    cdef unsigned int b3 = -2*a + b + 2*c
    cdef unsigned int c3 = -2*a + 2*b + 3*c
    
    getNextPrimitiveTriples(a1, b1, c1)
    getNextPrimitiveTriples(a2, b2, c2)
    getNextPrimitiveTriples(a3, b3, c3)

getNextPrimitiveTriples(3, 4, 5)
