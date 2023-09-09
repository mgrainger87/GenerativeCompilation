.global _customFunction
.align 3
_customFunction:
// Calculate the negation of int2
neg x4, x1

// If int2 is non-zero, x4's LSB will be 1. We shift it to make x4 = 1 if int2 was non-zero, and 0 otherwise.
and x4, x4, #1

// Calculate temp = int1 - int2
sub x5, x0, x1

// If x4 is 1, we want the result of subtraction. If x4 is 0, we want to keep int1 unchanged.
// res = (1 - x4) * int1 + x4 * (int1 - int2)
msub x0, x0, x4, x5

// Store the result in *outInt
str w0, [x2]

ret
