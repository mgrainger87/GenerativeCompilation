//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Check if int1 is even
and     w4, w0, #1          // w4 = int1 % 2
cbz     w4, .Lis_even      // If w4 == 0 (int1 is even), branch to .Lis_even

// Odd path
str     w0, [x2]           // Store int1 to *outInt
str     d0, [x3]           // Store double1 to *outDouble
ret

.Lis_even:
// Even path
lsr     w4, w0, #1         // Right shift int1 by 1 (equivalent to int1 / 2)
str     w4, [x2]           // Store the result to *outInt
fmov    d4, #2.0           // Load 2.0 into d4
fmul    d4, d0, d4         // Multiply double1 by 2.0
str     d4, [x3]           // Store the result to *outDouble
ret
