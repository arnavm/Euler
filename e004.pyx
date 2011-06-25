# Find the largest palindrome made from the product of two 3-digit numbers.

cdef unsigned int target
cdef unsigned int integer1, integer2

# Convert number to a byte string and use Python's native string reversal
# capabilities to test if number is palindromic. This method is not as efficient
# as it could be because it relies on Python's API.

cdef bint isPalindrome(int number):
    cdef bytes n = str(number)
    if n == n[::-1]:
        return True
    else:
        return False

# To prevent checking unnecessary values, we assume integer2 >= integer1

cdef unsigned int maxPalindrome = 0

for 100 <= integer1 <= 999:
    for integer1 <= integer2 <= 999:
        target = integer1 * integer2
        if isPalindrome(target) and target > maxPalindrome:
            maxPalindrome = target

print maxPalindrome