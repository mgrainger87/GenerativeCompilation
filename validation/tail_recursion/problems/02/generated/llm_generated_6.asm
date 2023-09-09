.global _customFunction
.align 3
_customFunction:
// Subtract int2 from int1 to get temp
sub x4, x0, x1

// Invert int2
mvn x5, x1
adds x5, x5, #1   // Add 1; set flags based on result

// Mask with 1 to get 0 (if int2 was 0) or 1 (if int2 was non-zero)
and x5, x5, #1

// Conditionally select between int1 and temp using the mask
// result = (1 - mask) * int1 + mask * temp
msub x0, x0, x5, x4

// Store the result in *outInt
str w0, [x2]

ret
