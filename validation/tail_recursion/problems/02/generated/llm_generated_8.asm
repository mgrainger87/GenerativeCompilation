.global _customFunction
.align 3
_customFunction:
// Convert int2 to a mask: 0 if int2 is 0, or -1 (all bits set) if int2 is non-zero
cmp x1, #0
csetm x4, ne

// Conditionally negate int2
and x1, x1, x4

// Add the potentially negated int2 to int1
add x0, x0, x1

// Store the result in *outInt
str w0, [x2]

ret
