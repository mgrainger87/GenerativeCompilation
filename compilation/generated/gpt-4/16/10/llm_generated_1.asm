//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 4

_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Check if int1 is even (i.e., int1 % 2 == 0)
and w4, w0, #1  // w4 will hold the result of (int1 % 2). If w4 is 0, int1 is even.
cbz w4, .LisEven

.LisOdd:
// If int1 is odd, assign *outInt = int1 and *outDouble = double1
str w0, [x2]   // Store w0 (int1) to *outInt
str d0, [x3]   // Store d0 (double1) to *outDouble
b .Lend

.LisEven:
// If int1 is even, assign *outInt = int1 / 2 and *outDouble = double1 * 2.0
lsr w4, w0, #1   // Logical shift right by 1 is equivalent to division by 2
str w4, [x2]    // Store w4 to *outInt

fmov d4, #2.0   // Load immediate value 2.0 to d4
fmul d4, d0, d4 // Multiply double1 by 2.0
str d4, [x3]    // Store the result to *outDouble

.Lend:
// Restore link register and return
ldp x30, x29, [sp], #16
ret
