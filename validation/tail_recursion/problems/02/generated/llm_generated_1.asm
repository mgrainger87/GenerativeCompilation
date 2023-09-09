.global _customFunction
.align 3
_customFunction:
// Check if int2 (x1) is 0
cmp x1, #0
b.eq 1f

// Subtract int2 from int1 and store the result in x0
sub w0, w0, w1

1:  // Store the value of int1 in *outInt
str w0, [x2]
ret
