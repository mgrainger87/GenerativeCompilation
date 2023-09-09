.global _customFunction
.align 3
_customFunction:
// Subtract int2 (x1) from int1 (x0) and store the result in x4
sub x4, x0, x1

// Compare int2 to 0
cmp x1, #0

// Conditionally select between original int1 (x0) and the result (x4) based on comparison
csel x0, x0, x4, ne

// Store the result in *outInt
str w0, [x2]

ret
