.global _customFunction
.align 3
_customFunction:
// Directly subtract int2 (x1) from int1 (x0)
sub w0, w0, w1

// Store the result in *outInt
str w0, [x2]

ret
