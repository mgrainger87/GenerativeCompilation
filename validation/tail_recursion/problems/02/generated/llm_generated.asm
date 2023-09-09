.global _customFunction
.align 3
_customFunction:
// Compare int2 (x1) with 0
cmp x1, #0
b.ne 1f

// If int2 == 0, set *outInt = int1 and return
str w0, [x2]
ret

1:  // Prepare for the recursive call
sub w0, w0, #1    // int1 - 1
sub w1, w1, #1    // int2 - 1
bl _customFunction
ret
