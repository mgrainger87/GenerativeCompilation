.global _customFunction
.align 3
_customFunction:
// Convert int2 to a mask: 0 if int2 is 0, or 1 if int2 is non-zero
cmp x1, #0
cset x4, ne

// result = int1 - mask * int2
msub x0, x4, x1, x0

// Store the result in *outInt
str w0, [x2]

ret
