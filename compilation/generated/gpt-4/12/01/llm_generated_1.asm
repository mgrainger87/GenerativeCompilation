//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Compare double1 and double2
fcmp    d0, d1

// Branch if greater to thenPart
b.gt    1f

// Else part
sub     w4, w0, w1           // int1 - int2
str     w4, [x2]             // Store the result to *outInt
fmov    d0, d1               // Move double2 to outDouble
str     d0, [x3]
ret

1:  // Then part
add     w4, w0, w1           // int1 + int2
str     w4, [x2]             // Store the result to *outInt
str     d0, [x3]             // Store double1 to *outDouble
ret
