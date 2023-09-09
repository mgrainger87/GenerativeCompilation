.global _customFunction
.align 3
_customFunction:
// Calculate temp = int1 - int2
sub x4, x0, x1

// Calculate mask = int2 | ~int2
mvn x5, x1        // x5 = ~int2
orr x5, x5, x1    // x5 = int2 | ~int2

// Use the mask to conditionally select between int1 and temp
and x0, x4, x5
bic x0, x0, x1

// Store the result in *outInt
str w0, [x2]

ret
