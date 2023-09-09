.global _customFunction
.align 3
_customFunction:
// Compare int2 to 0
cmp x1, #0

// Conditionally negate int2 if it's non-zero
cneg x1, x1, ne

// Add the potentially negated int2 to int1
add x0, x0, x1

// Store the result in *outInt
str w0, [x2]

ret
